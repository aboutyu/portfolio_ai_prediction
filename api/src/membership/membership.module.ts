import { Module } from '@nestjs/common';
import { MembershipService } from './membership.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { MembershipController } from './membership.controller';
import { UserDevice } from 'src/entities/user-devices.entity';
import { CertTokenService } from 'src/auth/cert-token.service';
import { Terms } from 'src/entities/terms.entity';
import { jwtModule } from 'src/configures/jwt-module';

@Module({
  imports: [jwtModule, TypeOrmModule.forFeature([User, UserDevice, Terms])],
  controllers: [MembershipController],
  providers: [MembershipService, CertTokenService],
})
export class MembershipModule {}
