import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UserDetailComponent } from '../user-detail/user-detail.component';
import { ProductDetailComponent } from '../product-detail/product-detail.component';
import { LoginComponent } from '../login/login.component';

// Create a Route Array
const routes: Routes = 
[
  { path: '', redirectTo: '/products', pathMatch: 'full' },
  { path : 'user',component:UserDetailComponent },
  {path:'signin', component: LoginComponent},
  //TODO - create Routes for all 3 Below
  { path : 'Men',component:ProductDetailComponent },
  { path : 'Women',component:ProductDetailComponent },
  { path : 'Kids',component:ProductDetailComponent },
  { path : 'Home & Living',component:ProductDetailComponent },
  { path : 'products',component:ProductDetailComponent }

];
// Router.forRoot returns a module
// we create it and then export the same
@NgModule({
  imports: [RouterModule.forRoot(routes,{ enableTracing: false })],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// example of How to configure routers
// const routes: Routes = [
//   { path: 'crisis-center', component: CrisisListComponent },
//   { path: 'hero/:id',      component: HeroDetailComponent },
//   {
//     path: 'heroes',
//     component: HeroListComponent,
//     data: { title: 'Heroes List' }
//   },
//   { path: '',
//     redirectTo: '/heroes',
//     pathMatch: 'full'
//   },
//   { path: '**', component: PageNotFoundComponent }
// ];






