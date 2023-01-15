import { Injectable } from '@angular/core';
import {BehaviorSubject, catchError, map, Observable, throwError} from "rxjs";
import {HttpClient, HttpErrorResponse} from "@angular/common/http";
import {ConnectionService} from "./connection.service";
import {Kasutaja} from "../model/kasutaja";
/*
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
*/


@Injectable({ providedIn: 'root' })
export class SisselogimineService {
  private currentUserSubject: BehaviorSubject<Kasutaja>;
  public currentUser: Observable<Kasutaja>;

  constructor(private http: HttpClient) {
    this.currentUserSubject = new BehaviorSubject<Kasutaja>(JSON.parse(<string>localStorage.getItem('currentUser')));
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): Kasutaja {
    return this.currentUserSubject.value;
  }

  login(kasutajanimi: string, parool: string) {
    return this.http.post<any>(`http://localhost:8080/api/login`, { kasutajanimi, parool })
      .pipe(map(user => {
        // store user details and jwt token in local storage to keep user logged in between page refreshes
        localStorage.setItem('currentUser', JSON.stringify(user));
        this.currentUserSubject.next(user);
        return user;
      }));
  }

  logout() {
    // remove user from local storage and set current user to null
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next({id:0, token:"0", parool:"0", e_meil:"s"});
  }
}
