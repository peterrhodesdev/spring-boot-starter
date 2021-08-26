# Spring Boot starter

Spring Boot starter web application that uses Maven.

Check out [this blog post](https://peterrhodes.dev/blog/post/spring-boot-getting-started) for more details.

## Get the code

Use one of the methods given below to get the project source code on your local machine.

### Clone

SSH:

```bash
git clone git@github.com:peterrhodesdev/spring-boot-starter.git
```

HTTPS:

```bash
git clone https://github.com/peterrhodesdev/spring-boot-starter.git
```

GitHub CLI:

```bash
gh repo clone peterrhodesdev/spring-boot-starter
```

### Fork and clone

```bash
gh repo fork peterrhodesdev/spring-boot-starter --clone=true
```

### Add a remote + pull

```bash
mkdir spring-boot-starter
cd spring-boot-starter
git init
git remote add spring-boot-starter git@github.com:peterrhodesdev/spring-boot-starter.git
git pull spring-boot-starter main
```

## Run

Run the command below from the project root directory to startup the server.

```bash
mvn spring-boot:run
```

> The project dependencies will be downloaded when running the app for the first time.

Navigate to <http://localhost:8080/> or <http://localhost:8080/home> to view the home page.

<img src="/assets/img/blog/post/spring-boot-getting-started/home.png" alt="Home page">

Navigate to a different subdirectory to view the error page, e.g. <http://localhost:8080/invalid>.

<img src="/assets/img/blog/post/spring-boot-getting-started/error.png" alt="Error page">

To stop the server, go back to the terminal window and press `ctrl + C`.
