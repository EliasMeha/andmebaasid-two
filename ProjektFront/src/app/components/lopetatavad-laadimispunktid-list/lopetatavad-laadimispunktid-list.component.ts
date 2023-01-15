import {Component, OnInit, ViewChild} from '@angular/core';
import {Laadimispunkt} from "../../model/laadimispunkt";
import {Router} from "@angular/router";
import {MatSort} from "@angular/material/sort";
import {MatPaginator} from "@angular/material/paginator";
import {MatTableDataSource} from "@angular/material/table";
import {LaadimispunktServiceService} from "../../service/laadimispunkt-service.service";

@Component({
  selector: 'app-lopetatavad_laadimispunktid-list',
  templateUrl: './lopetatavad-laadimispunktid-list.component.html',
  styleUrls: ['./lopetatavad-laadimispunktid-list.component.css']
})
export class LopetatavadLaadimispunktidListComponent implements OnInit {

  @ViewChild(MatSort) sortForDataSource!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sortForDataSource;
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  displayedColumns: string[] = ['laadimispunkti_kood', 'nimetus', 'laadimispunkti_seisundi_liik_kood', 'laadimispunkti_seisundi_liik_nimetus', 'lopeta_nupp']
  dataSource = new MatTableDataSource<Laadimispunkt>();

  constructor(private router: Router, public laadimispunktServiceService: LaadimispunktServiceService) {}

  ngOnInit() {
    this.laadimispunktServiceService.getAllLopetatavad().subscribe(data => this.dataSource.data = data);
  }

  navigateToLaadimispunktById(id: bigint) {
    this.router.navigate(['/laadimispunkt',id]).then(r => r);
  }
  lopetaLaadimispunkt(id: number, nimetus: string) {
    if (this.isEndable(nimetus)) {
      this.laadimispunktServiceService.lopeta(BigInt(id)).subscribe((data) => {
      });
    }
  }

  isEndable(nimetus: string): boolean {
    return nimetus === 'aktiivne' || nimetus === 'mitteaktiivne'
  }
}
