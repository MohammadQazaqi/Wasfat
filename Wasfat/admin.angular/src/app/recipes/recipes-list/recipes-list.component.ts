import { Component } from '@angular/core';
import { RecipeAdminService, RecipeDto } from '@proxy/recipes';

@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrls: ['./recipes-list.component.scss']
})
export class RecipesListComponent {

  recipes: RecipeDto[] = []

  constructor() {
    console.log('RecipesListComponent > constructor');

  }


}
