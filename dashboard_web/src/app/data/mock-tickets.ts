import { Ticket } from "../core/models/ticket.model";
export const MOCK_TICKETS: Ticket[] = [];
export type TicketStatus = "Open" | "In Progress" | "Closed";
for (let i = 0; i < 200; i++) {
  const id = `TV${String(i+1).padStart(2, '0')}`;
  const subjects = [
    "Cannot login to email",
    "Printer not working",
    "Software installation request",
    "Network connectivity issue",
    "Request for hardware upgrade",
    "Password reset",
    "Application crash",
    "File access issue",
    "Email not sending",
    "VPN connection problem",
    "Computer running slow",
    "Software license expired",
    "Access denied to shared folder",
    "Blue screen error",
    "Monitor flickering",
    "Phone not syncing",
    "Audio not working",
    "Slow internet",
    "Failed backup",
    "Database connection error",
    "Keyboard not responding",
    "Software update failed",
    "Account locked",
    "Video conference issue",
    "Mobile app crash",
    "Disk space low",
    "Network printer offline",
    "Two-factor authentication problem",
    "Server downtime",
    "Email bounce back",
    "Website loading slowly",
    "VPN disconnects frequently",
    "Firewall blocking application",
    "Password expired",
    "Unable to install driver",
    "System overheating",
    "Lost files recovery",
    "Error 404 page",
    "Cannot sync calendar"
  ];
  const statusOptions: TicketStatus[] = ["Open", "In Progress", "Closed"];
  const subject = subjects[i % subjects.length] + ' #' + (i+1); // unique subject
  const status = statusOptions[i % statusOptions.length];
  const createdAt = new Date(2025, 0, 1, 9 + Math.floor(i/4), (i%4)*15).toISOString().replace('T',' ').split('.')[0];

  MOCK_TICKETS.push({ id, subject, status, createdAt });
}