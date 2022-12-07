# aspnet-docker
Simple demo of Remote Debugging an ASP.NET Core program running in a container on Bunnyshell EaaS

## Read the Article
To understand how to use this repo, make sure you read this article:   
[Creating ASP.NET Core websites with Docker](https://blog.hildenco.com/2020/10/how-to-create-aspnet-core-website-with.html)

## Requirements
In order to run this example, you'll need to have installed on your machine (Windows, Mac, Linux):

* .NET Core SDK 3.1
* download/install `bunnyshell-cli` https://documentation.bunnyshell.com/docs/bunnyshell-cli-install
* configure `bunnyshell-cli`. https://documentation.bunnyshell.com/docs/bunnyshell-cli-authentication
* have VsCode installed
* have the VsCode `code` command in $PATH https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line
* define and deploy the environment containing this docker container image in Bunnyshell, activate "remote development" feature on env

## Runnig Remote Debugger on Container in Bunnyshell Environment

To get remote development with VsCode on an container running this project in Bunnyshell EaaS, follow the steps:


1. start VsCode in this repo root folder with `BNS_ENV_UNIQUE=_your_env_uniq_ code .`. It is essential to pass `BNS_ENV_UNIQUE` to VsCode
2. start Bunnyshell remote development session `bunnyshell-cli remote-development up --component __COMPONENT_ID__`. You can get the exact command from the Bunnyshell UI. When promted for local path select this repo folder. When prompted for remote path, select `/source/webapp` (the path in Dockerfile where `dotnet publish` runs )
3. run `dotnet restore` locally
4. start debugger session
5. stop Bunnyshell remote development session to resume normal container workload `bunnyshell-cli remote-development doen --component __COMPONENT_ID__`
