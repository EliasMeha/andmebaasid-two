import { Component } from '@angular/core';
import {Router} from "@angular/router";
import {Kasutaja} from "./model/kasutaja";
import {SisselogimineService} from "./service/sisselogimine.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Laadimispunktide haldamine';
  currentUser!: Kasutaja;

  constructor(
    private router: Router,
    private sisselogimineService: SisselogimineService
  ) {
    this.sisselogimineService.currentUser.subscribe(x => this.currentUser = x);
  }

    logout() {
      this.sisselogimineService.logout();
      this.router.navigate(['/sisselogimine']);
    }
}
