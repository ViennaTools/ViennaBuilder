FROM alpine:latest

# Arguments

ARG VTK
ARG PYTHON

# Build dependencies

RUN apk add build-base cmake ninja-build
RUN apk add git docker sed

# Conditionally pre-install VTK

RUN if [ "$VTK" = "True" ]; then \
        apk add vtk; \ 
    fi

RUN if [ "$PYTHON" = "True" ]; then \
        apk add py3-pip && pip install -U cmakelang pyyaml clang-format==17.0.6 --break-system-packages; \ 
    fi
