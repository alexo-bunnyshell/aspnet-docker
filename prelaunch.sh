#!/bin/bash

ssh svc-app.env-uqu5jv.bunnyshell 'cd /source/webapp/ && dotnet publish -c Debug -o /app --no-restore'