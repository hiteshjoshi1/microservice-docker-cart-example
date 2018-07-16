import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TertiaryCategoryLandingComponent } from './tertiary-category-landing.component';

describe('TertiaryCategoryLandingComponent', () => {
  let component: TertiaryCategoryLandingComponent;
  let fixture: ComponentFixture<TertiaryCategoryLandingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TertiaryCategoryLandingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TertiaryCategoryLandingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
