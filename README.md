# OF on Docker

This is a Docker setup to use [OpenFOAM](https://openfoam.org/), on any operating system other than Ubuntu avoiding to compile the source code manually.

The current configuration sets up [OpenFOAM 2.4.x](https://openfoam.org/version/2-4-0/) on [Ubuntu 14.04 LTS](http://releases.ubuntu.com/14.04/).

Both the Ubuntu and the OpenFOAM versions can be changed.

## Disclaimer
This project/repository is not affiliated with OpenFOAM Fundation or any other OpenFOAM project.

[OpenFOAM](https://openfoam.org/download/6-linux/) and [OpenFOAM-plus](https://www.openfoam.com/download/install-binary-linux.php) now offer similar functionalities using docker for their latest software versions.

This is a personal project to ease OpenFOAM 2.4.x use on personal computer running Fedora.

## Details

The Docker configuration first sets up a Docker image of Ubuntu, directrly from Docker, and then installs the pre-required software and finally downloads the .deb files and installs the OpenFOAM package.

Then, to run OpenFOAM, a Docker container is created with links to the local directories of the user, so that simulation data and code is accessible outside the Docker container.

When the container is launched, the user can treat it as a virtual machine: the user is logged in and has full access to a command-line with the OpenFOAM enviroment sourced.

The user can create directories/files (under *$WM_PROJECT_USER_DIR* directory) that will be saved on the host machine when the user exits the container.

Simulations can run in parallel normally.

Paraview or ParaFOAM is not set up and cannot be used from the container.

Multiple containers can be launched in the same time, as each one is assinged a name with a randomly generated 4digit integer appended in the end.

## Getting Started

To set up OpenFOAM 2.4x with Ubuntu 14.04:

1. Create the Ubuntu Image and install the pre-required packages for OpenFOAM by running `buildImageOF240` bash script. It will create an `OpenFOAM` directory under `$HOME/`
2. Create the OpenFOAM Image by typing `docker build -t of240 -f DockerfileUbuntu4foam`
3. Launch the OpenFOAM container by running `startOF240` bash script. Logs user in an OpenFOAM environment. Exits normally typping `exit`

OpenFOAM version can be changed in `Dockerfile` by editting the following line:
```
RUN wget http://dl.openfoam.org/ubuntu/dists/trusty/main/binary-amd64/openfoam240_0-1_amd64.deb
```

Ubuntu version can be changed in `DockerfileUbuntu4foam` by editting the first line accordingly:
```
FROM ubuntu:14.04
```

## Links

The Docker configuration (images and containers) is set up following the simple steps found on Docker [getting-started page](https://docs.docker.com/get-started/).

Instractions and requirement for installing OpenFOAM (2.4.x) were found on the official website of the OpenFOAM Foundation [openfoam.org](https://openfoam.org/download/2-4-0-ubuntu/) and the unofficial OpenFOAM Wiki page [openfoamwiki.net](https://openfoamwiki.net/index.php/Installation).


## License
GNU General Public License
