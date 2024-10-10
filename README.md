# Wasfat

# Mastering Full-Stack Development with ABP.io

## 01 - Introduction
### 01.01 - What You Will Learn in This Course
### 01.02 - What You Need to Know

## 02 - Setting Up the Development Environment
### 02.01 - Intro: Setting Up the Development Environment
### 02.02 - Installing Node
- Node version: **20.18.0**
### 02.03 - Installing Visual Studio
- Community Edition: **version 2022**
- Make sure to configure it to run as administrator
### 02.04 - Installing Visual Studio Code
- Make sure to configure it to run as administrator
### 02.05 - Installing ABP.io CLI
```
dotnet tool install -g Volo.Abp.Cli --version 7.4.0
```
### 02.06 - Installing Angular CLI
```
npm install -g @angular/cli@16.2.16
```

### 02.07 - Installing the XAMPP Server
- Version: 8.0.30
- Make sure to configure it to run as administrator
### 02.08 - Summary: Setting Up the Development Environment

## 03 - Creating Our ABP Project

### 03.01 - Intro
In this chapter, you will learn how to create your first ABP project using the ABP CLI. We will also cover setting up a GitHub repository to manage your project, cloning it locally, and configuring the project for development.

### 03.02 - Creating Our GitHub Repository
To manage your project’s code, we will create a GitHub repository. Follow these steps:
1. Go to [GitHub](https://github.com) and log in.
2. Click on **New** to create a new repository.
3. Give your repository a name, such as **Wasfat**, choose the visibility (public/private), and add a ReadMe file.
4. Click **Create Repository**.

### 03.03 - Cloning Our Repository to Local Machine
Once the repository is created, clone it to your local machine:
```bash
git clone https://github.com/your-username/Wasfat.git
cd Wasfat
```

### 03.04 - Creating Our Wasfat ABP Project
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

### 03.05 - Summary
In this chapter, we successfully set up our GitHub repository, cloned it, and created our first ABP project. You are now ready to start building your full-stack application using ABP.io!

## 04 - Running Our Wasfat ABP Project

### 04.01 - Intro
In this chapter, we will walk through the steps necessary to run the Wasfat ABP project. This includes starting the Database Server, creating the Database and the Database User, updating the database, starting the backend API, installing the frontend dependencies, generating API proxies, and serving the Angular app. By the end of this chapter, your project should be fully functional on both the backend and frontend.

### 04.02 - Starting the Database Server
Before creating the database, make sure your database server (e.g., MySQL) is up and running. This video will show you how to start the MySQL server on your local machine or remote server.

### 04.03 - Creating the Database and the Database User
In this video, we will walk through how to create a new MySQL database and user. This will ensure that ABP can connect and manage the database schema.

### 04.04 - Configuring ABP to Use Our Database
After creating the database and user, we'll configure ABP to connect to this database by updating the `appsettings.json` file.
```
"ConnectionStrings": {
  "Default": "Server=localhost;Port=3306;Database=dataBase-name;Uid=dataBase-user-name;Pwd=SecretPassword;"
},
```

### 04.05 - Updating the Database with the Initial Migration
Before running the project, you need to ensure that the database is up to date by applying the initial migration.

### 04.06 - Running the HttpApi.Host
Next, start the backend API by running the `HttpApi.Host` project. This will ensure that the API is available to communicate with the frontend.

### 04.07 - Installing Frontend Dependencies
Now, navigate to the Angular frontend folder and install the necessary npm packages.

```ps
npm install
```

### 04.08 - Serving the Angular App
Once everything is set up, serve the Angular app to run it locally in the browser.
```bash
ng serve -o
```

#### Explanation of the command:
- `ng serve`: Starts a development server for the Angular app.
- `-o`: Opens the app automatically in the default browser.

### 04.09 - Troubleshooting an ng serve Problem
We used ChatGPT to troubleshoot an Angular serving problem and got this command:

```ps
npm install bootstrap-icons
```

### 04.10 - Summary
In this chapter, we successfully started the database server, created the database and user, configured ABP to connect to the database, updated the database schema, ran the backend API, installed frontend dependencies, and served the Angular app. Your Wasfat project is now fully operational and ready for development and testing!

## 05 - Building Backend CRUD Endpoints for Recipes

### 05.01 - What We Will Build in This Chapter
In this chapter, we are going to create the parts of our app that let us add, view, change, and remove recipes from the database. This is known as **CRUD**, which stands for Create, Read, Update, and Delete. We'll start by setting up the recipe structure and then make it possible to save and manage recipes in the database.

### 05.02 - Terminology
In order to understand this chapter, it's important to familiarize ourselves with some key terminology that we will encounter.

- **`Entity`**: A class that represents a data model in the application. It corresponds to a table in the database and typically has properties that map to columns in that table. For example, a `Recipe` entity might have properties like `Name` and `Description`, which would be represented as columns in a `Recipes` table in the database.
- **`EntityDTO (Data Transfer Object)`**: An object used to transfer data between different layers of an application, such as from the backend to the frontend, without exposing the entire entity.
- **`Mapping`**: The process of converting data from one format to another, such as from an entity to a DTO or vice versa.
- **`CRUD`**: An acronym for Create, Read, Update, Delete, which are the basic operations for managing data in an application.
- **`Migration`**: A way to version control changes to the database schema, such as creating or altering tables and columns.
- **`Swagger`**: An open-source tool used for documenting and testing RESTful APIs, providing a user interface to interact with the endpoints.

### 05.03 - Creating the Entity Class
To start, we will define our entity class, which represents the data structure we want to manage in our application. The entity will include basic properties such as `Name` and `Description`.

```csharp
    public class Recipe : Entity<int>
    {
        public string Name { get; set; }
        public string Description { get; set; } 
    }
```

### 05.04 - Adding the Recipe Entity to the DbContext
Next, we need to update our `WasfatDbContext` class to include the new entity. This will allow ABP to manage the entity in the database.

Add the following line to your `WasfatDbContext` class public properties:

```csharp
public DbSet<Recipe> Recipes { get; set; }
```

### 05.05 - Mapping the Recipe Entity to a Database Table
Then, configure the entity within the `OnModelCreating` method:

```csharp
        builder.Entity<Recipe>(b =>
        {
            b.ToTable(WasfatConsts.DbTablePrefix + "Recipes",
                WasfatConsts.DbSchema);
            b.ConfigureByConvention();
        });
```

### 05.06 - Adding a Migration
After updating the `DbContext`, we need to create a new migration to apply the changes to the database. This step will generate the necessary scripts to update the database schema.

```bash
Add-Migration CreateRecipesTable
```

### 05.07 - Applying the Migration
Once the migration has been created, the next step is to update the database to apply the migration. This will modify the database schema based on the changes defined in the migration.

```bash
Update-Database
```

### 05.08 - Creating the Data Transfer Object (DTO)
DTOs are used to transfer data between the application layers. In this section, we will create DTOs for the entity to be used in service methods.

```csharp
    public class RecipeDto : EntityDto<int>
    {
        public string Name { get; set; }
        public string Description { get; set; } 
    }
```

### 05.09 - Setting Up the Mapper Profile
To map between the entity and its DTO, we need to create a `MapperProfile`. This profile will handle the conversion between the entity and its corresponding DTOs.

```csharp
    public class RecipeMapperProfile : Profile
    {
        public RecipeMapperProfile()
        {
            CreateMap<Recipe, RecipeDto>().ReverseMap();
        }
    }
```

### 05.10 - Defining the Service Interface
The service interface defines the contract for our service, specifying which operations are available. Here, we will implement the `ICrudAppService` interface to provide basic CRUD functionality.

```csharp
    public interface IRecipeAppService : ICrudAppService<
             RecipeDto,
             int,
             PagedAndSortedResultRequestDto>
    {
    }
```

### 05.11 - Implementing the Service
The service class will implement the CRUD operations defined in the service interface. We will extend the `CrudAppService` base class, which provides default implementations for common CRUD operations.

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

### 05.12 - Exploring the API with Swagger
Once the service is implemented, we can use Swagger to explore the generated API and interact with our newly created CRUD operations. This section will guide you through testing the API endpoints using the Swagger UI.

### 05.13 - Summary
In this chapter, we successfully created a new entity and implemented a complete CRUD functionality for it using ABP.io. We covered creating the entity class, updating the `DbContext`, creating and applying database migrations, setting up DTOs, implementing the service layer, and testing the API with Swagger. With these steps, you now have a foundational understanding of managing entities in a full-stack ABP application.
