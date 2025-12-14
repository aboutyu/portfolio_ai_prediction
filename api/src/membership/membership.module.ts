import { Module } from '@nestjs/common';
import { MembershipService } from './membership.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { MembershipController } from './membership.controller';
import { UserDevice } from 'src/entities/user-devices.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, UserDevice])],
  controllers: [MembershipController],
  providers: [MembershipService]
})
export class MembershipModule {}
