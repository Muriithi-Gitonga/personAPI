# userAPI
This is a simple REST API capable of CRUD operations on a "person" resource

## Technologies Used
This application has been built with the following tools:

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

- **Ruby `v3.0.2`**
- **rails `v7.0.7`**

## Project Setup
You can set up this repository by following this manual

1. Clone the repository
    ```{shell}
   git clone git@github.com:Muriithi-Gitonga/personAPI.git
   ```
2. Navigate to the project directory
    ```{shell}
   cd personAPI
   ```
3. Ensure the ruby gems are set up in your machine
    ```{shell}
   bundle install
   ```
4. Perform any pending database migrations
   ```{shell}
   rails db:migrate
   ```
5. Run the application
    ```{shell}
    rails server
    ```
6. Open the application from your browser
    ```
   http://localhost:3000
   ```



## Database Setup

- **PostgreSQL** - Used in the `development` and `production` environments.

The following section illustrates how to set up PostgreSQL on Debian based Linux distros `Ubuntu, Parrot, Kali Linux etc.`<br/>
You can find alternate installation instructions for a different operating system [here](https://www.postgresql.org/download/).

### Step 1 :- Installing PostgreSQL

Postgres is available from the default repositories of all Debian distributions. You can use `apt` for installation.

- Install Postgres
```
$ sudo apt update
$ sudo apt install postgresql postgresql-contrib
```

- Ensure that the server is running using the systemctl start command:
```{shell}
$ sudo systemctl start postgresql.service
```

### Step 2 :- Using PostgreSQL Roles and Databases

- Switch over to the postgres account on your server by typing:
```{shell}
$ sudo -i -u postgres
```
- Access the Postgres prompt immediately by typing:
```{shell}
$ psql
```
- Exit out of the PostgreSQL prompt by typing:
```{shell}
$ \q
```

### Step 3 (`optional`) :- Setting up a custom user role on Postgres
Since the `postgres` user is the default user upon installation, you can set up a new user to access the db with the application.

- Create a new user, make sure you replace `$USER` with the name of the user you want:
```{shell}
$ sudo -u postgres createuser --superuser $USER
```


## Application

The application database includes a single table called people. This table stores information about the person resource and has a single column called name. This column is of type string and is required.

The people table is used to manage person data within the application. Person can be retrieved, created, updated, and deleted through API endpoints or application functionality.

## People table


| Column Name | Data Type | Constraints |
| ----------- | --------- | ----------- |
| id          | integer   | primary key |
| name        | string    | not null    |

## API Doucmentation

<!-- poin at the documentaion.md in this folder -->
[API Documentation](DOCUMENTATION.md)







