import { TestBed } from '@angular/core/testing';

import { SisselogimineServiceService } from './sisselogimine.service';

describe('SisseLogimineService', () => {
  let service: SisselogimineServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SisselogimineServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
