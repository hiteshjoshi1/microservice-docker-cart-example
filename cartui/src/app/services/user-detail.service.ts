import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import {  Response} from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { map, catchError } from 'rxjs/operators';
import {HttpParams, HttpClient} from '@angular/common/http';
import 'rxjs/add/observable/of';
import { User } from '../interface/user';


@Injectable()
export class UserDetailService {

  private _userServiceURL = environment.customersURL;
  constructor(private _http: HttpClient) { }

  // explicitly declare what is the JSON type and then Type cast
  public getCustomerDetails(userId: number): Observable<User> {   
    const options =  { params: new HttpParams().set('id', userId+"")};
    return this._http.get(this._userServiceURL, options)
    .pipe(
      map(res => {
        // JSON is assumed by default - typecast
        return (<User>(res));
      }),
      catchError(error =>  {
      console.log('Error',error);
        return Observable.of(null);
      }
      )
    );
  }
}
