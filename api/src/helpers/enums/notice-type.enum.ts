export enum NoticeType {
  NOTICE = 'notice', // DB 저장값: notice
  FAQ = 'faq', // DB 저장값: faq
}

// "공지사항", "FAQ"라고 한글로 내려줄 때 사용
export const NoticeTypeLabel: Record<NoticeType, string> = {
  [NoticeType.NOTICE]: '공지사항',
  [NoticeType.FAQ]: 'FAQ',
};
