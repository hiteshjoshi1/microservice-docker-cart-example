import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing/app-routing.module';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserDetailService } from './services/user-detail.service';
import { HttpModule } from '@angular/http';
import {HttpParams, HttpClient,  HttpClientModule} from '@angular/common/http';
import { UserAddressComponent } from './user-address/user-address.component';



@NgModule({
  declarations: [
    AppComponent,
    UserDetailComponent,
    UserAddressComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    HttpClientModule,
    AppRoutingModule
  ],
  providers: [UserDetailService],
  bootstrap: [AppComponent]
})
export class AppModule { }
