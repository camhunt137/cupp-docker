# parent docker image from ubuntu
FROM ubuntu:latest

# set the working directory to /app
WORKDIR /app

# copy the examples, the lib and the app to the container
COPY app/cupp-predict /app
COPY app/readme.md /app
COPY app/examples /app/examples
#this copies both library files, small and large
COPY app/lib /app/lib 
COPY app/license /app/license

# make an ouput directory
RUN mkdir /app/output

# make the app executable
RUN chmod +x /app/cupp-predict

# set no_color to true, this will disable the color output in the terminal as biolib does not support this
ENV NO_COLOR=1

# run the app example, small library
CMD ./cupp-predict --query examples/protein.faa --library lib/8x2_90_v1.1.0_transferred_CUPPlibrary_GH30_GH43 -v --cwd output/ 


