FROM debian:buster-slim

RUN apt-get update; \
    apt-get install -y apt-transport-https dirmngr gnupg ca-certificates git curl

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF; \
    echo "deb https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list; \
    apt-get update;

RUN apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl;

RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*;
