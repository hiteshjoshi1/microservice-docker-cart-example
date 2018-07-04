import { Component } from '@angular/core';
import { CategoryService } from './services/category.service';
import { PrimaryCategory, SecondaryCategory } from './interface/Categories';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  primaryCategories: PrimaryCategory[];

  secondaryCategories: SecondaryCategory[];
  isVisible: boolean = false;
  currentClasses :{} = {'categories-hidden': true};



  constructor(private categoryService: CategoryService) {
    this.categoryService.getPrimaryCategory().subscribe(result => {
      this.primaryCategories = result;
      console.log(this.primaryCategories);
    });
  }
  title = 'app';

  showCategory(id) {
    console.log('HItesss', id);
    this.categoryService.getSecondaryCategories(id).subscribe(res => {
      this.secondaryCategories = res;
      this.isVisible = true;
      this.currentClasses =  {
        'categories-shown': true,
        'categories-hidden': false
      };
    })
  }

  hideCategories() {
    console.log("Hide meeeee");
    this.isVisible = false;
    this.currentClasses =  {
      'categories-hidden': true,
    };
  }
}
