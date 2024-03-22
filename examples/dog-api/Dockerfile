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
