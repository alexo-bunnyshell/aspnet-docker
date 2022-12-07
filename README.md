# aspnet-docker
Simple demo of ASP.NET Core and Docker using .NET Core 3.1 LTS.

## Read the Article
To understand how to use this repo, make sure you read this article:   
[Creating ASP.NET Core websites with Docker](https://blog.hildenco.com/2020/10/how-to-create-aspnet-core-website-with.html)

## Requirements
In order to run this example, you'll need to have installed on your machine (Windows, Mac, Linux):
* Docker Desktop (or Docker on Linux)
* .NET Core SDK 3.1

## Running
The steps to run are:
1. clone this tool: `git clone https://github.com/hd9/aspnet-docker` 
2. cd into the folder: `cd aspnet-docker`
3. Build a docker image: `docker build . -t webapp`
4. Run a container with: `docker run --rm -it -p 8080:80 webapp`
5. Open your browser and navigate to: `localhost:8080`

## Running Remote Debugger on Bunnyshell

To get remote development with VsCode on an container running this project in Bunnyshell EaaS, follow the steps:

1. download/install `bunnyshell-cli` https://documentation.bunnyshell.com/docs/bunnyshell-cli-install
2. configure `bunnyshell-cli`. https://documentation.bunnyshell.com/docs/bunnyshell-cli-authentication
3. have VsCode installed
4. have the VsCode `code` command in $PATH https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line
5. define and deploy the environment containing this docker container image in Bunnyshell, activate "remote development" feature on env
6. run VsCode with `BNS_ENV_UNIQUE=_your_env_uniq_ code .` in repo folder. It is essential to pass `BNS_ENV_UNIQUE` to VsCode
7. start remode debugging session `bunnyshell-cli remote-development up --component __COMPONENT_ID__`. You can get the exact command from the Bunnyshell UI. When promted for local path select this repo folder. When prompted for remote path, select `/source/webapp` (the path in Dockerfile where `dotnet publish` runs )
8. run `dotnet restore` locally
9. start debugger session
