ARG WEBCLIENT_ASP_CORE_RUNTIME_VERSION="9.0"
ARG WEBCLIENT_APP_ROOT_DIRECTORY="/lib/"

FROM debian:bookworm AS debian-dotnet

ARG WEBCLIENT_APP_ROOT_DIRECTORY
ARG WEBCLIENT_ASP_CORE_RUNTIME_VERSION

ENV WEBCLIENT_APP_ENTRYPOINT=${WEBCLIENT_APP_ENTRYPOINT}

# install dotnet sdk
RUN apt update &&\
    apt install -y wget &&\
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install -y aspnetcore-runtime-${WEBCLIENT_ASP_CORE_RUNTIME_VERSION}

WORKDIR ${WEBCLIENT_APP_ROOT_DIRECTORY}
CMD [ "sh", "-c", "dotnet ${WEBCLIENT_APP_ENTRYPOINT}"]