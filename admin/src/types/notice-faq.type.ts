export enum NoticeFaqType {
  USER = 'user', // DB 저장값: notice
  SERVICE = 'service', // DB 저장값: faq
  PAYMENT = 'payment', // DB 저장값: payment
}

// "회원", "서비스", "결제"라고 한글로 내려줄 때 사용
export const NoticeFaqLabel: Record<NoticeFaqType, string> = {
  [NoticeFaqType.USER]: '회원',
  [NoticeFaqType.SERVICE]: '서비스',
  [NoticeFaqType.PAYMENT]: '결제',
};

export const faqKinds = Object.entries(NoticeFaqLabel).map(([key, value]) => ({
  id: key, // 'user', 'service', 'payment'
  faqName: value, // '회원', '서비스', '결제'
}));
