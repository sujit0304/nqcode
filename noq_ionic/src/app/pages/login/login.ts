import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { Platform, LoadingController, AlertController, NavController } from '@ionic/angular';
//import { UserData } from '../../providers/user-data';
import { CommonService } from '../../providers/common.service';
import { UserOptions } from '../../interfaces/user-options';
import { Storage } from '@ionic/storage-angular';


@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
  styleUrls: ['./login.scss'],
})
export class LoginPage {
  login: UserOptions = {  user_name: '', password: '' };
  submitted = false;

  constructor(
    public navCtrl: NavController, 
    private storage: Storage,
    public loadingController: LoadingController,
    public plt: Platform,
    public commanServices: CommonService,
    public router: Router
  ) { }

  onLogin(form: NgForm) {
    this.submitted = true;
   // debugger;
    if (form.valid) {
      this.commanServices.login(this.login).subscribe(
        response => {
          console.log('API Response:', response);
          console.log('token:', response.token);
          console.log('userdetails:', response.user_detail);
          this.storage.set('token', response.token);
          this.storage.set('userDetails', response.user_detail);
          this.router.navigateByUrl('/home');
        },
        error => {
          console.error('API Error:', error);
        }
      );
      
    }
  }

  onSignup() {
    this.router.navigateByUrl('/signup');
  }
}
