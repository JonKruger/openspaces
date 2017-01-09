import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SessionDetailComponent } from './session-detail.component';
import { SessionListComponent } from './session-list.component';

@NgModule({
  imports: [
    RouterModule.forChild([
      { path: '', component: SessionListComponent },
      { path: 'sessions', component: SessionListComponent },
      { path: 'sessions/new', component: SessionDetailComponent },
      { path: 'sessions/:id', component: SessionDetailComponent },
    ])
  ],
  exports: [RouterModule]
})
export class SessionRoutingModule { }
