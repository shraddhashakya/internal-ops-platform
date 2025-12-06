export interface LogEntry {
  id: number;
  type: "INFO" | "WARN" | "ERROR" | "DEBUG";
  message: string;
  timestamp: string;
}
