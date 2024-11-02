import { RoutesService, eLayoutType } from '@abp/ng.core';
import { APP_INITIALIZER } from '@angular/core';

export const APP_ROUTE_PROVIDER = [
  { provide: APP_INITIALIZER, useFactory: configureRoutes, deps: [RoutesService], multi: true },
];

function configureRoutes(routesService: RoutesService) {
  return () => {
    routesService.add([
      {
        path: '/',
        name: '::Menu:Home',
        iconClass: 'fas fa-home',
        order: 1,
        layout: eLayoutType.application,
      },
      {
        path: '/',
        name: '::Menu:Recipes',
        iconClass: 'fas fa-utensils',
        order: 2,
        layout: eLayoutType.application,
      },
      {
        path: '/recipes/list',
        name: '::Menu:RecipesList',
        parentName: '::Menu:Recipes',
        iconClass: 'fas fa-list',
        order: 1,
        layout: eLayoutType.application,
      },
      {
        path: '/recipes/crud',
        name: '::Menu:CrudRecipe',
        parentName: '::Menu:Recipes',
        iconClass: 'fas fa-plus',
        order: 2,
        layout: eLayoutType.application,
      },
    ]);
  };
}
