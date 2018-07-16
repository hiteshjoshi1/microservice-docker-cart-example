import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SecondaryCategoryLandingComponent } from './secondary-category-landing.component';

describe('SecondaryCategoryLandingComponent', () => {
  let component: SecondaryCategoryLandingComponent;
  let fixture: ComponentFixture<SecondaryCategoryLandingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SecondaryCategoryLandingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SecondaryCategoryLandingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
