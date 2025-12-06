import { Routes } from '@angular/router';

import { TicketStatusComponent } from './pages/ticket-status/ticket-status.component';
import { KnowledgebaseEditorComponent } from './pages/knowledgebase-editor/knowledgebase-editor.component';
import { LiveLogsComponent } from './pages/live-logs/live-logs.component';


export const routes: Routes = [
  { path: 'ticket-status', component: TicketStatusComponent },
  { path: 'knowledgebase-editor', component: KnowledgebaseEditorComponent },
  { path: 'live-logs', component: LiveLogsComponent },
  { path: '', redirectTo: 'ticket-status', pathMatch: 'full' },
  { path: '**', redirectTo: 'ticket-status' } 
];
