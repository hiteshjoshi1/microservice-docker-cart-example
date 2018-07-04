import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Product } from '../interface/product';
import { Observable } from 'rxjs/Observable';
import { map, catchError } from 'rxjs/operators';

@Injectable()
export class ProductDetailService {

  private _productsURL = environment.productsURL;
  constructor(private _http: HttpClient) { }

  public getProductsForDisplay():Observable<Product[]>{

    return this._http.get(this._productsURL).pipe(
      map(response => {
        return (<Product[]>(response));
      }),
      catchError(error =>  {
        console.log('Error',error);
          return Observable.of(null);
        }
    )
  );
  }


}
