import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';

//import { UserData } from '../../providers/user-data';
import { CommonService } from '../../providers/common.service';

import { UserOptions } from '../../interfaces/user-options';



@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
  styleUrls: ['./login.scss'],
})
export class LoginPage {
  login: UserOptions = {  user_name: '', password: '' };
  submitted = false;

  constructor(
    //public userData: UserData,
    public commanServices: CommonService,
    public router: Router
  ) { }

  onLogin(form: NgForm) {
    this.submitted = true;
   // debugger;
    if (form.valid) {
      //this.userData.login(this.login.username);
      //this.commanServices.login(this.login);
      this.commanServices.login(this.login).subscribe(
        response => {
          console.log('API Response:', response);
        },
        error => {
          console.error('API Error:', error);
        }
      );
      //this.router.navigateByUrl('/app/tabs/schedule');
    }
  }

  onSignup() {
    this.router.navigateByUrl('/signup');
  }
}
