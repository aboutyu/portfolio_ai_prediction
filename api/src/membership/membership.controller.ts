import { Body, Controller, Delete, Post } from '@nestjs/common';
import { MembershipService } from './membership.service';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { LoginDto } from 'src/dto/membership.login.dto';
import { SignupDto } from 'src/dto/membership.signup.dto';
import { LeaveDto } from 'src/dto/membership.leave.dto';
import { LogoutDto } from 'src/dto/membership.logout.dto';
import { Public } from 'src/auth/decorators/public.decorator';
import { RequestTokenDto } from 'src/dto/membership.requestToken.dto';
import { FailureCode, failureResponse } from 'src/helpers/enums/status.enum';

@ApiTags('회원관리 관련 API')
@Controller('membership')
export class MembershipController {
  constructor(private readonly membershipService: MembershipService) { }
  
  @Public()
  @Post('login')
  @ApiOperation({ summary: '로그인 API', description: '사용자 로그인 처리' })
  async login(@Body() data: LoginDto) {
    return await this.membershipService.login(data);
  }

  @Public()
  @Post('requestToken')
  @ApiOperation({ summary: '자동로그인 및 access token 갱신 API', description: '사용자 로그인 처리' })
  async requestToken(@Body() data: RequestTokenDto) {
    return await this.membershipService.requestToken(data);
  }

  @Delete('logout')
  @ApiOperation({ summary: '로그아웃 API', description: '사용자 로그아웃 처리' })
  async logout(@Body() data: LogoutDto) {
    return await this.membershipService.logout(data);
  }

  @Public()
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
