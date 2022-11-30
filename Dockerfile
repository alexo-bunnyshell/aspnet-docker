# builds our image using dotnet's sdk
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source
COPY . ./webapp/
WORKDIR /source/webapp
RUN dotnet restore
RUN dotnet publish -c Debug -o /app --no-restore

WORKDIR /app
ENTRYPOINT ["dotnet", "webapp.dll"]

#export ASPNETCORE_URLS="http://0.0.0.0:80"
