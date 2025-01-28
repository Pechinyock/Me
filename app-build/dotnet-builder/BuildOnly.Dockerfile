ARG DOTNET_SDK_VERSION="9.0"
ARG PROJECT_NAME="project_name"

FROM debian:bookworm AS debian-dotnet

ARG PROJECT_NAME
ARG DOTNET_SDK_VERSION

ENV BUILD_CONFIGURATION=${BUILD_CONFIGURATION}

COPY ${PROJECT_NAME} /tmp/${PROJECT_NAME}

RUN apt update &&\
    apt install -y wget &&\
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install -y dotnet-sdk-${DOTNET_SDK_VERSION}

WORKDIR /tmp/${PROJECT_NAME}

CMD [ "sh", "-c", "dotnet build --configuration ${BUILD_CONFIGURATION}" ]