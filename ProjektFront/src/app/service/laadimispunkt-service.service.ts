import { Injectable } from '@angular/core';
import {Laadimispunkt} from "../model/laadimispunkt";
import {catchError, map, Observable, throwError} from "rxjs";
import {HttpClient, HttpErrorResponse} from "@angular/common/http";
import {ConnectionService} from "./connection.service";
import {Koondaruanne} from "../model/koondaruanne";

@Injectable({
  providedIn: 'root'
})
export class LaadimispunktServiceService {

  constructor(private conncetion: ConnectionService) {}

  getAll(): Observable<Laadimispunkt[]> {
    return this.conncetion.get('/laadimispunkt')
      .pipe(map((data: any) => data), catchError(this.handleError));
  }

  getAllLopetatavad(): Observable<Laadimispunkt[]> {
    return this.conncetion.get('/laadimispunkt/lopetatavad')
      .pipe(map((data: any) => data), catchError(this.handleError));
  }

  getAllKoodaruanne(): Observable<Koondaruanne[]> {
    return this.conncetion.get('/laadimispunkt/koondaruanne')
      .pipe(map((data: any) => data), catchError(this.handleError));
  }


  get(id: bigint): Observable<Laadimispunkt> {
    return this.conncetion.get('/laadimispunkt/' + `${id}`)
      .pipe(map((data: any) => data), catchError(this.handleError))
  }

  lopeta(id: bigint): Observable<any> {
    let call = '/laadimispunkt/' + `${id}` + '/lopeta';
      return this.conncetion.get(call)
        .pipe(map((data: any) => data), catchError(this.handleError))
    }

  aktiveeri(id: bigint): Observable<any> {
    let call = '/laadimispunkt/' + `${id}` + '/aktiveeri';
    return this.conncetion.get(call)
      .pipe(map((data: any) => data), catchError(this.handleError))
  }


  private handleError(res: HttpErrorResponse | any) {
    console.error(res.error || res.body.error);
    return throwError(res.error || 'Server error');
  }
}
