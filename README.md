# DevOps From Scratch (Early Access)
Author: David Bour, *version: 0.0.2*

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
    - [The Recap](#the-recap)
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
2. Create an account on [Github](https://github.com/). Github is a useful *version control system* based on *git* where we save and share our code.
  - Resources to get started with `git`. *Note:* DO NOT SKIP THIS! This is vital to our software pipeline.
      1. Learning git - https://docs.github.com/en/get-started/getting-started-with-git
      2. Interactive learning - https://learngitbranching.js.org/
3. Install [Docker](https://docs.docker.com/engine/install/). *Docker* is used to manage container images. You don't have to know more at the moment beyond the fact that *Docker* will be used to house our applications so they run the same on anyone's computer, including ones running in the cloud such as AWS (Amazon Web Services).
4. Install [Python 3](https://www.python.org/downloads/). Many applications and tools we'll be using will be centered around Python.

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

#### The Analysis

After rubbing your eyes in disbelief, you come to realize they have no *continuous integration* in place. As you come to grips with the situation, you come up with the following conclusions:

1. Each person is saving backups of older copies of the application by creating a new file and giving it a verison number each time they make changes. If these files are deleted, they'll lose all of their records! Also, since they have no quick way of seeing what changed between versions of code, they will most likely have to compare everything, including the lines of code that did not change!

2. Each person has their unique way of setting up the application. This means when a feature doesn't work as expected, it will be difficult to discern if its because of a local configuration issue on someone's computer or if it's an actual software bug.

#### The Approach

1. Version Control

   The team needs a version control system. We'll use `.git` to version control their application. This saves the team from having to store multiple copies of the file. It also allows the members to then use an external `.git` host such as *Github*.

   1. Create a [Github Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/quickstart-for-repositories) and give it a name such as `dog-api`
   2. Create three files
      1. **Filename**: dog_app.py

      This is our application that will show a picture of a random dog. API is courtesy from https://dog.ceo/dog-api.
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

      2. **Filename**: requirements.txt

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

      3. **Filename**: .gitignore (yes, there's a dot in front). Learn more about .gitignore [here](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files).
      ```bash
      venv/
      _pycache__/
      ```

   3. To run the application locally, do the following on the command line
        1. Create a directory called `app`
        ```bash
        mkdir app
        ```
        2. Go into the `app` directory
        ```bash
        cd app
        ```
        3. Create three files
        ```bash
        touch dog_api.py requirements.txt .gitignore
        ```
        4. Copy and paste the content from the earlier step above into their respective files
        5. Create a [Python virtual environment](https://docs.python.org/3/library/venv.html). This is used to keep the Python dependencies on your system clean. Read more [here](https://docs.python.org/3/library/venv.html).
        ```bash
        python3 -m venv venv
        ```
        6. Activate the virtual environment
        ```bash
        source venv/bin/activate
        ```
        7. Run the following commands to run the application
        ```bash
        uvicorn "dog_api:app"
        ```
        8. You should see something like the following
        ```bash
        INFO:     Started server process [53543]
        INFO:     Waiting for application startup.
        INFO:     Application startup complete.
        INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
        ```
        9. If you open a web browser and go to http://127.0.0.1:8000 , you should see a picture of a dog thats ready to be adopted!

   4. Store the application in the Github repository. Your repository should have the following folder structure.
    ```bash
    app
    ├── dog_api.py
    └── requirements.txt
    └── .gitignore
    ```

   5. Version control alas! The last step is to provide the team with guidance on a branching strategy. There are many different branching strategies such as Gitflow, GitHub Flow, and Trunk Based Development. Read more about each strategy [here](https://launchdarkly.com/blog/git-branching-strategies-vs-trunk-based-development/). Since the team is still pretty new to DevOps practices, you decided to go with GitHub flow as the recommended approach.

   6. Create a new file called `README.md` under the `app` directory and add your name to it. Submit this new file into the codebase using the concepts of GitHub flow.

   7. After merging the changes to the *trunk*, create a release and name it `1.0.0`. Learn more about creating Github Releases [here](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository). The `1.0.0` is based on the *semver* semantics which you can read up more [here](https://semver.org/).

2. Local Development

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



### The Recap

In this section, we've taken a loosely defined problem statement and broke it down into actionable tasks. We created our first remote `.git` repository and now have the code in version control. We also got to choose a *branching* strategy for the development team to help streamline their workflow so they can more predictably release software. Now its time for you to write up a summary of the great work you've accomplished!

Here are some questions to help you get started:

1. What are the benefits of version control in software development?

2. What are the pros and cons of the following branching strategies: Gitflow, GitHub Flow, Trunk Based Development?

3. What is the benefit of using semver?

Answer these questions and add them to your `README.md` in your Github repository!


## Coming Up

1. Local development; how to keep everyone in sync when working on their own computer
2. Unit testing in the Continuous Integration pipeline