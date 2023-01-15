import { NgModule } from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {LaadimispunktListComponent} from "./components/laadimispunkt-list/laadimispunkt-list.component";
import {LaadimispunktComponent} from "./components/laadimispunkt/laadimispunkt.component";
import {KoodaruanneNimekiriComponent} from "./components/koodaruanne-nimekiri/koodaruanne-nimekiri.component";
import {SisselogimineComponent} from "./components/sisselogimine/sisselogimine.component";
import {AuthGuard} from "./helpers/auth.guard";
import {LopetatavadLaadimispunktidListComponent} from "./components/lopetatavad-laadimispunktid-list/lopetatavad-laadimispunktid-list.component";


const routes: Routes = [
  { path: '',   component: SisselogimineComponent, canActivate: [AuthGuard]  },
  { path: 'list', component: LaadimispunktListComponent},
  { path: 'lopetatavad', component: LopetatavadLaadimispunktidListComponent},
  { path: 'koondaruanne', component: KoodaruanneNimekiriComponent},
  { path: 'laadimispunkt/:id', component: LaadimispunktComponent},
  { path: 'sisselogimine', component: SisselogimineComponent},
  { path: '**', redirectTo: ''}
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }
