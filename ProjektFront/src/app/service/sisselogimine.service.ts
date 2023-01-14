import { Injectable } from '@angular/core';
import {catchError, map, Observable, throwError} from "rxjs";
import {HttpClient, HttpErrorResponse} from "@angular/common/http";
import {ConnectionService} from "./connection.service";
import {Kasutaja} from "../model/kasutaja";

@Injectable({
  providedIn: 'root'
})
export class SisselogimineServiceService {

  constructor(private conncetion: ConnectionService) {}

  logIn(e_meil: string, parool: string): Observable<Kasutaja> {
    return this.conncetion.login('/login', {e_meil, parool})
      .pipe(map((data: any) => data), catchError(this.handleError));
  }

  private handleError(res: HttpErrorResponse | any) {
    console.error(res.error || res.body.error);
    return throwError(res.error || 'Server error');
  }
}
