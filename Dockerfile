# builds our image using dotnet's sdk
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /root
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v vs2019 -l ~/vsdbg
RUN wget https://aka.ms/getvsdbgsh -O /root/vsdbg/getvsdbgsh.sh
WORKDIR /source
COPY . ./webapp/
WORKDIR /source/webapp
RUN dotnet restore
RUN dotnet publish -c Debug -o /app --no-restore

WORKDIR /app
ENTRYPOINT ["dotnet", "webapp.dll"]

#export ASPNETCORE_URLS="http://0.0.0.0:80"
