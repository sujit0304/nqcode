import { Injectable } from '@angular/core';
import { AlertController } from '@ionic/angular';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { EMPTY, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Storage } from '@ionic/storage-angular';


@Injectable({
    providedIn: 'root'
  })
  export class CommonService {
    //url = 'http://52.66.239.185/api';
    url = 'http://localhost:23835/api';
    apiKey = ''; 

  _AppID: any = 'com.noq';
  _AppVersion: any = '0.1.1'
  _AppName: any = 'NOQ'
  _ORG_ID: any = 1;
  _AppVersionNo: number = 100;

  constructor(public storage: Storage,
    private http: HttpClient, 
    public alertController: AlertController) 
   {}
  
   login(UsersModels: any): Observable<any> 
   {
    console.log("call");
        /*try{
          let headers = new HttpHeaders()
          //.set("Accept", "application/json")
          //.set("Content-Type", "application/json")
          .set("Access-Control-Allow-Origin", "*")
          .set("Access-Control-Allow-Credentials", "true")
          .set(
            "Access-Control-Allow-Headers",
            "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
          );
        
            console.log(this.url + "/User/Authenticate");
            return this.http.post(this.url + "/User/Authenticate", UsersModels, { headers });
         }
        catch (e) 
        {
        }*/
       /* try {
          let headers = new HttpHeaders()
            .set("Access-Control-Allow-Origin", "*")
            .set("Access-Control-Allow-Credentials", "true")
            .set(
              "Access-Control-Allow-Headers",
              "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
            )
            .set("Content-Type", "application/x-www-form-urlencoded"); // Specify URL-encoded content type
        
          // Convert JSON to URL-encoded format
          const body = new URLSearchParams();
          for (const key in UsersModels) {
            if (UsersModels.hasOwnProperty(key)) {
              body.set(key, UsersModels[key]);
            }
          }
        
          console.log(this.url + "/User/Authenticate");
          return this.http.post(this.url + "/User/Authenticate", body.toString(), { headers });
        } catch (e) {
          console.error(e); // Log the error for debugging
        }*/
          try {
            let headers = new HttpHeaders()
                .set("Content-Type", "application/x-www-form-urlencoded");
        
            const body = new URLSearchParams();
            body.set("user_name", UsersModels.user_name);
            body.set("password", UsersModels.password);
           return this.http.post(this.url + "/User/Authenticate", body.toString(), { headers });
        } catch (e) {
            console.error(e);
        }
    }
    RegisterUser(studentModels: any): Observable<any> {
        try {
    
    
          var headers = new HttpHeaders();
          headers.append("Accept", 'application/json');
          headers.append('Content-Type', 'application/json');
          headers.append("Access-Control-Allow-Origin", "*");
          headers.append("Access-Control-Allow-Methods", "DELETE, POST, GET, OPTIONS")
          headers.append("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With")
          return this.http.post(this.url + "/User/Register", studentModels, { headers });
        }
        catch (e) {
    
        }
      }
      getData(fileURL, objData) {
        return new Promise(resolve => {
    
          if (objData == null) {
            objData = [];
          }
          objData['token'] = "";
          objData['tkey'] = "";
          objData['map'] = "";
          var sURL = this.url + fileURL + this.generateQueryString(objData);
            this.http.get(sURL)
            .subscribe(data => {
              if (data['success'] == 498) {
                alert(data['response']['message']);
                if (data['response']['message'] == 'Expired') {
                  //this.refreshToken(fileURL, objData);
                }
              }
              else {
                resolve(data);
              }
            }, error => {
              alert("We are unable to connect to our servers. Please try after some time.");
              var objResponse = [];
              objResponse['success'] = -1;
              resolve(objResponse);
             });
        });
      }

      PostData(fileURL,Objdata: any): Observable<any> {
        try {
          var headers = new HttpHeaders();
          headers.append("Accept", 'application/json');
          headers.append('Content-Type', 'application/json');
          headers.append("Access-Control-Allow-Origin", "*");
          headers.append("Access-Control-Allow-Methods", "DELETE, POST, GET, OPTIONS")
          headers.append("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With")
          return this.http.post(this.url + fileURL, Objdata, { headers });
        }
        catch (e) {
    
        }
      }
      generateQueryString(objData) {

        var sQueryString = "";
        if (Object.keys(objData).length > 0) {
          for (var i = 0; i < Object.keys(objData).length; i++) {
            var sData = (Object.keys(objData)[i] + '=' + objData[Object.keys(objData)[i]]);
            sQueryString += sData + '&';
          }
          if (sQueryString.length > 0) {
            sQueryString = "?" + sQueryString;
          }
        }
        return sQueryString;
      }
    
  }
