FROM rust:latest as backendBuild

WORKDIR /usr/src/backend

RUN rustup target add x86_64-unknown-linux-musl
RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential git clang llvm-dev libclang-dev libssl-dev pkg-config libpq-dev musl-tools brotli

COPY . .
RUN cargo install --target x86_64-unknown-linux-musl --path .