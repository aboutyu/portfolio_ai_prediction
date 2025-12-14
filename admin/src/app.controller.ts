import { Controller, Get, Render } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
  ) { }

  @Get()
  @Render('index')
  async loginIndex() {
    return await this.appService.loginIndex();
  }

  @Get('import/excel')
  async importExcel() {
    const excelData = await this.appService.readExcelFileAndSaveItems();
    // const excelData = await this.appService.readExcelFileAndSaveFoods();
    return excelData;
  }
}
