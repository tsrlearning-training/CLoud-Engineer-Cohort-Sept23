# Use the official Python image from the Docker Hub
FROM python:3.8

# Install dependencies
RUN apt-get update && apt-get install -y \
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Remove the site.db file to start with a fresh database
RUN rm -f resume/site.db

# Expose the port the app runs on
EXPOSE 5000

# # Copy the .env file into the container
# COPY resume/.env ./resume/

# Set environment variables
ENV MAIL_USERNAME="lbenagha@gmail.com"
ENV PASSWORD="r#s0meapp$_R"

# Run the application
CMD ["python3", "app.py"]


# naUmg!tt0v8kNssk
