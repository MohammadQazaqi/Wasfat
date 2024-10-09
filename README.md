# Wasfat

# Mastering Full-Stack Development with ABP.io

## Introduction
### What You Will Learn in This Course
### What You Need to Know

## Setting Up the Development Environment
### Intro: Setting Up the Development Environment
### Installing Node
- node version : **20.18.0**
### Installing Visual Studio
- Community Edition : **version 2022**
- make sure configure to run as administrator  
### Installing Visual Studio Code
- make sure configure to run as administrator  
### Installing ABP.io CLI
```
dotnet tool install -g Volo.Abp.Cli --version 7.4.0
```
### Installing Angular CLI
```
npm install -g @angular/cli@16.2.16
```

### Installing the XAMPP Server
- version: 8.0.30
- make sure configure to run as administrator  
### Summary: Setting Up the Development Environment

## Creating Our ABP Project

### Intro
In this chapter, you will learn how to create your first ABP project using the ABP CLI. We will also cover setting up a GitHub repository to manage your project, cloning it locally, and configuring the project for development.

### Creating Our GitHub Repository
To manage your project’s code, we will create a GitHub repository. Follow these steps:
1. Go to [GitHub](https://github.com) and log in.
2. Click on **New** to create a new repository.
3. Give your repository a name, such as **Wasfat**, choose the visibility (public/private), and add a ReadMe file.
4. Click **Create Repository**.

### Cloning Our Repository to Local Machine
Once the repository is created, clone it to your local machine:
```bash
git clone https://github.com/your-username/Wasfat.git
cd Wasfat
```

### Creating Our Wasfat ABP Project
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

### Summary
In this chapter, we successfully set up our GitHub repository, cloned it, and created our first ABP project. You are now ready to start building your full-stack application using ABP.io!




## Running Our Wasfat ABP Project

### Intro
In this chapter, we will walk through the steps necessary to run the Wasfat ABP project. This includes Starting the Database Server, Creating the Database and the Database User, updating the database, starting the backend API, installing the frontend dependencies, generating API proxies, and serving the Angular app. By the end of this chapter, your project should be fully functional on both the backend and frontend.

### Starting the Database Server
Before creating the database, make sure your database server (e.g., MySQL) is up and running. This video will show you how to start the MySQL server on your local machine or remote server.

### Creating the Database and the Database User
In this video, we will walk through how to create a new MySQL database and user. This will ensure that ABP can connect and manage the database schema.

### Configuring ABP to Use Our Database
After creating the database and user, we'll configure ABP to connect to this database by updating the `appsettings.json` file.
```
"ConnectionStrings": {
  "Default": "Server=localhost;Port=3306;Database=tasty-bites;Uid=tasty-bites-db-user;Pwd=P@ssw0rd!;"
},
```

### Updating the Database with the Initial Migration
Before running the project, you need to ensure that the database is up to date by applying the initial migration.

### Running the HttpApi.Host
Next, start the backend API by running the `HttpApi.Host` project. This will ensure that the API is available to communicate with the frontend.



### Installing Frontend Dependencies
Now, navigate to the Angular frontend folder and install the necessary npm packages.

```ps
npm install
```

### Serving the Angular App
Once everything is set up, serve the Angular app to run it locally in the browser.
```bash
ng serve -o
```

#### Explanation of the command:
- `ng serve`: Starts a development server for the Angular app.
- `-o`: Opens the app automatically in the default browser.

#### Troubleshooting an ng serve problem 
we used ChatGpt to troubleshoot angular serving problem problem and we got this command

```ps
npm install bootstrap-icons
```

### Summary
In this chapter, we successfully started the database server, created the database and user, configured ABP to connect to the database, updated the database schema, ran the backend API, installed frontend dependencies, and served the Angular app. Your Wasfat project is now fully operational and ready for development and testing!





## 04 - Building Backend CRUD Endpoints for Recipes

### 04.01 - What We Will Build in This Chapter
In this chapter, we are going to create the parts of our app that let us add, view, change, and remove recipes from the database. This is known as **CRUD**, which stands for Create, Read, Update, and Delete. We'll start by setting up the recipe structure and then make it possible to save and manage recipes in the database.

### 04.02 - Terminology

In order to understand this chapter, it's important to familiarize ourselves with some key terminology that we will encounter.

- **`Entity`**: A class that represents a data model in the application. It corresponds to a table in the database and typically has properties that map to columns in that table. For example, a `Recipe` entity might have properties like `Name` and `Description`, which would be represented as columns in a `Recipes` table in the database.
- **`EntityDTO (Data Transfer Object)`**: An object used to transfer data between different layers of an application, such as from the backend to the frontend, without exposing the entire entity.
- **`Mapping`**: The process of converting data from one format to another, such as from an entity to a DTO or vice versa.
- **`ReverseMap`**: A method in AutoMapper used to configure bidirectional mapping between two types, allowing data to be converted back and forth.
- **`CRUD`**: An acronym for Create, Read, Update, Delete, which are the basic operations for managing data in an application.
to the database.
- **`Migration`**: A way to version control changes to the database schema, such as creating or altering tables and columns.
development of CRUD services.
- **`Swagger`**: An open-source tool used for documenting and testing RESTful APIs, providing a user interface to interact with the endpoints.

### 04.03 - Creating the Entity Class
To start, we will define our entity class, which represents the data structure we want to manage in our application. The entity will include basic properties such as `Name` and `Description`.

```csharp
    public class Recipe : Entity<int>
    {
        public string Name { get; set; }
        public string Description { get; set; } 
    }
```

### 04.04 - Updating the DbContext
Next, we need to update our `WasfatDbContext` class to include the new entity. This will allow ABP to manage the entity in the database.

Add the following line to your `WasfatDbContext` class public properties:

```csharp
public DbSet<Recipe> Recipes { get; set; }
```

Then, configure the entity within the `OnModelCreating` method:

```csharp

        builder.Entity<Recipe>(b =>
        {
            b.ToTable(WasfatConsts.DbTablePrefix + "Recipes",
                WasfatConsts.DbSchema);
            b.ConfigureByConvention();
        });
```

### 04.05 - Creating a Migration
After updating the `DbContext`, we need to create a new migration to apply the changes to the database. This step will generate the necessary scripts to update the database schema.

```bash
Add-Migration CreateRecipesTable

```

### 04.06 - Applying the Migration
Once the migration has been created, the next step is to update the database to apply the migration. This will modify the database schema based on the changes defined in the migration.

```bash
Update-Database
```

### 04.07 - Creating the Data Transfer Object (DTO)
DTOs are used to transfer data between the application layers. In this section, we will create DTOs for the entity to be used in service methods.

```csharp
    public class RecipeDto : EntityDto<int>
    {
        public string Name { get; set; }
        public string Description { get; set; } 
    }
```

### 04.08 - Setting Up the Mapper Profile
To map between the entity and its DTO, we need to create a `MapperProfile`. This profile will handle the conversion between the entity and its corresponding DTOs.

```bash
    public class RecipeMapperProfile : Profile
    {
        public RecipeMapperProfile()
        {
            CreateMap<Recipe, RecipeDto>().ReverseMap();
        }
    }
```

### 04.09 - Defining the Service Interface
The service interface defines the contract for our service, specifying which operations are available. Here, we will implement the `ICrudAppService` interface to provide basic CRUD functionality.

```csharp
    public interface IRecipeAppService : ICrudAppService<
             RecipeDto,
             int,
             PagedAndSortedResultRequestDto>
    {
    }
```

### 04.10 - Implementing the Service
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

### 04.11 - Understanding Service vs. Service Interface
A service interface defines the contract (methods) that a service class must implement, while the service class provides the actual implementation of these methods, handling the business logic. The interface allows for flexibility, enabling different implementations of the service.

### 04.12 - Exploring the API with Swagger
Once the service is implemented, we can use Swagger to explore the generated API and interact with our newly created CRUD operations. This section will guide you through testing the API endpoints using the Swagger UI.

### 04.12 - Summary
In this chapter, we successfully created a new entity and implemented a complete CRUD functionality for it using ABP.io. We covered creating the entity class, updating the `DbContext`, creating and applying database migrations, setting up DTOs, implementing the service layer, and testing the API with Swagger. With these steps, you now have a foundational understanding of managing entities in a full-stack ABP application.
