#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
#WORKDIR /app
#EXPOSE 80

#FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
#COPY ["Terrazzo.WebApi.NSwag.csproj", ""]
#RUN dotnet restore "./Terrazzo.WebApi.NSwag.csproj"
#COPY . .
#WORKDIR "/src/."
#RUN dotnet build "Terrazzo.WebApi.NSwag.csproj" -c Release -o /app/build

#FROM build AS publish
#RUN dotnet publish "Terrazzo.WebApi.NSwag.csproj" -c Release -o /app/publish

#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "Terrazzo.WebApi.NSwag.dll"]



FROM microsoft/dotnet:3.1-sdk AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:3.1-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env app/out .

CMD dotnet Terrazzo.WebApi.NSwag.dll