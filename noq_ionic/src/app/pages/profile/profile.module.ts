import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';

import { ProfilePage } from './profile';
import { ScheduleFilterPage } from '../schedule-filter/schedule-filter';
import { ProfilePageRoutingModule } from './profile-routing.module';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        IonicModule,
        ProfilePageRoutingModule
    ],
    declarations: [
        ProfilePage,
        ScheduleFilterPage
    ]
})
export class HomeModule { }
