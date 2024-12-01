# .NET SDK image for building the application windows server 2019 > nanoserver-1809 | windows server 2022 or windows 10,11 > nanoserver-ltsc2022
FROM mcr.microsoft.com/dotnet/sdk:8.0-nanoserver-1809 AS build
# FROM mcr.microsoft.com/dotnet/sdk:8.0-nanoserver-ltsc2022 AS build

WORKDIR /app
ENV ASPNETCORE_HTTP_PORTS=5143 
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 5143

# Copy dlls
ARG LIBS_DIR=src/
COPY ${LIBS_DIR}/* ./dllfiles

# .NET runtime image for running the application windows server 2019 > nanoserver-1809 | windows server 2022 or windows 10,11 > nanoserver-ltsc2022
FROM mcr.microsoft.com/dotnet/aspnet:8.0-nanoserver-1809 AS runtime
#FROM mcr.microsoft.com/dotnet/aspnet:8.0-nanoserver-ltsc2022 AS runtime

WORKDIR /app

COPY --from=build /dllfiles . 

# This is the output file generated when the project is built and published. It contains your application’s compiled code and is the main entry point for the application.
# When the container starts, it will execute this DLL using the .NET runtime, launching your ASP.NET Core application.
ENTRYPOINT ["dotnet", "MyAspNetApp.dll"]
