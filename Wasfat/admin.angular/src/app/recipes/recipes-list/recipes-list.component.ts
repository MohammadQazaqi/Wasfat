import { Component, OnInit } from '@angular/core';
import { RecipeAdminService, RecipeDto } from '@proxy/recipes';

@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrls: ['./recipes-list.component.scss']
})
export class RecipesListComponent implements OnInit {

  recipes: RecipeDto[] = []

  constructor(private recipeAdminSvc: RecipeAdminService) {
    console.log('RecipesListComponent > constructor');

  }

  ngOnInit(): void {
    console.log('RecipesListComponent > ngOnInit');

    this.recipeAdminSvc.
    
  }

}
