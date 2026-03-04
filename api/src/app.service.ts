import { Injectable } from '@nestjs/common';
import * as fs from 'fs';
import * as path from 'path';

@Injectable()
export class AppService {
  getHello(lang?: string): string {
    const getFilePath = () => {
      if (lang === 'en') {
        return path.join(__dirname, '/resources/resume/en.html');
      } else if (lang === 'ko') {
        return path.join(__dirname, '/resources/resume/ko.html');
      } else {
        return path.join(__dirname, '/resources/hello.html');
      }
    };
    const htmlContent = fs.readFileSync(getFilePath(), 'utf8');
    return htmlContent;
  }
}
