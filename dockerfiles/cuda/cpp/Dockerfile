FROM nvidia/cuda:11.7.0-base-ubuntu20.04
WORKDIR /app
RUN apt update && \
    apt install --no-install-recommends -y build-essential && \
    apt clean && rm -rf /var/lib/apt/lists/*
COPY scripts/install_cuda_ubuntu.sh .
RUN export "cuda=11.7"
RUN export "gcc=10"
RUN ./install_cuda_ubuntu.sh
RUN sudo apt-get install -y gcc-10 g++-10  \
RUN export "CC=/usr/bin/gcc-10"
RUN export "CXX=/usr/bin/g++-10"
RUN export "CUDAHOSTCXX=/usr/bin/g++-10"
RUN cmake engine/. -B build -DCMAKE_BUILD_TYPE=Release
RUN cmake --build . --target all --verbose -j `nproc`
CMD ["echo", "CUDA"]