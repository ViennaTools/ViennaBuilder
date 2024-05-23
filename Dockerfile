FROM fedora:38
ARG VTK

# Build dependencies

RUN dnf install -y gcc gcc-c++ kernel-devel cmake ninja-build python python-devel
RUN dnf install -y git docker sed clang-tools-extra

# Conditionally pre-install VTK

RUN if [ "$VTK" = "True" ]; then \
        dnf install -y vtk vtk-devel && pip install -U cmakelang pyyaml; \ 
    fi
