import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';

import { BookingPage } from './booking';
//import { ScheduleFilterPage } from '../schedule-filter/schedule-filter';
import { BookingPageRoutingModule } from './booking-routing.module';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        IonicModule,
        BookingPageRoutingModule
    ],
    declarations: [
        BookingPage
        //ScheduleFilterPage
    ]
})
export class  BookingModule { }
