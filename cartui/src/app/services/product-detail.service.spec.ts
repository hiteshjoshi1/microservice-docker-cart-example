import { TestBed, inject } from '@angular/core/testing';

import { ProductDetailService } from './product-detail.service';

describe('ProductDetailService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ProductDetailService]
    });
  });

  it('should be created', inject([ProductDetailService], (service: ProductDetailService) => {
    expect(service).toBeTruthy();
  }));
});
