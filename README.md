## This project demonstrates how to build and run an ASP.NET Core application using Nano Server with Docker.

## How To Run?
 First Step: docker build -t dotnet8-nano-server .
 
 Second Step: docker run -d -p 5143:5143 dotnet8-nano-server

## Accessing the Application

Once the container is running, open your browser and navigate to:

- [http://localhost:5143](http://localhost:5143)
