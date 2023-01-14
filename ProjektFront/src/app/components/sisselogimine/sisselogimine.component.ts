import {Component} from '@angular/core';
import {LaadimispunktServiceService} from "../../service/laadimispunkt-service.service";
import {SisselogimineServiceService} from "../../service/sisselogimine.service";
import {Kasutaja} from "../../model/kasutaja";

@Component({
  selector: 'app-sisselogimine',
  styleUrls: ['sisselogimine.component.css'],
  templateUrl: 'sisselogimine.component.html',
})
export class SisselogimineComponent {

  kasutaja : Kasutaja | undefined = undefined;
  kasutajanimi : string ="";
  parool : string ="";
  show: boolean= false;
  submit(){
    console.log("Kasutajanimi on " + this.kasutajanimi)
    this.clear();
  }
  clear(){
    this.kasutajanimi ="";
    this.parool = "";
    this.show = true;
  }

  constructor(private sisselogimine_service: SisselogimineServiceService,) {
  }

  logiSisse(e_meil: string, parool: string) {
      this.sisselogimine_service.logIn(e_meil, parool).subscribe((data) => {
        this.kasutaja = data;
      });
  }
}
