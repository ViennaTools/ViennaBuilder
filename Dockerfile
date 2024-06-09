FROM alpine:latest

# Arguments

ARG VTK
ARG PYTHON

# Build dependencies

RUN apk add build-base cmake ninja-build musl-dev linux-headers
RUN apk add git docker sed tar

# Conditionally pre-install VTK

RUN if [ "$VTK" = "True" ]; then \
        apk add vtk-dev; \ 
    fi

RUN if [ "$PYTHON" = "True" ]; then \
        apk add python3 python3-dev py3-pip twine && pip install -U cmakelang pyyaml clang-format==17.0.6 --break-system-packages; \ 
    fi
