import { Component, OnInit, Input } from '@angular/core';
import { Address } from '../interface/address';

@Component({
  selector: 'app-user-address',
  templateUrl: './user-address.component.html',
  styleUrls: ['./user-address.component.css']
})
export class UserAddressComponent implements OnInit {

  @Input("address") address: Address[];
  constructor() { }

  ngOnInit() {
  }

}
