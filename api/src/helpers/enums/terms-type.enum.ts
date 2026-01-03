export enum TermsType {
  SERVICE = 'service',
  PRIVACY = 'privacy',
}

export const TermsTypeName: Record<TermsType, string> = {
  [TermsType.SERVICE]: '서비스 이용약관',
  [TermsType.PRIVACY]: '개인정보 처리방침',
};
