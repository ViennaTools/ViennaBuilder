FROM alpine:latest

# Arguments

ARG SUITE
ARG PYTHON

# Build dependencies

RUN apk add build-base cmake ninja-build musl-dev linux-headers
RUN apk add git docker sed tar

# Conditionally pre-install common build dependencies

RUN if [ "$SUITE" = "True" ]; then \
        apk add vtk-dev embree-dev onetbb-dev; \ 
    fi

RUN if [ "$PYTHON" = "True" ]; then \
        apk add python3 python3-dev py3-pip twine && pip install -U cmakelang pyyaml clang-format==17.0.6 --break-system-packages; \ 
    fi
