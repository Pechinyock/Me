ARG ASP_CORE_RUNTIME_VERSION="9.0"
ARG APP_NAME="project_name"

FROM debian:bookworm AS debian-dotnet

ARG APP_NAME
ARG ASP_CORE_RUNTIME_VERSION

ENV EXECUTABLE_NAME=${EXECUTABLE_NAME}

COPY ${APP_NAME} /lib/bin/${APP_NAME}

# install dotnet sdk
RUN apt update &&\
    apt install -y wget &&\
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install -y aspnetcore-runtime-${ASP_CORE_RUNTIME_VERSION}

WORKDIR /lib/bin/${APP_NAME}

CMD [ "sh", "-c", "dotnet ${EXECUTABLE_NAME}"]