import { Component } from '@angular/core';
import { LogsService } from '../../core/services/logs-service';
import { LogEntry } from '../../core/models/log-entry.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-live-logs',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './live-logs.component.html',
})
export class LiveLogsComponent {

  logs: LogEntry[] = [];

  private allLogs: LogEntry[] = []; // all logs from service
  private currentIndex = 0;

  constructor(private logsService: LogsService) { }
  ngOnInit() {
    this.startLiveLogs();
  }
  startLiveLogs() {
    //newest displayed first
    this.allLogs = [...this.logsService.getRandomLogs(1000)].reverse();
    this.logs = [];
    this.currentIndex = 0;

    this.emitNextLog();
  }

  private emitNextLog() {
    if (this.currentIndex >= this.allLogs.length) return;

    const log = this.allLogs[this.currentIndex];
    this.logs = [log, ...this.logs];
    this.currentIndex++;

    // Random delay of logs between 200ms and 1500ms 
    const delay = 200 + Math.random() * 1300;

    setTimeout(() => this.emitNextLog(), delay);
  }
}
