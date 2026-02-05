import * as Handlebars from 'handlebars';

// eq helper: 두 값이 동일한지 비교
export const eqHelper = (a: any, b: any) => a === b;

// address helper: nullable한 zipcode, address1, address2를 합쳐서 주소를 만듦
export const addressHelper = (
  zipcode: string,
  address1: string,
  address2: string,
) => {
  if (!address1) return ''; // addr_1이 없으면 아무것도 표시하지 않음
  let formattedAddress = '';
  if (zipcode) {
    formattedAddress += `(${zipcode}) `;
  }

  formattedAddress += address1;
  if (address2) {
    formattedAddress += ` ${address2}`;
  }
  return formattedAddress;
};

// 1. 텍스트를 10자 이후 `...`으로 축약하는 헬퍼
export const truncateTextHelper = (text: string, length = 10) => {
  if (!text) return '';
  return text.length > length ? text.substring(0, length) + '...' : text;
};

// 2. MySQL TIMESTAMP를 `YYYY-MM-DD (요일) HH:MM` 형식으로 변환하는 헬퍼
export const formatTimestampHelper = (timestamp: string | number | Date) => {
  if (!timestamp) return '';

  const date = new Date(timestamp);
  const days = ['일', '월', '화', '수', '목', '금', '토'];

  const yyyy = date.getFullYear();
  const mm = String(date.getMonth() + 1).padStart(2, '0'); // 월 (0부터 시작)
  const dd = String(date.getDate()).padStart(2, '0'); // 일
  const day = days[date.getDay()]; // 요일
  const hh = String(date.getHours()).padStart(2, '0'); // 시
  const min = String(date.getMinutes()).padStart(2, '0'); // 분

  return `${yyyy}-${mm}-${dd} (${day}) ${hh}:${min}`;
};

// helper 등록하는 함수
export const registerHandlebarsHelpers = (handlebars: typeof Handlebars) => {
  handlebars.registerHelper('eq', eqHelper);
  handlebars.registerHelper('address', addressHelper);
  Handlebars.registerHelper('truncateText', truncateTextHelper);
  Handlebars.registerHelper('formatTimestamp', formatTimestampHelper);
};
