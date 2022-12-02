#!/bin/bash

ssh svc-app.env-$1.bunnyshell 'cd /source/webapp/ && dotnet restore && dotnet publish -c Debug -o /app --no-restore'