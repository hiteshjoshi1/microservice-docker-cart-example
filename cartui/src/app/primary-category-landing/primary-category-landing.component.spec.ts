import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PrimaryCategoryLandingComponent } from './primary-category-landing.component';

describe('PrimaryCategoryLandingComponent', () => {
  let component: PrimaryCategoryLandingComponent;
  let fixture: ComponentFixture<PrimaryCategoryLandingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PrimaryCategoryLandingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PrimaryCategoryLandingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
