
# Start with a lightweight base image that serves static content
FROM nginx:alpine 
#  Base Image: The nginx:alpine image is used as it is lightweight and perfect for serving static content.

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# after settig working directory, if in  future thw dev team adds any of the dependencies to our project then to install all of them we use 
# COPY go.mod ===> this is for Go Lang, where go.mod is like a requirements.txt in pyth and package.json in react ==> can also use ==>  COPY package.json package-lock.json ./
# anf after listing them t install them automatically we run -==>  RUN go mod download ==> to install and run the same; as same as we use pip install and npm install 

# Copy the HTML, CSS, and PNG files to the working directory
COPY . .

# Expose the default HTTP port
EXPOSE 80

# No need to specify a CMD as Nginx will automatically serve the files

# First Stage (Build Stage):
# This stage is where you build or compile your application. For example, in a React application, you would use a Node.js environment 
# to install dependencies and run the build process (npm run build). This process generates the optimized static files needed to run your 
# application in production (like minified HTML, CSS, and JavaScript files).
# Second Stage (Serve/Run Stage):
# In this stage, you take the output from the first stage (the built static files) and place it in a minimal runtime environment, 
# like an Nginx server. This stage is only responsible for serving or running the application, and because it doesn't include all the 
# tools needed for building the app, it results in a much smaller and more secure Docker image.
# Benefits of Multi-Stage Builds:
# Smaller Final Image: By excluding unnecessary build tools and dependencies from the final image, the resulting Docker image is smaller 
# and more efficient.

# Improved Security: Fewer tools and packages in the final image mean a smaller attack surface, which enhances security.

# Separation of Concerns: The build environment and the runtime environment are kept separate, which is a cleaner and more modular approach.

# This technique is particularly useful for languages and frameworks where the build and runtime environments are significantly different,
#  like in Go, Java, or front-end frameworks like React.



# dont i need any of the RUN commands for my HTML/CSS project?
# ChatGPT
# In the context of serving a static HTML/CSS website with Nginx, you typically do not need any RUN commands because:

# No Build Process: Unlike React or Go, where you might compile or bundle the application, static HTML/CSS sites don’t require 
# any build steps. The files are ready to be served as they are.

# No Dependencies: Your static website doesn’t have external dependencies like a Node.js project with package.json or a Go project 
# with go.mod. Thus, there’s no need to install anything via RUN commands.






