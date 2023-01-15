import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import {HTTP_INTERCEPTORS, HttpClientModule} from "@angular/common/http";
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
import {AlertComponent} from "./components/alert/alert.component";
import {ErrorInterceptor} from "./helpers/error.interceptor";
import {JwtInterceptor} from "./helpers/jwt.interceptor";
import {SisselogimineComponent} from "./components/sisselogimine/sisselogimine.component";
import { LopetatavadLaadimispunktidListComponent } from './components/lopetatavad-laadimispunktid-list/lopetatavad-laadimispunktid-list.component';

@NgModule({
  declarations: [
    AppComponent,
    LaadimispunktListComponent,
    LaadimispunktComponent,
    KoodaruanneNimekiriComponent,
    SisselogimineComponent,
    AlertComponent,
    LopetatavadLaadimispunktidListComponent
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
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
