import { ComponentFixture, TestBed } from '@angular/core/testing';

import {LopetatavadLaadimispunktidListComponent} from "./lopetatavad-laadimispunktid-list.component";

describe('LaadimispunktListComponent', () => {
  let component: LopetatavadLaadimispunktidListComponent;
  let fixture: ComponentFixture<LopetatavadLaadimispunktidListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LopetatavadLaadimispunktidListComponent ]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LopetatavadLaadimispunktidListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
