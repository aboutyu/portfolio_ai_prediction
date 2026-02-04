import {
  Body,
  Controller,
  Delete,
  Get,
  NotFoundException,
  Post,
  Query,
  Res,
} from '@nestjs/common';
import type { Response } from 'express';
import { MembershipService } from './membership.service';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { LoginDto } from 'src/dto/membership.login.dto';
import { SignupDto } from 'src/dto/membership.signup.dto';
import { LeaveDto } from 'src/dto/membership.leave.dto';
import { LogoutDto } from 'src/dto/membership.logout.dto';
import { Public } from 'src/auth/decorators/public.decorator';
import { RequestTokenDto } from 'src/dto/membership.requestToken.dto';
import { TermsDto } from 'src/dto/membership.terms.dto';
import * as fs from 'fs';
import path from 'path';

@ApiTags('회원관리 관련 API')
@Controller('membership')
export class MembershipController {
  constructor(private readonly membershipService: MembershipService) {}

  @Public()
  @Post('login')
  @ApiOperation({ summary: '로그인 API', description: '사용자 로그인 처리' })
  async login(@Body() data: LoginDto) {
    return await this.membershipService.login(data);
  }

  @Public()
  @Post('requestToken')
  @ApiOperation({
    summary: '자동로그인 및 access token 갱신 API',
    description: '사용자 로그인 처리',
  })
  async requestToken(@Body() data: RequestTokenDto) {
    return await this.membershipService.requestToken(data);
  }

  @Delete('logout')
  @ApiOperation({
    summary: '로그아웃 API',
    description: '사용자 로그아웃 처리',
  })
  async logout(@Body() data: LogoutDto) {
    return await this.membershipService.logout(data);
  }

  @Public()
  @Post('signup')
  @ApiOperation({
    summary: '회원가입 API',
    description: '사용자 회원가입 처리',
  })
  async signup(@Body() data: SignupDto) {
    return await this.membershipService.signup(data);
  }

  @Delete('leave')
  @ApiOperation({
    summary: '회원탈퇴 API',
    description: '사용자 회원탈퇴 처리',
  })
  async leave(@Body() data: LeaveDto) {
    return await this.membershipService.leave(data);
  }

  @Public()
  @Get('terms/list')
  @ApiOperation({
    summary: '활성화된 약관 목록 조회 API',
    description: '활성화된 모든 약관을 조회하여 반환',
  })
  async termsList() {
    return await this.membershipService.terms();
  }

  @Public()
  @Get('terms/html')
  @ApiOperation({
    summary: '서비스 약관 보여주는 HTML',
    description: '서비스 이용약관 및 개인정보 처리방침 내용을 HTML로 반환',
  })
  async termsHtml(@Query() data: TermsDto, @Res() res: Response) {
    const html = await this.membershipService.termsHtml(data);
    const termData = html?.data;

    if (!termData) {
      throw new NotFoundException('조건에 맞는 약관이 없습니다.');
    }

    try {
      const templatePath = path.join(
        process.cwd(),
        'dist',
        'resources',
        'terms',
        'terms.html',
      );

      // 3. 파일 읽기 (동기 방식으로 읽어도 무방)
      let htmlTemplate = fs.readFileSync(templatePath, 'utf8');

      // 4. 내용 치환 (HTML 파일 안에 {{title}}, {{content}} 라고 적혀있어야 함)
      htmlTemplate = htmlTemplate.replace('{{terms_title}}', termData.title);
      htmlTemplate = htmlTemplate.replace('{{title}}', termData.termsName);
      htmlTemplate = htmlTemplate.replace('{{content}}', termData.content);
      htmlTemplate = htmlTemplate.replace(
        '{{create_date}}',
        termData.createDate.toISOString().split('T')[0],
      );

      // 5. HTML 응답 전송
      res.setHeader('Content-Type', 'text/html');
      res.send(htmlTemplate);
    } catch (error) {
      console.error('HTML 파일 로드 실패:', error);
      throw new NotFoundException('약관 템플릿 파일을 찾을 수 없습니다.');
    }
  }

  @Public()
  @Get('userguide/html')
  @ApiOperation({
    summary: '사용자 가이드 보여주는 HTML',
    description: '사용자 가이드 내용을 HTML로 반환',
  })
  async userGuideHtml(@Res() res: Response) {
    try {
      const templatePath = path.join(
        process.cwd(),
        'dist',
        'resources',
        'userguide',
        'userguide.html',
      );

      let htmlTemplate = fs.readFileSync(templatePath, 'utf8');
      res.setHeader('Content-Type', 'text/html');
      res.send(htmlTemplate);
    } catch (error) {
      console.error('HTML 파일 로드 실패:', error);
      throw new NotFoundException('약관 템플릿 파일을 찾을 수 없습니다.');
    }
  }
}
