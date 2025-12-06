export interface Ticket {
  id: string;
  subject: string;
  status: "Open" | "In Progress" | "Closed";
  createdAt: string;
}