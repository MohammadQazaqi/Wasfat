import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CrudRecipeComponent } from './crud-recipe.component';

describe('CrudRecipeComponent', () => {
  let component: CrudRecipeComponent;
  let fixture: ComponentFixture<CrudRecipeComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CrudRecipeComponent]
    });
    fixture = TestBed.createComponent(CrudRecipeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
