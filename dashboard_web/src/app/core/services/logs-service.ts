import { Injectable } from '@angular/core';
import { MOCK_LOGS } from '../../data/mock-logs';
import { LogEntry } from '../models/log-entry.model';

@Injectable({
  providedIn: 'root'
})
export class LogsService {

  getLogs(): LogEntry[] {
    return MOCK_LOGS;
  }

  getRandomLogs(count: number = 100): LogEntry[] {
    return MOCK_LOGS.sort(() => Math.random() - 0.5).slice(0, count);
  }
}
