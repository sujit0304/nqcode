import { Component, ViewChild, OnInit,CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { Router } from '@angular/router';
import { AlertController, IonList, IonRouterOutlet, LoadingController, ModalController, ToastController, Config } from '@ionic/angular';
import { Platform } from '@ionic/angular';
import { ScheduleFilterPage } from '../schedule-filter/schedule-filter';
import { ConferenceData } from '../../providers/conference-data';
import { UserData } from '../../providers/user-data';
//import Swiper, { Autoplay, Pagination } from 'swiper';

//import { Geolocation } from '@ionic-native/geolocation/ngx';
//import { NativeGeocoder, NativeGeocoderOptions, NativeGeocoderResult } from '@ionic-native/native-geocoder/ngx';

@Component({
  selector: 'page-booking',
  templateUrl: 'booking.html',
  styleUrls: ['./booking.scss'],
 
})
export class BookingPage implements OnInit {
  /*slideOpts = {
    initialSlide: 0,
    speed: 400,
    loop: true,
  };*/
  // Gets a reference to the list element
  @ViewChild('scheduleList', { static: true }) scheduleList: IonList;
  isFemale = false; 
  ios: boolean;
  dayIndex = 0;
  queryText = '';
  segment = 'all';
  excludeTracks: any = [];
  shownSessions: any = [];
  groups: any = [];
  confDate: string;
  showSearchbar: boolean;
  address: string;
  isBrowser: boolean;
  onToggleChange(event: any) {
    this.isFemale = event.detail.checked;
    console.log(this.isFemale ? 'Female' : 'Male');
  }
  stars: number[] = [1, 2, 3, 4, 5]; // Adjust the number for more/less stars
  rating: number = 4.9; // Default rating

  setRating(newRating: number) {
    this.rating = newRating;
  }
  constructor(
    private platform: Platform,
    public alertCtrl: AlertController,
    public confData: ConferenceData,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public router: Router,
    public routerOutlet: IonRouterOutlet,
    public toastCtrl: ToastController,
    public user: UserData,
    public config: Config,//private geolocation: Geolocation,
    //private nativeGeocoder: NativeGeocoder
  ) { 
    this.isBrowser = !this.platform.is('cordova') && !this.platform.is('capacitor');
  }

  ngOnInit() {
    this.updateSchedule();

    
    
  }
async fetchLocation()
{
 // const Location = await Geolocation.getCurrentPosition();
  //console.log("location ",Location);
  /*try {
    if (this.isBrowser) {
      // Use browser's Geolocation API
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;
          console.log('Browser Latitude:', latitude, 'Longitude:', longitude);
          this.reverseGeocodeBrowser(latitude, longitude); // Simulate reverse geocoding
        },
        (error) => console.error('Error getting location', error)
      );
    } else {
      // Use Native Geolocation Plugin
      const position = await this.geolocation.getCurrentPosition();
      const latitude = position.coords.latitude;
      const longitude = position.coords.longitude;
      console.log('Device Latitude:', latitude, 'Longitude:', longitude);
      this.reverseGeocodeDevice(latitude, longitude);
    }
  } catch (error) {
    console.error('Error getting location', error);
  }
}

reverseGeocodeDevice(latitude: number, longitude: number) {
  const options: NativeGeocoderOptions = {
    useLocale: true,
    maxResults: 1
  };

  this.nativeGeocoder.reverseGeocode(latitude, longitude, options)
    .then((result: NativeGeocoderResult[]) => {
      this.address = this.formatAddress(result[0]);
      console.log('Device Address:', this.address);
    })
    .catch((error: any) => {
      console.error('Error in reverse geocoding', error);
    });
}

reverseGeocodeBrowser(latitude: number, longitude: number) {
  // Mocking the address for browser environment
  this.address = `Latitude: ${latitude}, Longitude: ${longitude} (Browser Mock Address)`;
  console.log('Browser Address:', this.address);
}

formatAddress(result: NativeGeocoderResult): string {
  const parts = [
    result.subThoroughfare,
    result.thoroughfare,
    result.locality,
    result.administrativeArea,
    result.postalCode,
    result.countryName
  ];
  return parts.filter(part => part).join(', ');
}*/
}
  updateSchedule() {
    // Close any open sliding items when the schedule updates
    if (this.scheduleList) {
      this.scheduleList.closeSlidingItems();
    }

    this.confData.getTimeline(this.dayIndex, this.queryText, this.excludeTracks, this.segment).subscribe((data: any) => {
      this.shownSessions = data.shownSessions;
      this.groups = data.groups;
    });
  }

  async presentFilter() {
    const modal = await this.modalCtrl.create({
      component: ScheduleFilterPage,
      presentingElement: this.routerOutlet.nativeEl,
      componentProps: { excludedTracks: this.excludeTracks }
    });
    await modal.present();

    const { data } = await modal.onWillDismiss();
    if (data) {
      this.excludeTracks = data;
      this.updateSchedule();
    }
  }

  async addFavorite(slidingItem: HTMLIonItemSlidingElement, sessionData: any) {
    if (this.user.hasFavorite(sessionData.name)) {
      // Prompt to remove favorite
      this.removeFavorite(slidingItem, sessionData, 'Favorite already added');
    } else {
      // Add as a favorite
      this.user.addFavorite(sessionData.name);

      // Close the open item
      slidingItem.close();

      // Create a toast
      const toast = await this.toastCtrl.create({
        header: `${sessionData.name} was successfully added as a favorite.`,
        duration: 3000,
        buttons: [{
          text: 'Close',
          role: 'cancel'
        }]
      });

      // Present the toast at the bottom of the page
      await toast.present();
    }

  }

  async removeFavorite(slidingItem: HTMLIonItemSlidingElement, sessionData: any, title: string) {
    const alert = await this.alertCtrl.create({
      header: title,
      message: 'Would you like to remove this session from your favorites?',
      buttons: [
        {
          text: 'Cancel',
          handler: () => {
            // they clicked the cancel button, do not remove the session
            // close the sliding item and hide the option buttons
            slidingItem.close();
          }
        },
        {
          text: 'Remove',
          handler: () => {
            // they want to remove this session from their favorites
            this.user.removeFavorite(sessionData.name);
            this.updateSchedule();

            // close the sliding item and hide the option buttons
            slidingItem.close();
          }
        }
      ]
    });
    // now present the alert on top of all other content
    await alert.present();
  }

  async openSocial(network: string, fab: HTMLIonFabElement) {
    const loading = await this.loadingCtrl.create({
      message: `Posting to ${network}`,
      duration: (Math.random() * 1000) + 500
    });
    await loading.present();
    await loading.onWillDismiss();
    fab.close();
  }

  BookNow()
  {
    
  }
}
