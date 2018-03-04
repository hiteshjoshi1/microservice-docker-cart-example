import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Create a Route Array
const routes: Routes = 
[
  { path: '', redirectTo: '/', pathMatch: 'full' }

];

// Router.forRoot returns a module
// we create it and then export the same
@NgModule({
  imports: [RouterModule.forRoot(routes,{ enableTracing: false })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
