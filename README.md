# DevOps From Scratch (Early Access)
Author: David Bour, *version: 0.0.5*

- [DevOps From Scratch (Early Access)](#devops-from-scratch-early-access)
  - [Who is this for?](#who-is-this-for)
  - [What is DevOps?](#what-is-devops)
  - [How this Guide Works](#how-this-guide-works)
  - [The Setup](#the-setup)
    - [MacOS](#macos)
    - [Windows](#windows)
    - [Linux](#linux)
    - [All Systems](#all-systems)
  - [A Good First DevOps Task](#a-good-first-devops-task)
    - [The Scenario](#the-scenario)
    - [The Analysis](#the-analysis)
    - [The Approach](#the-approach)
      - [Version Control](#version-control)
      - [Local Development](#local-development)
    - [The Recap](#the-recap)
  - [Build. Test. Break. Repeat.](#build-test-break-repeat)
    - [The Scenario](#the-scenario-1)
    - [The Analysis](#the-analysis-1)
    - [The Approach](#the-approach-1)
      - [Unit Testing](#unit-testing)
    - [The Recap](#the-recap-1)
  - [Coming Up](#coming-up)


## Who is this for?

This guide is for anyone who is curious about DevOps. Basic knowledge of computers is implied, but we don't expect anything beyond knowing how to *Google* to find resources.

## What is DevOps?

If you *Google* the definition of DevOps, you'll come across a plethora of different answers. If you further look into job ads, you'll be further inundanted by the sheer amount of titles; DevOps, DevSecOps, SRE, Platform Engineer, Software Engineer in DevOps, and so on.

For the sake of this guide, we're going to add our own definition as well. DevOps is the act of bridging the gap between software developers and the operations team. It involves creating a robust software delivery pipeline with a high degree of predictability in its outcomes. 

If we were to make an analogy to this delivery pipeline, we could say the software delivery pipeline is akin to an assembly line like the one you see in a car manufacturing plant. Instead of shipping car parts, we're shipping code. Instead of the car being the final product, we're standing up an application. As in the field of car manufacturing, we also want to ensure our product passes quality assurance tests.

With that said, our main focus on this guide will be around the concept of a software pipeline which is composed of building, testing, deploying, and observability.

No matter what definition of DevOps you choose to adopt or job title you obtain, you'll more than likely have to deal with one or more of these areas within the software delivery pipeline. The goal of this guide is to get you started in the field of DevOps and hopefully help guide you in decide your career choices as you explore the different topics.

## How this Guide Works

I believe the best way to learn something is to implement it yourself. With that said, there will be sections where you'll be forced to do some research of your own. 

This guide isn't meant to hold your hand through each concept, but do not fret! I'll be providing some assistance so you're not completely on your own. The feelings of frustration, anxiety, and enlightenment are common when you're learning something new. The practices in DevOps are always changing, which means you'll more than likely find yourself in the same loop of learning a new concept or technology. 

Developing the ability to navigate these challenges will pay dividends as you advance in your career.

The exercises will have the following format

1. A business case/problem statement.
2. A breakdown of the task(s).
3. A hands on implementation to complete the tasks.
4. A reflection portion. This is important! We will summarize our accomplishments and use this as the basis for your portfolio.

## The Setup

This section has no code. It's an excercise to get you familiar with your development environment.

> **WARNING!** If you do not know how to use *PowerShell* on Windows, *Terminal* on macOS, or *bash* in Linux, you need to learn that first.
> 1. Linux | __bash__ - https://www.codecademy.com/catalog/language/bash
> 2. Windows | __PowerShell__ - https://www.codecademy.com/learn/learn-powershell
> 3. macOS | __Terminal__ - https://www.codecademy.com/catalog/language/bash
>
> *Note:* *Bash* was listed twice for both macOS and Linux. Since the macOS operating system is based on Unix, the *Terminal* can use *bash* shell. If you wish, you can also use *bash* on Windows. See [this resource](https://learn.microsoft.com/en-us/windows/wsl/install) for more information. I highly recommend going this route for Windows.

### MacOS

1. Install [Homebrew](https://brew.sh/). *Homebrew* is a package manager that allows you to install software on your Desktop that can easily be removed. This helps with keeping your system clean since you'll be installing a good deal of software.

2. Install Python3 (version 3.11.4)
> *Note: I tried my best to keep the code compatible with all Python3 versions, so don't worry if you don't have the same exact version listed here.*
```bash
brew install python
```

1. Confirm you have Python 3 installed by opening up your *Terminal* and typing `python` or `python3`

You should see something like the following.
```bash
Python 3.11.4 (main, Jun 20 2023, 17:37:48) [Clang 14.0.0 (clang-1400.0.29.202)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Type in `exit()` to exit the Python interpreter.


### Windows

1. Install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). All instructions will be through *bash* so it's imperative you install *WSL*. I recommend choosing *Ubuntu* as your Linux distribution.

2. Install Python3 (version 3.11.4)
> *Note: I tried my best to keep the code compatible with all Python3 versions, so don't worry if you don't have the same exact version listed here.*

Using the Ubuntu distribution of WSL, install Python using `apt`
```bash
sudo apt update
```

```bash
sudo apt install python3
```

3. Confirm you have Python 3 installed by opening up your *Terminal* and typing `python` or `python3`

You should see something like the following.
```bash
Python 3.11.4 (main, Jun 20 2023, 17:37:48) [Clang 14.0.0 (clang-1400.0.29.202)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Type in `exit()` to exit the Python interpreter.


### Linux

1. Linux has a variety of operating systems with many ways to install software. I'm assuming that if you're running Linux, you know how to install packages.

2. Install Python3 (version 3.11.4).
> *Note: I tried my best to keep the code compatible with all Python3 versions, so don't worry if you don't have the same exact version listed here.*

### All Systems

1. Install [Visual Studio Code](https://code.visualstudio.com/). This is where we'll write our code and configurations.
2. Install *git*
   1. https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
   2. Resources to get started with *git*. **Note:** DO NOT SKIP THIS. *git* is vital to our software pipeline.
      1. Learning git - https://docs.github.com/en/get-started/getting-started-with-git
      2. Interactive learning - https://learngitbranching.js.org/
3. Create an account on [Github](https://github.com/). Github is a useful *version control system* based on *git* where we save and share our code remotely.

4. Install [Docker](https://docs.docker.com/engine/install/). *Docker* is used to manage container images. You don't have to know more at the moment beyond the fact that *Docker* will be used to house our applications so they run the same on anyone's computer, including ones running in the cloud such as AWS (Amazon Web Services).

## A Good First DevOps Task

If you recall, we're going to center the teachings of DevOps principles around the concept of a software delivery pipeline. A software delivery pipeline usually consists of the following components:

1. Software Development (Software Development Lifecycle)
    - Local Development

2. Build Step (Continuous Integration)
    - Unit Testing
    - Integration Testing
    - Artifact Management
    - Code Quality Scans

3. Deploy Step (Continuous Delivery/Deployment)
    - Infrastructure Setup
    - Environment Setup
    - Observability

### The Scenario

You've recently joined a software team that has developed an application displaying dogs up for adoption at a local shelter. Each team member has their own way of setting up a local developer environment to run the web application locally. Currently, they are sharing their code through email, so whenever a member changes something, another member has to review each change line by line. Each time a team member makes a change, they save the file with a new version number to have a historical backup of what worked. This process is lengthy and highly error-prone.

### The Analysis

After rubbing your eyes in disbelief, you come to realize they have no *software development practices* in place. As you come to grips with the situation, you come up with the following conclusions:

1. Each person is saving backups of older copies of the application by creating a new file and giving it a version number each time they make changes. If these files are deleted, they'll lose all of their records! Also, since they have no quick way of seeing what changed between versions of code, they will most likely have to compare everything, including the lines of code that did not change!

2. Each person has their unique way of setting up the application. This means when a feature doesn't work as expected, it will be difficult to discern if its because of a local configuration issue on someone's computer or if it's an actual software bug.

### The Approach

#### Version Control

   The team needs a version control system. We'll use `.git` to version control their application. This saves the team from having to store multiple copies of the file. It also allows the members to then use an external `.git` host such as *Github*.

   Remember when I mentioned to not skip the `.git` lessons? If you missed that, please take some time and invest in learning more about it. Here are some recommended resources
   
  - [Learning git](https://docs.github.com/en/get-started/getting-started-with-git)
  - [Git Interactive learning](https://learngitbranching.js.org/)

   Let's get our Github Repository set up.

   1. Create an empty directory called `dog-api`
   ```bash
   mkdir dog-api
   ```

   2. Create a [Github Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/quickstart-for-repositories) and give it a name such as `dog-api`. Make sure the repository is set to *public*. We want to show it off after all!

   3. In your `dog-api` directory, follow the instructions on how to setup a new Github repository. *Hint*: it starts with `git init`.

   3. Next, we'll be creating three files 
      1. **Filename**: dog_api.py
      ```bash
      mkdir dog_api.py
      ```

      Add the following contents to `dog_api.py`
      ```python
        from fastapi import FastAPI, HTTPException
        from fastapi.responses import HTMLResponse
        import requests

        app = FastAPI()

        DOG_API_URL = "https://dog.ceo/api/breeds/image/random"

        @app.get("/", response_class=HTMLResponse)
        async def get_random_dog():
        try:
            response = requests.get(DOG_API_URL)
            response.raise_for_status()
            data = response.json()
            image_url = data["message"]
            return f"""
            <html>
            <head>
                <title>DevOps Dog Shelter</title>
            </head>
            <body>
                <h1>DevOps From Scratch Dog Shelter</h1>
                <img src="{image_url}" alt="DevOps From Scratch Dog Shelter">
            </body>
            </html>
            """
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
      ```

      This is our application that will show a picture of a random dog. API is courtesy from https://dog.ceo/dog-api.

      2. **Filename**: requirements.txt
      ```bash
      mkdir requirements.txt
      ```

      Add the following contents to `requirements.txt`

        ```bash
        annotated-types==0.6.0
        anyio==4.3.0
        certifi==2024.2.2
        charset-normalizer==3.3.2
        click==8.1.7
        fastapi==0.110.0
        h11==0.14.0
        httptools==0.6.1
        idna==3.6
        pydantic==2.6.3
        pydantic_core==2.16.3
        python-dotenv==1.0.1
        PyYAML==6.0.1
        requests==2.31.0
        sniffio==1.3.1
        starlette==0.36.3
        typing_extensions==4.10.0
        urllib3==2.2.1
        uvicorn==0.28.0
        uvloop==0.19.0
        watchfiles==0.21.0
        websockets==12.0
        ```

        This file is a list of dependencies that our application needs to run.

      3. **Filename**: .gitignore (yes, there's a dot in front). Learn more about .gitignore [here](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files).
      ```bash
      mkdir .gitignore
      ```

      Add the following contents to `.gitignore`
      ```bash
      venv/
      __pycache__/
      ```

   4. To run the application locally, do the following on the command line
        1. Go to the `dog-api` directory
        ```bash
        cd dog-api
        ```
        2. Create a [Python virtual environment](https://docs.python.org/3/library/venv.html). This is used to keep the Python dependencies on your system clean. Read more [here](https://docs.python.org/3/library/venv.html).
        ```bash
        python3 -m venv venv
        ```
        3. Activate the virtual environment
        ```bash
        source venv/bin/activate
        ```
        4. Install the dependencies by running
        ```bash
        pip install -r requirements.txt
        ```
        5. Run the following command to run the application
        ```bash
        uvicorn "dog_api:app"
        ```
        6.  You should see a similar output as shown below
        ```bash
        INFO:     Started server process [53543]
        INFO:     Waiting for application startup.
        INFO:     Application startup complete.
        INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
        ```
        7.  If you open a web browser and go to http://127.0.0.1:8000 , you should see a picture of a dog thats ready to be adopted!

        8.  Store the application in the Github repository. Your repository should have the following folder structure.
        ```bash
        app
        ├── dog_api.py
        └── requirements.txt
        └── .gitignore
        ```

         9.  Version control alas! The last step is to provide the team with guidance on a branching strategy. There are many different branching strategies such as Gitflow, GitHub Flow, and Trunk Based Development. Read more about each strategy [here](https://launchdarkly.com/blog/git-branching-strategies-vs-trunk-based-development/). Since the team is still pretty new to DevOps practices, you decided to go with GitHub flow as the recommended approach.

         10. Create a new file called `README.md` under the `app` directory and add your name to it. Submit this new file into the codebase using the concepts of GitHub flow.

         11. After merging the changes to the *trunk* (aka HEAD or main), create a release and name it `1.0.0`. Learn more about creating Github Releases [here](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository). The `1.0.0` is based on the *semver* semantics which you can read up more [here](https://semver.org/).

#### Local Development

   Let's re-visit the following case:

   > *Each person has their unique way of setting up the application. This means when a feature doesn't work as expected, it will be difficult to discern if its because of a local configuration issue on someone's computer or if it's an actual software bug.*

   Creating an efficient software delivery pipeline means providing software developers with a quicker way to test and iterate on their designs. As DevOps practitioners, we can help shorten this design loop by building out what the industry calls a "developer environment". Developer environments come in many forms today, ranging from running locally on a personal laptop to a fully-fledged remote integration environment on the cloud. For our approach, we'll focus on the simplest option, which is optimizing the *local* developer environment.

   In this section, we will explore the usage of *containers* as a technology to help address the issue of reproducibility.

   We can think of containers as segregated computers within your own computer. There is an older technology that is called "Virtual Machines" or VM for short, which shares similarities to containers. We will skip covering VMs for now as they do not provide the the same level of disposability as containers do. When I refer to disposability, I'm emphasizing the fact that containers have a smaller resource footprint on your computer which means we can easily spin up and bring down containers. There are many container engines in the market nowadays such as Docker, containerd, podman, and much more. In this section, we'll stick with one of the most popular options: Docker.

   1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

   2. Read through the [tutorial](https://docs.docker.com/get-started/) on the Docker website to get an understanding of how containers work.

   3. We're going to revisit our "Dog API" application and containerize it. When containerizing an application, there are many things to take into consideration such as
      1. Which base image should I use?
      2. How do I label/tag my images?
      3. Where should I store the image?
      4. Could I use [multi-stage](https://docs.docker.com/build/building/multi-stage/) builds to optimize the size?
  
      I encourage you to do some research yourself on how others have approached these scenarios.

 4. Since our API is built using Python, we will stick with the most straight forward approach and use the public [Python Docker image](https://hub.docker.com/_/python).

 5. Let's create a Dockerfile inside the same directory `app`.
    ```bash
    touch Dockerfile
    ```

    Within the `Dockerfile`, let's add some content. Everything with the `#` is a code comment which means it will not be interpreted. You can choose to leave out the comments if you wish.
    ```Dockerfile
    # This is 'platform' or 'base image' that we're using
    # to construct our Dockerfile. Most of the Python base images
    # run on the Linux operating system, Debian. We could have
    # used the Debian image as well such as https://hub.docker.com/_/debian
    # but we would have to install extra components to get Python to work.
    # Instead, we use the Python variant which is in fact another Dockerfile
    # under the hood that sets up all of the dependencies that we can further
    # add upon.
    FROM python:3.11-slim

    # This creates a directory called 'app' in the root. If you need more
    # help in understanding what 'root' means, visit the following resource
    # https://www.linuxfoundation.org/blog/blog/classic-sysadmin-the-linux-filesystem-explained
    WORKDIR /app

    # This copies the requirements.txt folder from our computer and transfers
    # it into the path app/requirements.txt. We didn't need to specify /app/requirements
    # since the prior step "WORKDIR /app" changes the context and places us into
    # that folder already.
    COPY requirements.txt requirements.txt

    # This runs the pip command to install our dependencies.
    RUN pip install -r requirements.txt

    # This does another copy, but when you see a dot '.', it means to
    # copy everything in your current location. So this translate to
    # copy everything relative to my Docker context and place it in
    # the current directory within Docker which happens to be /app
    COPY . .

    # This runs the uvicorn command which is a webserver that hosts
    # our application. Notice how we had to specify --host=0.0.0.0
    # Without going into too much details about networking, know that
    # this allows connections from outside of the container to
    # communicate with our server within the container. By default,
    # the host is 127.0.0.1 which means you would have to be INSIDE
    # of the container to access the uvicorn webserver.
    CMD [ "uvicorn", "dog_api:app", "--host=0.0.0.0" ]
    ```

  6. Let's build the Docker container. Make sure Docker   Desktop is running. Run the following commands within the `app` directory:
  
       1. ```docker build -t dog-api:v1 .```
       2. ```docker run -d --name dog-api -p 8000:8000 dog-api:v1```
       3. See the website in action at `http://localhost:8000`
       4. To stop the container, run `docker stop dog-api`

     This is a good stopping point to check our understanding. Please visit the documentation [here](https://docs.docker.com/reference/cli/docker/container/run/) to try to understand what each of the flags are doing.

  7. Now, let's save our work using `git` commit and add it to our repository! Push the changes up. You should have the following directory structure now.
  ```bash
    └── dog-api
        ├── .gitignore
        ├── Dockerfile
        ├── dog_api.py
        └── requirements.txt
   ```

   We now have a way for others to run your application in an easily reproducible way! As long as another person or computer can run Docker, they will be able to replicate the same settings we specified within the `Dockerfile`. This helps with the age-old adage of "It works on my computer!".

### The Recap

In this section, we've taken a loosely defined problem statement and broke it down into actionable tasks. We created our first remote `.git` repository and now have the code in version control. We also got to choose a *branching* strategy for the development team to help streamline their workflow so they can more predictably release software. 

After getting our code stored safely, we dove into *containerization* to help ease the efforts of local development. Containerization will also play a significant role in future sections as we launch our application live!


Now its time for you to write up a summary of the great work you've accomplished!

Here are some questions to help you get started:

1. What are the benefits of version control in software development?

2. What are the pros and cons of the following branching strategies: Gitflow, GitHub Flow, Trunk Based Development?

3. What is the benefit of using semver?

4. What are the benefits of using a container?

5. What is the difference between a container and a virtual machine (VM)?

Answer these questions and add them to your `README.md` in your Github repository!


## Build. Test. Break. Repeat.

You did it! You optimized the time it took to iterate locally when developing code and had a much more effective pipeline. Remember, every optimization can pay huge dividends when it comes to the entire software development pipeline. Let's check where we're at:

1. Software Development (Software Development Lifecycle)
    - Local Development ✅

2. Build Step (Continuous Integration) ⬅️ *Next Section*
    - Unit Testing
    - Integration Testing
    - Artifact Management
    - Code Quality Scans

3. Deploy Step (Continuous Delivery/Deployment)
    - Infrastructure Setup
    - Environment Setup
    - Observability

### The Scenario

The team is operating at 10x efficiency now with the new approach to local development. The issue now is they have no clue how or where to host their application so they can share it with the world. They are wondering if they should look into a cloud provider such as AWS (Amazon Web Services), GCP (Google Cloud Provider), Azure (Microsoft Azure), or something with less options such as Digital Ocean. Also, once they choose a provider, how does the process look like to host the application?

### The Analysis

What we see here is the team is missing a pipeline to ship their code from their local computers to an external location. We can generalize most software projects using two concepts, CI (Continuous Integration) and CD (Continuous Delivery/Deployment). CI always precedes CD which is what we'll focus on first. We can think of the CI process as the step that builds, tests, and uploads our program so our CD process can use it to deliver it to our host. What we'll suggest the team is to first focus on CI because we can't do CD without it!

If we break down the CI process, we see it has some core steps: 

  1. Unit Testing - this step involves running tests against our code every time we add a new feature to ensure our code behaves as we expect.
  2. Integration Testing - integration testing is a level above unit testing where we're now testing two or more functions that collaborate together or a function with an external system such as a database interaction.
  3. Artifact Management - once we package our code as either a binary or container image, we need to store it into a location where our CD process can pull it.
  4. Code Quality Scans - Quality scans can include checking for syntax, security vulnerabilities, and/or test coverage.

### The Approach

#### Unit Testing

Unit testing at its core is testing a basic functionality of our application. Looking back at our example Python application, we have not written any unit tests yet, so let's begin with that.

1. Let's go to our directory `dog-api` and a file where we'll add our unit tests.
   ```bash
   # Creates a file named 'dog_test.py'
   touch dog_test.py
   ```

2. We will now also install a testing framework called Pytest to run tests against our application. Before installing, let's activate a virtual environment. If you missed the virtual section portion, please refer back to **Step 3** under [version control](#version-control) section.
   
   1. Create the virtual environment folder if there is none.
      ```bash
      python3 -m venv venv
      ```
   2. Activate the virtual environment.
      ```bash
      source venv/bin/activate
      ```
   3. Install the Pytest framework.
      ```bash
      pip install pytest
      ```
   4. Install the httpx library for testing our web requests in FastAPI.
      ```bash
      pip install httpx
      ```
   5. Save the requirement into your `requirements.txt` file.
      ```bash
      pip freeze > requirements.txt
      ```
   6. Your `requirements.txt` file should look something as follows:
      ```
      annotated-types==0.6.0
      anyio==4.3.0
      certifi==2024.2.2
      charset-normalizer==3.3.2
      click==8.1.7
      fastapi==0.110.0
      h11==0.14.0
      httpcore==1.0.4
      httptools==0.6.1
      httpx==0.27.0
      idna==3.6
      iniconfig==2.0.0
      packaging==24.0
      pluggy==1.4.0
      pydantic==2.6.3
      pydantic_core==2.16.3
      pytest==8.1.1
      python-dotenv==1.0.1
      PyYAML==6.0.1
      requests==2.31.0
      sniffio==1.3.1
      starlette==0.36.3
      typing_extensions==4.10.0
      urllib3==2.2.1
      uvicorn==0.28.0
      uvloop==0.19.0
      watchfiles==0.21.0
      websockets==12.0
      ```

3. Let's also update our `.gitignore` to ignore `.pytest_cache`. It's a good practice to ignore things we don't need to version control to keep our code repository clean.
    ```
    venv/
    __pycache__/
    .pytest_cache
    ```

4. Open up the `dog_test.py` file and add the following contents:

    ```python
    from fastapi.testclient import TestClient
    from dog_api import app

    client = TestClient(app)

    def test_can_reach_health_endpoint():
        response = client.get('/health')
        assert response.status_code == 200

    def test_health_endpoint_returns_expected_msg():
        response = client.get('/health')
        assert response.text == '"healthy"'

    def test_can_reach_dog_endpoint():
        response = client.get('/')
        assert response.status_code == 200
    ```
    Don't get too caught up in the code. Just know that this code is running three unit tests which are checking if we can perform requests to our web server without receiving an error. If you'd like to learn more about Pytest, please see the docs [here](https://docs.pytest.org/en/8.0.x/). If you're interested in testing in general, I recommend reading this [resource](https://www.obeythetestinggoat.com/).
  5. From the root directory `dog-api`, run `pytest`. You should see something similar to the results below
  ```python
  ============================================================= warnings summary =============================================================
  venv/lib/python3.11/site-packages/httpx/_client.py:680
    /Users/dbour/Projects/devops-from-scratch/early-content/devopsfromscratch/examples/app/venv/lib/python3.11/site-packages/httpx/_client.py:680: DeprecationWarning: The 'app' shortcut is now deprecated. Use the explicit style 'transport=WSGITransport(app=...)' instead.
      warnings.warn(message, DeprecationWarning)

  -- Docs: https://docs.pytest.org/en/stable/how-to/capture-warnings.html
  ========================================================
  3 passed, 1 warning in 1.34s ========================================================
  ```
  This is just saying our three tests has passed. Try breaking the test by making changes to our `dog_api.py` health endpoint such as making it return `bacon` instead of `"healthy"`.

  Here's an example
  ```python
  @app.get("/health")
  async def health():
    return "bacon"
  ```

  6. Now that we have a local unit test running, we can now start looking into into our first CI pipeline. Since we are using Github as our source control, we'll go with the easiest option and use [Github Actions](https://docs.github.com/en/actions).

      You can think of Github Actions as a platform to interact with an external computer which has tight integrations with your Github repository. The fact that Github Actions runs external computers under the hood means you can run arbitrary code such as the unit test we wrote above and capture those results. We can take it one step further and take action on that result such as preventing merges to the main or trunk branch if the new code changes introduced do not pass our unit test.

 7. In the next few sections, I'll only introduce enough Github Action concepts to get us through. The main goal is to understand the software delivery pipeline and not get caught up with the nuances of Github Actions. If you'd like to learn more about Github Actions, please refer to the documents [here](https://docs.github.com/en/actions).

    The majority of the code written will attempt to be as Github Actions agnostic as possible. The practice of writing platform agnostic code is not always feasible, but it makes our pipeline less beholden to a specific company's product; imagine a scenario where Github Actions starts charging more than you can afford while there are cheaper competitors.

 8. The first step to create a Github Actions is to create a directory named `.github` in the root directory of your repository. Our root directory is `dog-api`. Under `.github`, create another directory called `workflows`.
    ```bash
    mkdir -p .github/workflows
    ```
 9. Create a file named `ci.yaml` under `.github/workflows`.
    ```bash
    touch ci.yaml
    ```
10. In the `ci.yaml`, add the following content. Read the comments which are preceded by the `#` symbol to get an understanding of what each step is doing. The result of this file is we'll have a way to trigger a unit test each time we commit and *push* new changes to our Github repository. Github actions can use the results of our actions to perform extra steps such as blocking the pull request from being merged into our main branch unless our unit tests pass. You can read more about branch protection [here](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches#require-status-checks-before-merging).
    ```yaml
      # This is the name of the Github Action
      name: Github Actions Demo

      # This is the result name of the Github Action
      run-name: ${{ github.actor }} is testing out Github Actions

      # This is what triggers the Github action to run. Here, we have a 'push'.
      on: [push]

      # Here we have a list of jobs to run. Each job consists of multiple steps.
      jobs:

        # This is what we're naming our first job.
        explore-github-actions:

          # This is telling the job what type of computer operating system to run on.
          runs-on: ubuntu-latest

          # This begins the list of steps to perform when running this job. Jobs
          # run in sequence from top to bottom.
          steps:
            
            # These are "actions". These actions represent code that is hosted elsewhere,
            # written by someone else that can perform "actions" on our job. Here, we have
            # the official "action" by Github that will do the equivalent of a 'git clone'
            - name: Checkout code from repository
              uses: actions/checkout@v4

            # This will install Python for our job.
            - name: Set up Python
              uses: actions/setup-python@v4
              with:
                python-version: '3.11'

            # This will set the `PATH` for our Python installation so it
            # will know how to find our dog-api and it's respective tests.
            - name: Set Python Path
              run: |
                echo "PYTHONPATH=${{ github.workspace }}" >> $GITHUB_PATH
                echo "${{ github.path }}"

            # This will install all our dependencies that we need.
            - name: Install Python Dependencies
              run: |
                # This installs the `pip` command
                python -m pip install --upgrade pip

                # This install the dependencies
                pip install -r requirements.txt

            # This will run pytest like we do locally. If anything fails,
            # the Github action will mark the results red. If nothing fails,
            # Github action will mark our results green.
            - name: Python Unit Test
              run: pytest --ignore=examples
    ```
    11. Open our `dog_api.py` and let's add an extra feature and write a test to see if it works. *Note:* the rest of the code was left out for brevity. Let's change the word "healthy" to "woof" to match the theme of our application. Commit the changes and push them into a branch. If you go to the *actions* tab on your Github repository, we should see the unit test running and the results.
    
    __Before__
    ```python
    @app.get("/health")
    async def health():
      return "healthy"
    ```

    __After__
    ```python
    @app.get("/health")
    async def health():
      return "woof"
    ```

### The Recap


## Coming Up

1. Integration Testing
2. Building and storing our Docker container images
3. Versioning our Docker container images