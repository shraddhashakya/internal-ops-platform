import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Ticket } from '../../core/models/ticket.model';
import { MOCK_TICKETS, TicketStatus } from '../../data/mock-tickets';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-ticket-status',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './ticket-status.component.html',
  styleUrl: './ticket-status.component.css'
})
export class TicketStatusComponent {
  tickets: Ticket[] = [];
  filteredTickets: Ticket[] = [...this.tickets];

  selectedStatus: 'All' | TicketStatus = 'All';



  ngOnInit() {
    this.tickets = MOCK_TICKETS;
    this.filteredTickets = [...this.tickets];
  }

  filterStatus(): void {
    if (this.selectedStatus === 'All') {
      this.filteredTickets = [...this.tickets];
    } else {
      this.filteredTickets = this.tickets.filter(
        t => t.status === this.selectedStatus
      );
    }
  }

}
