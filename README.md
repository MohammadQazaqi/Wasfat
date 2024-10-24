# Wasfat

# Mastering Full-Stack Development with ABP.io

***
## 00 - Introduction
### 00.01 - What You Will Learn in This Course
### 00.02 - What You Need to Know

***
## 01 - Setting Up the Development Environment
### 01.01 - Introduction
### 01.02 - Installing Node
- Node version: **20.18.0**
### 01.03 - Installing Visual Studio
- Community Edition: **version 2022**
- Make sure to configure it to run as administrator
### 01.04 - Installing Visual Studio Code
- Make sure to configure it to run as administrator
### 01.05 - Installing ABP.io CLI
```
dotnet tool install -g Volo.Abp.Cli --version 7.4.0
```
### 01.06 - Installing Angular CLI
```
npm install -g @angular/cli@16.2.16
```

### 01.07 - Installing the XAMPP Server
- Version: 8.0.30
- Make sure to configure it to run as administrator
### 01.08 - Summary: Setting Up the Development Environment

***
## 02 - Creating Our ABP Project

### 02.01 - Introduction
In this chapter, you will learn how to create your first ABP project using the ABP CLI. We will also cover setting up a GitHub repository to manage your project, cloning it locally, and configuring the project for development.

### 02.02 - Creating Our GitHub Repository
To manage your project’s code, we will create a GitHub repository. Follow these steps:
1. Go to [GitHub](https://github.com) and log in.
2. Click on **New** to create a new repository.
3. Give your repository a name, such as **Wasfat**, choose the visibility (public/private), and add a ReadMe file.
4. Click **Create Repository**.

### 02.03 - Cloning Our Repository to Local Machine
Once the repository is created, clone it to your local machine:
```bash
git clone https://github.com/your-username/Wasfat.git
cd Wasfat
```

### 02.04 - Creating Our Wasfat ABP Project
Now, we will create the ABP project inside the repository:

```
abp new Wasfat -u angular -dbms MySQL -m none --theme basic --pwa  -csf --version 7.4.5
```

#### Explanation of the command:
- `Wasfat`: This is the name of your project.
- `-u angular`: Specifies Angular as the UI framework.
- `-dbms MySQL`: Configures MySQL as the database management system.
- `-m none`: Creates the project without mobile modules (basic setup).
- `--theme basic`: Adds a basic theme to the UI.
- `--pwa`: Enables Progressive Web App (PWA) support.
- `-csf`: Creates a subfolder to contain all ABP-related files.
- `--version 7.4.5`: Specifies the ABP framework version to use for this project (7.4.5).

### 02.05 - Summary
In this chapter, we successfully set up our GitHub repository, cloned it, and created our first ABP project. You are now ready to start building your full-stack application using ABP.io!

***
## 03 - Running Our Wasfat ABP Project

### 03.01 - Introduction
In this chapter, we will walk through the steps necessary to run the Wasfat ABP project. This includes starting the Database Server, creating the Database and the Database User, updating the database, starting the backend API, installing the frontend dependencies, generating API proxies, and serving the Angular app. By the end of this chapter, your project should be fully functional on both the backend and frontend.

### 03.02 - Starting the Database Server
Before creating the database, make sure your database server (e.g., MySQL) is up and running. This video will show you how to start the MySQL server on your local machine or remote server.

### 03.03 - Creating the Database and the Database User
In this video, we will walk through how to create a new MySQL database and user. This will ensure that ABP can connect and manage the database schema.

### 03.04 - Configuring ABP to Use Our Database
After creating the database and user, we'll configure ABP to connect to this database by updating the `appsettings.json` file.
```
"ConnectionStrings": {
  "Default": "Server=localhost;Port=3306;Database=dataBase-name;Uid=dataBase-user-name;Pwd=SecretPassword;"
},
```

### 03.05 - Updating the Database with the Initial Migration
Before running the project, you need to ensure that the database is up to date by applying the initial migration.

### 03.06 - Running the HttpApi.Host
Next, start the backend API by running the `HttpApi.Host` project. This will ensure that the API is available to communicate with the frontend.

### 03.07 - Installing Frontend Dependencies
Now, navigate to the Angular frontend folder and install the necessary npm packages.

```ps
npm install
```

### 03.08 - Serving the Angular App
Once everything is set up, serve the Angular app to run it locally in the browser.
```bash
ng serve -o
```

#### Explanation of the command:
- `ng serve`: Starts a development server for the Angular app.
- `-o`: Opens the app automatically in the default browser.

### 03.09 - Troubleshooting an ng serve Problem
We used ChatGPT to troubleshoot an Angular serving problem and got this command:

```ps
npm install bootstrap-icons
```

### 03.10 - Summary
In this chapter, we successfully started the database server, created the database and user, configured ABP to connect to the database, updated the database schema, ran the backend API, installed frontend dependencies, and served the Angular app. Your Wasfat project is now fully operational and ready for development and testing!


***
## 04 - Building Backend CRUD Endpoints for Recipes

### 04.01 - What We Will Build in This Chapter
In this chapter, we are going to create the parts of our app that let us add, view, change, and remove recipes from the database. This is known as **CRUD**, which stands for Create, Read, Update, and Delete. We'll start by setting up the recipe structure and then make it possible to save and manage recipes in the database.

### 04.02 - Terminology
In order to understand this chapter, it's important to familiarize ourselves with some key terminology that we will encounter.

- **`Entity`**: A class that represents a data model in the application. It corresponds to a table in the database and typically has properties that map to columns in that table. For example, a `Recipe` entity might have properties like `Name` and `Description`, which would be represented as columns in a `Recipes` table in the database.
- **`EntityDTO (Data Transfer Object)`**: An object used to transfer data between different layers of an application, such as from the backend to the frontend, without exposing the entire entity.
- **`Mapping`**: The process of converting data from one format to another, such as from an entity to a DTO or vice versa.
- **`Migration`**: A way to version control changes to the database schema, such as creating or altering tables and columns.
- **`API`**: An acronym for Application Programming Interface, which provides a set of functions and protocols to allow applications to 
- **`Swagger`**: An open-source tool used for documenting and testing RESTful APIs, providing a user interface to interact with the endpoints.

### 04.03 - Creating the Entity Class
To start, we will define our entity class, which represents the data structure we want to manage in our application. The entity will include basic properties such as `Name` and `Description`.

Location:  
`src`\\`Wasfat.Domain`\\`Recipes`\\`Recipe.cs`:

```csharp
public class Recipe : Entity<int>
{
    public string Name { get; set; }
    public string Description { get; set; } 
}
```

### 04.04 - Adding the Recipe Entity to the DbContext
Next, we need to update our `WasfatDbContext` class to include the new entity. This will allow ABP to manage the entity in the database.

Location:  
`src`\\`Wasfat.EntityFrameworkCore`\\`EntityFrameworkCore`\\`WasfatDbContext.cs`:

```csharp
public DbSet<Recipe> Recipes { get; set; }
```

### 04.05 - Mapping the Recipe Entity to a Database Table
Then, configure the entity within the `OnModelCreating` method:

Location:  
`src`\\`Wasfat.EntityFrameworkCore`\\`EntityFrameworkCore`\\`WasfatDbContext.cs`:

```csharp
builder.Entity<Recipe>(b =>
{
    b.ToTable(WasfatConsts.DbTablePrefix + "Recipes",
        WasfatConsts.DbSchema);
    b.ConfigureByConvention();
});
```

### 04.06 - Adding a Migration
After updating the `DbContext`, we need to create a new migration to apply the changes to the database. This step will generate the necessary scripts to update the database schema.

Open the **Package Manager Console** and set the **Default project** to `src`\\`Wasfat.EntityFrameworkCore`. Then, run the following command:

```bash
Add-Migration CreateRecipesTable
```

### 04.07 - Applying the Migration
Once the migration has been created, the next step is to update the database to apply the migration. This will modify the database schema based on the changes defined in the migration.

In the **Package Manager Console**, with the **Default project** still set to `src`\\`Wasfat.EntityFrameworkCore`, run the following command:

```bash
Update-Database
```

### 04.08 - Creating the Data Transfer Object (DTO)
DTOs are used to transfer data between the application layers. In this section, we will create DTOs for the entity to be used in service methods.

Location:  
`src`\\`Wasfat.Application.Contracts`\\`Recipes`\\`RecipeDto.cs`:

```csharp
public class RecipeDto : EntityDto<int>
{
    public string Name { get; set; }
    public string Description { get; set; } 
}
```

### 04.09 - Setting Up the Mapper Profile
To map between the entity and its DTO, we need to create a `MapperProfile`. This profile will handle the conversion between the entity and its corresponding DTOs.

Location:  
`src`\\`Wasfat.Application`\\`Recipes`\\`RecipeMapperProfile.cs`:

```csharp
public class RecipeMapperProfile : Profile
{
    public RecipeMapperProfile()
    {
        CreateMap<Recipe, RecipeDto>().ReverseMap();
    }
}
```

### 04.10 - Defining the Service Interface
The service interface defines the contract for our service, specifying which operations are available. Here, we will implement the `ICrudAppService` interface to provide basic CRUD functionality.

Location:  
`src`\\`Wasfat.Application.Contracts`\\`Recipes`\\`IRecipeAppService.cs`:

```csharp
public interface IRecipeAppService : ICrudAppService<
         RecipeDto,
         int,
         PagedAndSortedResultRequestDto>
{
}
```

### 04.11 - Implementing the Service
The service class will implement the CRUD operations defined in the service interface. We will extend the `CrudAppService` base class, which provides default implementations for common CRUD operations.

Location:  
`src`\\`Wasfat.Application`\\`Recipes`\\`RecipeAdminAppService.cs`:

```csharp
public class RecipeAdminAppService : CrudAppService<Recipe, RecipeDto, int, PagedAndSortedResultRequestDto>, IRecipeAppService
{
    public RecipeAdminAppService(
        IRepository<Recipe, int> repository
        )
    : base(repository)
    {

    }
}
```

### 04.12 - Exploring the API with Swagger
Once the service is implemented, we can use Swagger to explore the generated API and interact with our newly created CRUD operations. This section will guide you through testing the API endpoints using the Swagger UI.

### 04.13 - Summary
In this chapter, we successfully created a new entity and implemented a complete CRUD functionality for it using ABP.io. We covered creating the entity class, updating the `DbContext`, creating and applying database migrations, setting up DTOs, implementing the service layer, and testing the API with Swagger. With these steps, you now have a foundational understanding of managing entities in a full-stack ABP application.

***
## 05 - Customizing The CRUD Operations

### 05.01 - What You Will Learn in This Chapter
In this chapter, we will explore how to override the default CRUD operations provided by ABP.io. We'll customize each operation, including the ability to create, read, update, and delete recipes, to suit specific requirements. We will also cover how to import sample data, modify table prefixes, and handle paging in list results.

### 05.02 - Terminology
Before diving into the code, let's review some important terms that will be useful throughout this chapter.

- **`Repository`**: A repository is an abstraction layer that provides a standardized interface for interacting with the database. Thinks about it as a middleman that handles the communication between the app and the database, making it easier to retrieve or save data without directly interacting with the database.

- **`Pagination`**: A way to show a small part of the data, like displaying a few recipes at a time on a page, while also knowing how many total recipes there are.

### 05.03 - Importing Sample Data 

This is how sample data was exported during the video session.

**Exporting the Data**:
1. Go to **phpMyAdmin**.
2. Select the **database**.
3. Search for the **Recipes** table.
4. Click the **Export** tab at the top menu.
5. Click **Export** at the bottom of the page.

You can download the sample file from the GitHub repo at:  
`Wasfat`\\`Sample Data Files`\\`Chapter 05`\\`customPrefix_recipes.sql`:  

**⚠️ Note :** 
> customPrefix_ is the prefix configured above in  `public const string DbTablePrefix = "customPrefix_"; `


This is how to Import the Sample Data Provided in This Course:

**Importing the Data**:
1. Go to **phpMyAdmin**.
2. Select the **database**.
3. Click the **Import** tab at the top menu.
4. Choose the sample data file (`customPrefix_recipes.sql`).
5. Scroll to the bottom and click **Import**.


**⚠️ Note :** 
> customPrefix_ is the prefix configured above in  `public const string DbTablePrefix = "customPrefix_"; `


### 05.04 - Renaming & Assigning the Injected Repository to a Private Field

1. **Declare a private readonly field** to store the injected repository:

```csharp
private readonly IRepository<Recipe, int> _recipesRepository;
```

2. Assign the injected repository to the private field:

```csharp
public RecipeAdminAppService(IRepository<Recipe, int> recipesRepository)
    : base(recipesRepository)
{
    _recipesRepository = recipesRepository;
}
```

#### Full Example:

```csharp
public class RecipeAdminAppService : CrudAppService<Recipe, RecipeDto, int, PagedAndSortedResultRequestDto>, IRecipeAppService
{
    private readonly IRepository<Recipe, int> _recipesRepository;

    public RecipeAdminAppService(IRepository<Recipe, int> recipesRepository)
        : base(recipesRepository)
    {
        this._recipesRepository = recipesRepository; 
    }
}
```


### 05.05 - Overriding the Read Operation - Get Single Recipe
We will now override the `GetAsync` method to add custom logic when retrieving a single recipe.

```csharp
        public override async Task<RecipeDto> GetAsync(int id)
        {
            var recipe = await _recipesRepository.GetAsync(id);

            // custome logic
            recipe.Name = recipe.Name.Trim();

            var recipeDto = ObjectMapper.Map<Recipe, RecipeDto>(recipe);

            return recipeDto;
        }
```

### 05.06 - Overriding the Create Operation
Next, we'll override the `CreateAsync` method to add custom logic before saving a new recipe.

```csharp
        public override async Task<RecipeDto> CreateAsync(RecipeDto input)
        {
            var recipe = ObjectMapper.Map<RecipeDto, Recipe>(input);

            // custom logic
            recipe.Name = recipe.Name.Trim();

            await _recipesRepository.InsertAsync(recipe, autoSave: true);

            var recipeDto = ObjectMapper.Map<Recipe, RecipeDto>(recipe);

            return recipeDto;
        }
```

### 05.07 - Overriding the Update Operation
We'll override the `UpdateAsync` method to add custom logic when updating a recipe.

```csharp
        public override async Task<RecipeDto> UpdateAsync(int id, RecipeDto input)
        {
            var recipe = await _recipesRepository.GetAsync(id);

            // Only the available values from the input DTO will be applied to the recipe entity.
            // IMPORTANT: Any values not present in the DTO will remain unchanged in the recipe.
            ObjectMapper.Map<RecipeDto, Recipe>(input, recipe);

            await _recipesRepository.UpdateAsync(recipe, autoSave: true);

            var recipeDto = ObjectMapper.Map<Recipe, RecipeDto>(recipe);

            return recipeDto;
        }
```

**⛔ Warning:**  
Avoid the following approach, as it assigns the input directly to `recipe` and can result in loss of the original recipe state:

> **Incorrect**: Assigning `input` to `recipe` directly  
> `recipe = ObjectMapper.Map<RecipeDto, Recipe>(input);`


### 05.08 - Overriding the Delete Operation
We'll override the `DeleteAsync` method to add any custom logic before deleting a recipe.

```csharp
        public override async Task DeleteAsync(int id)
        {
            var recipe = await _recipesRepository.GetAsync(id);

            // custom logic
            if(recipe.Name.Contains("Shawarma", StringComparison.OrdinalIgnoreCase))
            {
                throw new UserFriendlyException("you can not delete Shawarmas");
            }

            await _recipesRepository.DeleteAsync(id);
        }
```

### 05.09 - Overriding the Read Operation - Paged List
We'll override the `GetListAsync` method to retrieve a paginated list of recipes.

```csharp
        public override async Task<PagedResultDto<RecipeDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            var totalCount = await _recipesRepository.GetCountAsync();

            var recipes = await _recipesRepository.GetPagedListAsync(
                input.SkipCount,
                input.MaxResultCount,
                input.Sorting ?? nameof(Recipe.Name)
                );

            // custom logic goes here

            var recipeDtos = ObjectMapper.Map<List<Recipe>, List<RecipeDto>>(recipes);

            var pagedResultDto = new PagedResultDto<RecipeDto>(totalCount, recipeDtos);

            return pagedResultDto;
        }
```

### 05.10 - Adding a Custom Method - Get Recent Recipes
Finally, we will add a new custom method, `GetRecentRecipesAsync`, to retrieve a few of the most recent recipes. 

```csharp
        public async Task<List<RecipeDto>> GetRecentAsync(int count = 3)
        {
            var query = await _recipesRepository.GetQueryableAsync();

            var recentRecipes = query
                                .OrderByDescending( recipe => recipe.Id )
                                .Take(count)
                                .ToList();

            var recentRecipeDtos = ObjectMapper.Map<List<Recipe>, List<RecipeDto>>(recentRecipes);

            return recentRecipeDtos;
        }
```

It's a good idea to add this to the interface so that we avoid making changes after it's been published.

Location:  
`src`\\`Wasfat.Application.Contracts`\\`Recipes`\\`IRecipeAppService.cs`:

```csharp
Task<List<RecipeDto>> GetRecentAsync(int count = 3);
```

### 05.11 - Summary
In this chapter, we successfully customized each CRUD operation in ABP.io for managing recipes. We learned how to override the default CRUD operations to implement specific business logic. Additionally, we demonstrated how to extend the `CrudAppService` by adding a custom method (`GetRecentRecipesAsync`) to fetch the most recent recipes, showcasing how to go beyond the built-in CRUD operations. These steps give you full control over your application's behavior when interacting with the database, allowing for greater flexibility and tailored functionality within your project.


***
## 06 - Configuring CLI Versions for ABP, Node, & Angular

### 06.01 - What You Will Learn in This Chapter
In this chapter, you will learn how to verify and set the correct CLI versions for ABP, Node.js, and Angular. Ensuring that these tools are compatible with each other is essential for keeping your development environment running smoothly. You will also learn how to confirm that these versions are correctly installed and functioning, so you can confidently work on your project without any version-related issues. By the end of this chapter, you’ll be able to manage and document the versions of these tools to maintain a stable and efficient workflow.

### 06.02 - Terminology
Before proceeding, let's clarify some key terms:

- **`ABP Package Versions`**: are the versions of the backend and frontend libraries provided by the ABP framework, such as `Volo.Abp.*`, used for implementing various features in your ABP.io application. It is best to ensure that these package versions are compatible with the ABP CLI, Angular CLI, Angular packages, Node.js, and NPM versions to ensure smooth development and deployment.

- **`ABP CLI Version`**: is the version of the Command Line Interface tool used to create, build, and manage ABP.io projects. It is best to ensure that this version is compatible not only with the ABP package versions but also with the Angular CLI, Angular packages, Node.js, and NPM versions to enable smooth development and deployment.

- **`Angular CLI Version`**: is the version of the command-line tool used to create, develop, and maintain Angular applications. It is best to ensure that the Angular CLI version is compatible with the Angular package versions, ABP CLI, Node.js, and NPM versions to avoid conflicts and ensure smooth development and deployment.

- **`Angular Package Versions`**: are the versions of the libraries and modules that make up the Angular framework, such as `@angular/core` and `@angular/common`. It is best to ensure that these package versions are compatible with the Angular CLI, ABP packages, ABP CLI, Node.js, and NPM versions to ensure smooth development and deployment.

- **`Node.js Version`**: is the version of the JavaScript **runtime** that executes JavaScript code on the server. It is best to ensure that the Node.js version is compatible with Angular CLI, Angular packages, ABP CLI, ABP packages, and NPM versions to ensure smooth development and deployment.

- **`NPM CLI Version`**: is the CLI version of the (Node Package Manager), bundled with Node.js, used to install, update, and manage JavaScript dependencies. Installing Node.js will automatically ensure the correct version of NPM is installed unless manually modified later.

- **`NVM Version`**: is the version of the Node Version Manager (NVM), a tool that allows developers to install, switch, and manage multiple versions of Node.js on their system. It is not critical to install a specific version of NVM; it is best to install the latest version to ensure compatibility and smooth development and deployment across different environments.

### 06.03 - Checking the Best Version for ABP CLI

1. Open your project in Visual Studio.

2. Use the shortcut `Ctrl + Shift + t` to search for the `.csproj` file, for example:

   ```bash
   Application.csproj
   ```

3. You should find a path similar to:
   
   ```
   aspnet-core\src\Wasfat.Application\Wasfat.Application.csproj
   ```

4. Inside the `.csproj` file, locate the `PackageReference` tags to check the current ABP version:
   
   ```xml
   <ItemGroup>
     <PackageReference Include="Volo.Abp.Account.Application" Version="7.4.5" />
     <PackageReference Include="Volo.Abp.Identity.Application" Version="7.4.5" />
     <PackageReference Include="Volo.Abp.PermissionManagement.Application" Version="7.4.5" />
     <PackageReference Include="Volo.Abp.TenantManagement.Application" Version="7.4.5" />
     <PackageReference Include="Volo.Abp.FeatureManagement.Application" Version="7.4.5" />
     <PackageReference Include="Volo.Abp.SettingManagement.Application" Version="7.4.5" />
   </ItemGroup>
   ```
   
5. Note the version of ABP in your project, in this case, 

    `
    7.4.5
    `

### 06.04 - Checking the Best Version for Angular CLI

1. In VSCode, press `Ctrl + P` and search for `package.json`.

2. Inside `package.json`, search for `@angular/core`:

   ```bash
   "@angular/core": "~16.2.0",
   ```

3. perform a google search for:

   ```
   angular cli releases
   ```

4. Visit the `npmjs.com` result: (at the time of the recording)

   ```
   https://www.npmjs.com/package/@angular/cli?activeTab=versions
   ```

5. Search for the latest release in the `~16.2.0` range, and take note of it, in our case:

   ```
   16.2.16
   ```

### 06.05 - Checking the Best Version for Node.js

1. Perform a Google search for:
   
   ```
   angular version compatibility
   ```

2. You should find a reference page as a result: (at the time of the recording)

   ```
   https://angular.dev/reference/releases
   ```

3. Look for the recommended Node.js versions for your Angular version:
   
   ```
   16.1.x || 16.2.x    ^16.14.0 || ^18.10.0
   ```

4. Next, search for the latest Node.js release within this range by googling:

   ```
   node releases
   ```

5. Choose the result from Nodejs.org and find the latest version in the `^18.10.0` range, for example:
   
   ```
   v18.20.4
   ```

### 06.06 - Documenting the Selected Versions in Angular's README.md File

1. Press `Ctrl + P` in VSCode and search for `README.md`.

2. Add the following section to document the versions selected:

   ```bash
   ## CLI Versions Used in This Project

   ABP: 7.4.5
   Node: 18.20.4
   Angular: 16.2.16
   ```

### 06.07 - Installing the Selected Version of ABP CLI

1. Uninstall the Current ABP CLI Version

   Run the following command to uninstall the existing ABP CLI version:

   ```bash
   dotnet tool uninstall -g Volo.Abp.Cli
   ```

2. Install the Specific Version of ABP CLI

   To install the desired version (e.g., `7.4.5`), run:

   ```bash
   dotnet tool install -g Volo.Abp.Cli --version 7.4.5
   ```

3. Verify the Installed Version

   After installation, verify the ABP CLI version:

   ```bash
   abp -v
   ```

   You should see something like this:

   `
   ABP CLI 7.4.5
   `

### 06.08 - Installing the Selected Version of Node.js (Before Angular)

1. Perform a google search for:

   ```bash
   nvm for windows
   ```

2. Go to the GitHub release page:

   ```
   https://github.com/coreybutler/nvm-windows
   ```

3. Download and install the setup file (admin rights may be needed), for example:

   ```
   https://github.com/coreybutler/nvm-windows/releases/download/1.1.12/nvm-setup.exe
   ```

4. Verify that `nvm` is installed:

   ```bash
   nvm -v
   ```
   
   Output should look like this:
   
   `
   1.1.12
   `

5. Install the Selected Node Version

   In our case, run the following command to install Node.js v18.20.4:

   ```bash
   nvm install 18.20.4
   ```

6. Verify the Installation
   List all installed Node.js versions:

   ```bash
   nvm list
   ```
   Expected output:

   ```
       20.18.0
       18.20.4
       16.19.1
     * 14.21.3 (Currently using 64-bit executable)
   ```

7. Switch to the desired Node version

   ```bash
   nvm use 18.20.4
   ```

   Verify again:

   ```bash
   nvm list
   ```

   Output should show the active version:

   ```
       20.18.0
     * 18.20.4 (Currently using 64-bit executable)
       16.19.1
       14.21.3
   ```

### 06.09 - Installing the Selected Version of Angular CLI


To install **Angular CLI v16.2.16** only for a specific project (e.g., your "custcom" project) without affecting the global version (for the entire NVM being used), you can follow these steps:


1. Make Sure You're Using the Correct Node Version

   Make sure you're using the correct Node version before installing Angular CLI:

   ```bash
   nvm use 18.20.4
   ```

2. Navigate to Your Project Directory

   Navigate to your Angular project directory:

   ```bash
   cd C:\path\to\your\repos\wasfat\Wasfat\angular
   ```

3. Install the Specific Angular CLI Version

   Run the following command to install the specific Angular CLI version (e.g., 16.2.16):
   

   ```bash
   npm install @angular/cli@16.2.16 --save-dev
   ```
    
    **⚠️ Note :** 
    > We did not use the `-g` flag to ensure that Angular CLI is installed locally with the desired version specifically for this project. This avoids potential conflicts with globally installed versions and ensures that the correct version is always used within the project.


4. Use `npx` for Angular CLI Commands

   From now on you should run Angular CLI commands using `npx` prefix to ensure you're using the local version:

   ```bash
   npx ng serve
   ```

5. Verify the Installed Angular Version
 
   ```bash
   npx ng version
   ```

### 06.10 - Verifying Node: Installing `node_modules`

   Once you have ensured that all the CLI versions (ABP, Node.js, Angular) are set correctly, you should be able to install the required `node_modules` without any issues by running the following command:

   ```bash
   npm install
   ```

   This command installs all dependencies defined in your `package.json` file.

### 06.11 - Verifying ABP CLI: Generating Proxy

   After verifying that the ABP CLI version is correctly installed, you can generate the Angular proxies by running the following command:

   ```bash
   abp generate-proxy -t ng
   ```

   This will generate the necessary Angular proxy services for communicating with the backend.

### 06.12 - Verifying Angular CLI: Running Angular Commands
   
   With the correct version of Angular CLI installed, you can now run Angular-specific commands, like serving the Angular project. To ensure everything is working properly, use:

   ```bash
   npx ng serve
   ```

   This will start the Angular development server and allow you to view your project in the browser. You can also use this to run other Angular commands such as generating components or services.

### 06.13 - Summary
In this chapter, we successfully checked, set, and verified the correct versions for ABP CLI, Node.js, and Angular CLI. We walked through how to check the versions, install them, and document them for future use. Additionally, we verified that Node dependencies could be installed, the Angular proxy could be generated, and Angular CLI commands run smoothly. Managing these versions ensures that your development environment remains consistent and reliable, preventing potential compatibility issues throughout your project's lifecycle.
