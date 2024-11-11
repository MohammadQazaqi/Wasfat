import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RecipesRoutingModule } from './recipes-routing.module';
import { RecipesListComponent } from './recipes-list/recipes-list.component';
import { CrudRecipeComponent } from './crud-recipe/crud-recipe.component';
import { ThemeSharedModule } from '@abp/ng.theme.shared';


@NgModule({
  declarations: [
    RecipesListComponent,
    CrudRecipeComponent
  ],
  imports: [
    CommonModule,
    RecipesRoutingModule,
    ThemeSharedModule
  ]
})
export class RecipesModule { }
