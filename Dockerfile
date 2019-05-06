# Build OpenFoam 2.4 over Ubuntu 14.04LTS image equipped with all the dependancies (ubuntu4foam)
#
# Different OpenFOAM versions can be installed from binaries provided from OpenFOAM Foundation
# http://dl.openfoam.org/ubuntu/dists/trusty/main/binary-amd64/
#

FROM ubuntu4foam
RUN cd /opt

# Download the binaries packange and install them (def. destination: /opt)
RUN wget http://dl.openfoam.org/ubuntu/dists/trusty/main/binary-amd64/openfoam240_0-1_amd64.deb
RUN dpkg -i openfoam240_0-1_amd64.deb

# Clean up .deb file
RUN rm openfoam240_0-1_amd64.deb

# Create User
ARG HUSER
RUN adduser --disabled-password --gecos '' $HUSER

# Create User directories
RUN echo "Setting up user dir: /home/$HUSER/OpenFOAM"
RUN mkdir -p /home/$HUSER/OpenFOAM
WORKDIR /home/$HUSER

# Add environment sourcing to bashrc
RUN echo "Adding openFaom environment sourcing in bashrc under /home/$HUSER"
RUN echo "source /opt/openfoam240/etc/bashrc" >> /home/$HUSER/.bashrc
RUN echo "Now OpenFOAM will be sourced on startup of every new shell"
