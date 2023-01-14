import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SisselogimineComponent } from './sisselogimine.component';

describe('SisselogimineComponent', () => {
  let component: SisselogimineComponent;
  let fixture: ComponentFixture<SisselogimineComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SisselogimineComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SisselogimineComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
