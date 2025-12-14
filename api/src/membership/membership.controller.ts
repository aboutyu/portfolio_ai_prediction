import { Body, Controller, Delete, Post } from '@nestjs/common';
import { MembershipService } from './membership.service';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { LoginDto } from 'src/dto/membership.login.dto';
import { SignupDto } from 'src/dto/membership.signup.dto';
import { LeaveDto } from 'src/dto/membership.leave.dto';
import { LogoutDto } from 'src/dto/membership.logout.dto';

@ApiTags('회원관리 관련 API')
@Controller('membership')
export class MembershipController {
  constructor(private readonly membershipService: MembershipService) { }
  
  @Post('login')
  @ApiOperation({ summary: '로그인 API', description: '사용자 로그인 처리' })
  async login(@Body() data: LoginDto) {
    return await this.membershipService.login(data);
  }

  @Delete('logout')
  @ApiOperation({ summary: '로그아웃 API', description: '사용자 로그아웃 처리' })
  async logout(@Body() data: LogoutDto) {
    return await this.membershipService.logout(data);
  }

  @Post('signup')
  @ApiOperation({ summary: '회원가입 API', description: '사용자 회원가입 처리' })
  async signup(@Body() data: SignupDto) {
    return await this.membershipService.signup(data);
  }

  @Delete('leave')
  @ApiOperation({ summary: '회원탈퇴 API', description: '사용자 회원탈퇴 처리' })
  async leave(@Body() data: LeaveDto) {
    return await this.membershipService.leave(data);
  }
}
