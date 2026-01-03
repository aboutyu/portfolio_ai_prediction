import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MembershipService } from './membership.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { MembershipController } from './membership.controller';
import { UserDevice } from 'src/entities/user-devices.entity';
import { CertTokenService } from 'src/auth/cert-token.service';
import { JwtModule, JwtModuleOptions } from '@nestjs/jwt';
import { Terms } from 'src/entities/terms.entity';

@Module({
  imports: [
    JwtModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (
        configService: ConfigService,
      ): Promise<JwtModuleOptions> => ({
        secret:
          configService.get<string>('JWT_ACCESS_SECRET') || 'defaultSecretKey',
        signOptions: {
          expiresIn:
            configService.get<string>('ACCESS_TOKEN_EXPIRES_IN') ||
            ('24h' as any),
        },
      }),
    }),
    TypeOrmModule.forFeature([User, UserDevice, Terms]),
  ],
  controllers: [MembershipController],
  providers: [MembershipService, CertTokenService],
})
export class MembershipModule {}
