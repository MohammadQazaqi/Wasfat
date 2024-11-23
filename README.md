## 09 - Building the Create Recipe Component

        Building the Recipes List Component

### 09.01 - What You Will Learn in This Chapter  
In this chapter, you will learn how to create a new recipe using a **Reactive Form** in Angular. By the end of this chapter, you will have a working Create Recipes component that allows users to submit new recipes, validates the input, and sends the data to the backend.


### 09.02 - Terminology  

- **Reactive Forms**: A form-building approach in Angular where the form model is explicitly defined in the component.
- **FormGroup**: A collection of form controls that are managed as a single unit.
- **FormControl**: Represents a single input field within a form.
- **Validation**: A process that ensures the data provided by users adheres to predefined rules before submission.


### 09.03 - Verifying the Backend Create Recipe Endpoint


**Location**:  
`src`\\`Wasfat.Application`\\`Recipes`\\`RecipeAdminAppService.cs`

```csharp
public override async Task<RecipeDto> CreateAsync(RecipeDto input)
```


### 09.04 - Verifying the Frontend Proxy for Create Recipe

If you do not see the methods in the proxy folder you will have to run this command 

**Location**:  
`PS `\\`Wasfat`\\`admin.angular`>

```bash
abp generate-proxy -t ng
```


### 09.05 - Importing ReactiveFormsModule via SharedModule

**Location**:  
`src`\\`app`\\`shared`\\`shared.module.ts`: `@NgModule` > `imports[]` & `Export[]`

```typescript
    ReactiveFormsModule
```

Do not forget to import the Shard module to the recipes module

**Location**:  
`src`\\`app`\\`recipes`\\`recipes.module.ts`: ``@NgModule`` > ``imports[]``

```typescript
    SharedModule
```

Also remove the ThemeSharedModule from the Recipes Module as it is already available in the Shared module 

**Location**:  
`src`\\`app`\\`recipes`\\`recipes.module.ts`: ``@NgModule`` > ``imports[]``

```typescript
    ThemeSharedModule // Remove this line 
```
   
### 09.06 - Declaring the `recipeFormGroup` 

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`

```typescript
recipeFormGroup: FormGroup;
```


### 09.07 Injecting Important Dependencies


1. Injecting the `RecipeAdminService`

    **Location**:  
    `src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: `constructor` > `parameters`

    ```typescript
    private recipeAdminSvc: RecipeAdminService
    ```

2. Injecting the `FormBuilder`  

    **Location**:  
    `src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: `constructor` > `parameters`

    ```typescript
    private fb: FormBuilder
    ```
3. Injecting The `Router`  

    **Location**:  
    `src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: `constructor` > `parameters`
    
    ```typescript
    private router: Router
    ```


Final Constructor with All Dependencies

```typescript
  constructor(private recipeAdminSvc: RecipeAdminService,
    private fb: FormBuilder,
    private router: Router) {
  }
```

### 09.08 - Implementing `OnInit`

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: ``class RecipesModule``

```typescript
implements OnInit
```

```typescript
ngOnInit(): void {
  console.log('CreateRecipeComponent > ngOnInit');
}
```


### 09.09 - Building the Form

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: `ngOnInit` > `method body`

```typescript
this.recipeForm = this.fb.group({
  name: [''],
  description: [''],
});
```

### 09.10 - Canceling and Navigating to Recipes List

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`

```typescript
  cancel() {
    this.router.navigate(["/recipes/list"])
  }
```


### 09.11 - Sending Form Values to the Backend

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`

```typescript
  createRecipe(): void {
    this.recipeAdminSvc.create(this.recipeFormGroup.value).subscribe((response) => {
      console.log('Recipe created successfully', response);
      this.router.navigate(["/recipes/list"])
    });
  }
```

### 09.12 Adding Angular Material

```Bash
ng add @angular/material
"@angular/material": "^16.2.14",
```


### 09.13 Importing Some Mat Modules via shared Module

**Location**:  
`src`\\`app`\\`shared`\\`shared.module.ts`: `@NgModule` > `imports[]` & `Export[]`

```typescript
    MatButtonModule,
    MatFormFieldModule,
    MatInputModule
```

### 09.14 - HTML: Preparing a Bootstrap Card

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

```html
<div class="card">
  <div class="card-header">
    ... header ...
  </div>
  <div class="card-body">
    ... body ...
  </div>
</div>
```

### 09.15 - HTML: Preparing the Grid

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

```html
<div class="card">
  <div class="card-header">
    <div class="row">
      <div class="col-md-6 border">
        left header
      </div>
      <div class="col-md-6 border">
        right header
      </div>
    </div>
  </div>
  <div class="card-body">
    <div class="row">
      <div class="col-md-6 border">
        left body
      </div>
      <div class="col-md-6 border">
        right body
      </div>
    </div>
  </div>
</div>
```

### 09.16 - HTML: Adding the Cancel Button

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

```html
        <button type="button" class="me-2" mat-stroked-button color="warn" (click)="cancel()">
          Cancel
        </button>
```

### 09.17 - HTML: Adding the Create Button

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

```html
        <button type="button" class="me-2" mat-stroked-button color="primary" (click)="createRecipe()">
          Create
        </button>
```

### 09.18 - HTML: Wrapping the ``Card Body Row`` with a Form Element

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

```html
    <form action="">      
      <!-- here goes the: card-body-row  -->
    </form>
```

### 09.19 - HTML: Binding the Form Group

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

Remove the `form` action and bind the `formGroup` using the following syntax:

```html
[formGroup]="recipeFormGroup"
```

The updated form should look something like this:

```html
    <form action="">
      <div class="row">
        <div class="col-md-6 border">
          <!-- left body -->
        </div>
        <div class="col-md-6 border">
          <!-- right body -->
        </div>
      </div>
    </form>
``` 

### 09.20 - HTML: Adding the Reactive Form Fields

**Location**:  
`src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`

First: add the `name` Input field 
```html
          <mat-form-field class="w-100" appearance="outline">
            <mat-label>Name</mat-label>
            <input matInput formControlName="name" placeholder="Enter recipe name">
          </mat-form-field>
```

Second: add the `name` `textarea` field 
```html
          <mat-form-field class="w-100" appearance="outline">
            <mat-label>Description</mat-label>
            <textarea matInput formControlName="description" placeholder="Enter recipe description"></textarea>
          </mat-form-field>
```

**💡 Reference :**
> **Search for**: `angular material input`  
> **The Google result page at the time of the recording** : [Angular Material Input](https://material.angular.io/components/input/overview)


### 09.21 - Refactoring `buildForm`

Use `Ctrl+DOT` in VS Code to quickly refactor the form initialization logic into a separate method.

Updated code:

```typescript
ngOnInit(): void {
  this.buildForm();
}

private buildForm(): void {
  this.recipeFormGroup = this.fb.group({
    name: [''],
    description: ['']
  });
}
```

### 09.22 - Adding Form Validation Rules

**Step 1: Add Validators for the `name` Field** 
   
  **Location**:  
  `src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.ts`: `buildForm`   
  ```typescript
  [Validators.required, Validators.minLength(3)]
  ```

  Update code
  ```typescript
  private buildForm() {
    this.recipeFormGroup = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(3)]],
      description: ['']
    });
  }
  ```


**Step 2: Prevent Recipe Creation if the Form is Invalid**  

  ```typescript
    if (this.recipeFormGroup.invalid) {
      alert("Some fields are not valid.");
      return;
    }
  ```

   Update Code  
   **Location**:  
   `src`\\`app`\\`recipes`\\`create-recipe`\\`create-recipe.component.html`   

  ```typescript
  createRecipe(): void {
    if (this.recipeFormGroup.invalid) {
      alert("Some fields are not valid.");
      return;
    }
    this.recipeAdminSvc.create(this.recipeFormGroup.value).subscribe((response) => {
      console.log('Recipe created successfully', response);
      this.router.navigate(["/recipes/list"])
    });
  }
  ```   

### 09.23 - Summary  

In this chapter, we learned how to build a Create Recipes Component in Angular.  

  - We started by verifying the `CreateAsync` backend endpoint and ensuring the proxy methods were available in the Angular application by generating the proxy using the `abp generate-proxy` command.  
  - Next, we configured the shared module to include `ReactiveFormsModule` and Angular Material components, ensuring all necessary imports were in place.  
  - Using a `FormGroup` and `FormBuilder`, we initialized the recipe form, structured it, and added validation rules to enforce proper input.  
  - We designed a responsive UI with Bootstrap and Angular Material, including form fields for recipe name and description, wrapped in a visually appealing card layout.  
  - Finally, we implemented the `createRecipe` method to validate the form, submit the data to the backend, and navigate to the recipe list upon successful creation.  

This chapter provided a step-by-step guide to creating a polished recipe creation feature, setting the stage for editing existing recipes in the next chapter.
