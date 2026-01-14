import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtModule, JwtModuleOptions } from '@nestjs/jwt';

export const jwtModule = JwtModule.registerAsync({
  imports: [ConfigModule],
  inject: [ConfigService],
  useFactory: async (
    configService: ConfigService,
  ): Promise<JwtModuleOptions> => ({
    secret:
      configService.get<string>('JWT_ACCESS_SECRET') || 'defaultSecretKey',
    signOptions: {
      expiresIn:
        configService.get<string>('ACCESS_TOKEN_EXPIRES_IN') || ('24h' as any),
    },
  }),
});
