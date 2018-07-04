import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient,HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { map, catchError } from 'rxjs/operators';
import {PrimaryCategory} from './../interface/Categories';
import {SecondaryCategory} from '../interface/Categories';

@Injectable()
export class CategoryService {

  private _categoryURL = environment.categoryURL;
  private _fullCategoryURL = environment.fullCategoryURL;
  constructor(private _http: HttpClient) { }

  public getPrimaryCategory():Observable<PrimaryCategory[]>{

    return this._http.get(this._categoryURL).pipe(
      map(response => {
        return (<PrimaryCategory[]>(response));
      }),
      catchError(error =>  {
        console.log('Error',error);
          return Observable.of(null);
        }
    )
  );
  }

  public getSecondaryCategories(categoryId:string):Observable<SecondaryCategory[]>{
    const options =  { params: new HttpParams().set('categoryId', categoryId+"")};
    return this._http.get(this._fullCategoryURL,options).pipe(
      map(response => {
        console.log(response);
        return (<SecondaryCategory[]>(response));
      }),
      catchError(error =>  {
        console.log('Error',error);
          return Observable.of(null);
        }
    )
  );
  }

}
