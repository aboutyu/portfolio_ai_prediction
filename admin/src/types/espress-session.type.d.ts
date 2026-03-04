import 'express-session';

declare module 'express-session' {
  interface SessionData {
    sequence?: number;
    adminName?: string;
    adminId?: string;
    createTime?: Date;
  }
}
