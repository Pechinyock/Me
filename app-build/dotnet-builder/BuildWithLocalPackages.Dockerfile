ARG DOTNET_SDK_VERSION="9.0"
ARG PROJECT_NAME="project_name"

FROM debian:bookworm AS debian-dotnet

ARG PROJECT_NAME
ARG DOTNET_SDK_VERSION

ENV BUILD_CONFIGURATION=${BUILD_CONFIGURATION}

COPY ${PROJECT_NAME} /tmp/${PROJECT_NAME}
COPY ./_additional-package-sources /etc/opt/NuGet/Config

# install donet sdk
RUN apt update &&\
    apt install -y wget &&\
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install -y dotnet-sdk-${DOTNET_SDK_VERSION} &&\
# setup custom nuget source with truestd flag 
    dotnet nuget config set repositoryPath "etc/opt/NuGet/Config" --configfile "etc/opt/NuGet/Config/TaskTrainNuGet.Config"

WORKDIR /tmp/${PROJECT_NAME}
CMD [ "sh", "-c", "dotnet build --configuration ${BUILD_CONFIGURATION}" ]