import { NgModule } from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {LaadimispunktListComponent} from "./components/laadimispunkt-list/laadimispunkt-list.component";
import {LaadimispunktComponent} from "./components/laadimispunkt/laadimispunkt.component";
import {KoodaruanneNimekiriComponent} from "./components/koodaruanne-nimekiri/koodaruanne-nimekiri.component";
import {SisselogimineComponent} from "./components/sisselogimine/sisselogimine.component";


const routes: Routes = [
  { path: 'list', component: LaadimispunktListComponent},
  { path: 'koondaruanne', component: KoodaruanneNimekiriComponent},
  { path: 'laadimispunkt/:id', component: LaadimispunktComponent},
  { path: 'sisselogimine', component: SisselogimineComponent},
  { path: '',   redirectTo: '/sisselogimine', pathMatch: 'full'  }
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }
