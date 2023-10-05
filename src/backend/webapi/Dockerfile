# docker build -t azureopenai.azurecr.io/azureopenaibot -f 'src/backend/webapi/Dockerfile' .
# docker push azureopenai.azurecr.io/azureopenaibot

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

#ENV ASPNETCORE_URLS=http://localhost:8080
EXPOSE 80

ENV ASPNETCORE_ENVIRONMENT=Production

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY ["src/backend/webapi/CopilotChatWebApi.csproj", "src/backend/webapi/"]
COPY ["src/backend/shared/CopilotChatShared.csproj", "src/backend/shared/"]

RUN dotnet restore "src/backend/webapi/CopilotChatWebApi.csproj"
COPY . .
WORKDIR "/src/src/backend/webapi"
RUN dotnet build "CopilotChatWebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CopilotChatWebApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CopilotChatWebApi.dll"]