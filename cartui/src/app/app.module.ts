import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing/app-routing.module';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserDetailService } from './services/user-detail.service';
import { HttpModule } from '@angular/http';
import {HttpParams, HttpClient,  HttpClientModule} from '@angular/common/http';
import { UserAddressComponent } from './user-address/user-address.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { ProductDetailService } from './services/product-detail.service';
import {CategoryService} from './services/category.service';




@NgModule({
  declarations: [
    AppComponent,
    UserDetailComponent,
    UserAddressComponent,
    ProductDetailComponent
     ],
  imports: [
    BrowserModule,
    HttpModule,
    HttpClientModule,
    AppRoutingModule
  ],
  providers: [UserDetailService,ProductDetailService,CategoryService],
  bootstrap: [AppComponent]
})
export class AppModule { }
