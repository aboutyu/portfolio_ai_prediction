import * as Handlebars from 'handlebars';

// eq helper: 두 값이 동일한지 비교
export const eqHelper = (a: any, b: any) => a === b;

// helper 등록하는 함수
export const registerHandlebarsHelpers = (handlebars: typeof Handlebars) => {
  handlebars.registerHelper('eq', eqHelper);
};
