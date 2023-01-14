import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import {HttpClientModule} from "@angular/common/http";
import { LaadimispunktListComponent } from './components/laadimispunkt-list/laadimispunkt-list.component';
import { AppRoutingModule } from './app-routing.module';
import {RouterModule} from "@angular/router";
import {MatTableModule} from "@angular/material/table";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatButtonModule} from "@angular/material/button";
import {MatToolbarModule} from "@angular/material/toolbar";
import {MatSortModule} from "@angular/material/sort";
import { LaadimispunktComponent } from './components/laadimispunkt/laadimispunkt.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatDividerModule} from "@angular/material/divider";
import { KoodaruanneNimekiriComponent } from './components/koodaruanne-nimekiri/koodaruanne-nimekiri.component';
import {MatCardModule} from "@angular/material/card";
import { SisselogimineComponent } from './components/sisselogimine/sisselogimine.component';

@NgModule({
  declarations: [
    AppComponent,
    LaadimispunktListComponent,
    LaadimispunktComponent,
    KoodaruanneNimekiriComponent,
    SisselogimineComponent
  ],
    imports: [
        BrowserModule,
        HttpClientModule,
        AppRoutingModule,
        RouterModule,
        MatTableModule,
        BrowserAnimationsModule,
        MatButtonModule,
        MatToolbarModule,
        MatSortModule,
        ReactiveFormsModule,
        MatFormFieldModule,
        MatInputModule,
        MatDividerModule,
        MatCardModule,
        FormsModule,
    ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
