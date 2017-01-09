import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SessionListComponent } from './session-list.component';
import { SessionDetailComponent } from './session-detail.component';
import { SessionRoutingModule } from './session-routing.module';
import { SharedModule } from '../shared/shared.module';
import { SessionService } from './session.service';

@NgModule({
  imports: [CommonModule, SessionRoutingModule, SharedModule],
  declarations: [SessionListComponent, SessionDetailComponent],
  exports: [SessionListComponent, SessionDetailComponent],
  providers: [SessionService]
})
export class SessionModule { }
