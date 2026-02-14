import * as Handlebars from 'handlebars';
import { pageSize } from '../constants';

// eq helper: 두 값이 동일한지 비교
export const eqHelper = (a: any, b: any, isTrue?: any, isFalse?: any) => {
  const result = a === b;
  if (isTrue !== undefined && isFalse !== undefined) {
    return result ? isTrue : isFalse;
  }
  return result;
};

export const containsHelper = function (
  list,
  value,
  isTrue?: any,
  isFalse?: any,
) {
  if (Array.isArray(list) && list.includes(value)) {
    return isTrue !== undefined ? isTrue : true;
  }
  return isFalse !== undefined ? isFalse : false;
};

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

// 3. 게시판에서 no 헬퍼
export const calculateTableNo = (
  total: number,
  currentPage: number,
  index: number,
) => {
  return total - currentPage * pageSize - index;
};

/**
 * 게시판 하단 페이지네이션 헬퍼
 * @param total 전체 아이템 개수
 * @param page 현재 페이지 (0-based)
 * @param pageSize 페이지당 아이템 개수
 * @param searchDto 검색 조건 객체 (SearchListDto)
 */
/**
 * 게시판 하단 페이지네이션 헬퍼 (1페이지 고정 노출)
 */
export const paginationHelper = (total, page, pageSize, searchDto, options) => {
  const actualSearchDto =
    searchDto &&
    typeof searchDto === 'object' &&
    !searchDto.hasOwnProperty('hash')
      ? searchDto
      : null;

  // 전체 페이지 계산 (데이터가 없어도 최소 1페이지로 설정)
  const totalPages = Math.ceil(total / pageSize) || 1;
  const blockLimit = 5;
  const currentBlock = Math.floor(page / blockLimit);

  const startPage = currentBlock * blockLimit + 1;
  let endPage = startPage + blockLimit - 1;
  if (endPage > totalPages) endPage = totalPages;

  const getQueryString = (targetPage) => {
    const params = new URLSearchParams();
    params.append('page', targetPage);

    if (actualSearchDto) {
      const excludeKeys = ['page', 'skip', 'take', 'pageSize', 'sequence'];
      Object.keys(actualSearchDto).forEach((key) => {
        const value = actualSearchDto[key];
        if (
          !excludeKeys.includes(key) &&
          value !== undefined &&
          value !== null &&
          value !== ''
        ) {
          if (typeof value === 'function') return;
          if (Array.isArray(value)) {
            value.forEach((v) => params.append(key, v));
          } else {
            const finalValue =
              typeof value === 'boolean' ? (value ? 'Y' : 'N') : value;
            params.append(key, finalValue);
          }
        }
      });
    }
    return `?${params.toString()}`;
  };

  let html = `<ul class="pagination">`;

  // 1. 이전 버튼 (<)
  const hasPrev = startPage > 1;
  const prevPage = startPage - 2;
  html += `
    <li class="${hasPrev ? 'waves-effect' : 'disabled'}">
      <a href="${hasPrev ? getQueryString(prevPage) : 'javascript:void(0);'}">
        <i class="material-icons">chevron_left</i>
      </a>
    </li>`;

  // 2. 페이지 번호들 (데이터가 없어도 최소 1은 출력됨)
  for (let i = startPage; i <= endPage; i++) {
    const isCurrent = i - 1 === page;
    html += `
      <li class="${isCurrent ? 'active' : 'waves-effect'}">
        <a href="${getQueryString(i - 1)}">${i}</a>
      </li>`;
  }

  // 3. 다음 버튼 (>)
  const hasNext = endPage < totalPages;
  const nextPage = endPage;
  html += `
    <li class="${hasNext ? 'waves-effect' : 'disabled'}">
      <a href="${hasNext ? getQueryString(nextPage) : 'javascript:void(0);'}">
        <i class="material-icons">chevron_right</i>
      </a>
    </li>`;

  html += `</ul>`;

  // totalPages가 1일 때도 html을 그대로 반환합니다.
  return html;
};

// helper 등록하는 함수
export const registerHandlebarsHelpers = (handlebars: typeof Handlebars) => {
  handlebars.registerHelper('eq', eqHelper);
  handlebars.registerHelper('contains', containsHelper);
  handlebars.registerHelper('address', addressHelper);
  Handlebars.registerHelper('truncateText', truncateTextHelper);
  Handlebars.registerHelper('formatTimestamp', formatTimestampHelper);
  Handlebars.registerHelper('calculateTableNo', calculateTableNo);
  Handlebars.registerHelper('pagination', paginationHelper);
};
