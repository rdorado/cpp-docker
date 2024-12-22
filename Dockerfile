FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Create directory for binaries
RUN mkdir /app/build

# Install necessary dependencies
RUN apk update && apk upgrade && apk add \
    g++ \
    cmake \
	make

# Copy the source code into the container
COPY src /app/src

# Compile the sources using cmake, results will be output 
RUN cd /app/build;  \
    cmake ../src

CMD ["./build/output"]