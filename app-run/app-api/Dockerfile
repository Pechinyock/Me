ARG ASP_CORE_RUNTIME_VERSION="9.0"
ARG APP_ROOT_DIRECTORY="/lib/"

FROM debian:bookworm AS debian-dotnet

ARG APP_ROOT_DIRECTORY
ARG ASP_CORE_RUNTIME_VERSION

ENV APP_ENTRYPOINT=${APP_ENTRYPOINT}

# install dotnet sdk
RUN apt update &&\
    apt install -y wget &&\
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install -y aspnetcore-runtime-${ASP_CORE_RUNTIME_VERSION}

 WORKDIR ${APP_ROOT_DIRECTORY}

 CMD [ "sh", "-c", "dotnet ${APP_ENTRYPOINT}"]