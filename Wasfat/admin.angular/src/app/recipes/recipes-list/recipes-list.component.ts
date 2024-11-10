import { Component, OnInit } from '@angular/core';
import { RecipeAdminService, RecipeDto } from '@proxy/recipes';

@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrls: ['./recipes-list.component.scss'],
})
export class RecipesListComponent implements OnInit {
  recipes: RecipeDto[] = [];

  constructor(private recipeAdminSvc: RecipeAdminService) { }

  ngOnInit(): void {
    console.log('Component initialized!');

    const recipesObservable = this.recipeAdminSvc.getAllRecipes();

    const recipesObserver =
      (receivedRecipes) => {
        this.recipes = receivedRecipes;
        console.log('My Recipes:', this.recipes);
      };

    recipesObservable.subscribe(recipesObserver);
  }
}
