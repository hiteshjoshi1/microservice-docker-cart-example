import { Component, OnInit } from '@angular/core';
import { Product } from '../interface/product';
import { ProductDetailService } from '../services/product-detail.service';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css']
})
export class ProductDetailComponent implements OnInit {

  products: Product[];

  constructor(private productDetailService : ProductDetailService) { }

  ngOnInit() {
    this.productDetailService.getProductsForDisplay().subscribe(res => {
      this.products = res;
      console.log(this.products);
    });
  }

}
