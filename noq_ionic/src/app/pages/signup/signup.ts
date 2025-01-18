import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';

import { UserData } from '../../providers/user-data';

import { UserOptions } from '../../interfaces/user-options';



@Component({
  selector: 'page-signup',
  templateUrl: 'signup.html',
  styleUrls: ['./signup.scss'],
})
export class SignupPage {
  //signup: UserOptions = { fullname : '', mobile : '', email :'', username: '', password: '' };
  signup: UserOptions = {  user_name: '', password: '' };
  submitted = false;

  constructor(
    public router: Router,
    public userData: UserData
  ) {}

  onSignup(form: NgForm) {
    this.submitted = true;

    if (form.valid) {
      this.userData.signup(this.signup.user_name);
      this.router.navigateByUrl('/app/tabs/schedule');
    }
  }
}
