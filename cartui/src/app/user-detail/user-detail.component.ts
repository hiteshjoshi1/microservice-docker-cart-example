import { Component, OnInit } from '@angular/core';
import { UserDetailService } from '../services/user-detail.service';
import { map, catchError } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { User } from '../interface/user';

@Component({
  selector: 'app-user-detail',
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {
user: User;
displayAddres : boolean = false;


  constructor(private _userDetailService : UserDetailService) {  
    this. _userDetailService.getCustomerDetails(1).subscribe(res => {
      this.user = res;
      console.log(this.user);
    }); 
   }

  ngOnInit() {

  }

  showHideUser(){
    this.displayAddres = !this.displayAddres;
  }

}
