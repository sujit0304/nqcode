import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';

import { ConfirmPage } from './confirm';
//import { ScheduleFilterPage } from '../schedule-filter/schedule-filter';
import { ConfirmPageRoutingModule } from './confirn-routing.module';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        IonicModule,
        ConfirmPageRoutingModule
    ],
    declarations: [
        ConfirmPage
        //ScheduleFilterPage
    ]
})
export class  ConfirmModule { }
