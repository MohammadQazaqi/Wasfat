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
npm install -g @angular/cli@18.2.7
```

``` correction
npm uninstall -g @angular/cli
npm install -g @angular/cli@17.1.2
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
- `-dbms MySQL`: Configures MySQL as the database.
- `-m none`: Creates the project without modules (basic setup).
- `--theme basic`: Adds a basic theme to the UI.
- `--pwa`: Enables Progressive Web App (PWA) support.
- `-csf`: Enables Cross-Site Request Forgery (CSRF) protection. 
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

### Updating the Database with the Initial Migration
Before running the project, you need to ensure that the database is up to date by applying the initial migration.

### Running the HTTP.Host API
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

### Troubleshooting an ng serve problem 
we used ChatGpt to troubleshoot angular serving problem problem and we got this command

```ps
npm install bootstrap-icons
```


### Summary
In this chapter, we successfully started the database server, created the database and user, configured ABP to connect to the database, updated the database schema, ran the backend API, installed frontend dependencies, generated API proxies, and served the Angular app. Your Wasfat project is now fully operational and ready for development and testing!