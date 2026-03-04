import { ApiResponse } from '../dto/api.response.dto';
import { PageResponseDto } from '../dto/page.response.dto';

export enum StatusCode {
  SUCCESS = 'success',
  ERROR = 'error',
  FAILED = 'failed',
}

export enum ErrorCode {
  FORBIDDEN = 'forbidden',
  INTERNAL_ERROR = 'internalError',
}

export enum FailureCode {
  UNAUTHORIZED = 'unauthorized',
  NOT_FOUND_USER = 'notFoundUser',
  LOGIN_FAILED = 'loginFailed',
  SIGNUP_EXISTING_USER = 'signupExistingUser',
  NOT_IMPLEMENTED = 'notImplemented',   // 실행 실패
  DO_NOT_HAVE_SEQUENCE = 'doNotHaveSequence', // sequence 값이 없음
  INVALID_PARAM = 'invalidParam', // 잘못된 파라미터
  DO_NOT_HAVE_DATA = 'doNotHaveData', // 데이터가 없음
}

export function successResponse<T>(
  data: T,
  page?: number,
  totalCount?: number,
  pageCount?: number,
  pageNum?: number
): ApiResponse<T> {
  // paging 변수의 타입을 'PageResponseDto 또는 null'로 지정
  const paging: PageResponseDto | null = 
    (page !== undefined && totalCount !== undefined && pageNum !== undefined)
      ? {
          page: page,
          totalCount: totalCount,
          pageCount: pageCount ?? 0,
          pageNum: pageNum,
        }
      : null;

  return {
    status: StatusCode.SUCCESS,
    pageInfo: paging ?? undefined,
    data: data,
  };
}

export function errorResponse(code: ErrorCode): ApiResponse<null> {
  return {
    status: StatusCode.ERROR,
    code: code,
  };
}

export function failureResponse(code: FailureCode): ApiResponse<null> {
  return {
    status: StatusCode.FAILED,
    code: code,
  };
}
