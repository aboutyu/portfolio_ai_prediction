declare global {
    interface String {
        getTimeToDay(): { startDate: Date, endDate: Date };
    }
}

String.prototype.getTimeToDay = function(): { startDate: Date, endDate: Date } {
  const datePart = this.substring(0, 10);
  const startDate = new Date(`${datePart} 00:00:00.000Z`);
  const endDate = new Date(`${datePart} 23:59:59.999Z`);
  return { startDate, endDate };
}
