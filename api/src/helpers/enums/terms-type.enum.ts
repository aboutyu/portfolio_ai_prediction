export enum TermsType {
  SERVICE = 'service',
  PRIVACY = 'privacy',
  MARKETING = 'marketing',
}

export const TermsTypeName: Record<TermsType, string> = {
  [TermsType.SERVICE]: '서비스 이용약관',
  [TermsType.PRIVACY]: '개인정보 처리방침',
  [TermsType.MARKETING]: '마케팅 활용 동의',
};
