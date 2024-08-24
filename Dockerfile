# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the src directory to /app in the container
COPY src/ /app/

# Verify that the files are copied correctly
RUN ls -la /app/

# Install pip and update to the latest version to avoid any issues
RUN pip install --upgrade pip

# Install Werkzeug and Flask explicitly to avoid any dependency issues
RUN pip install Werkzeug==2.0.3 Flask==2.0.3

# Install any additional needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Verify that Flask and Werkzeug are installed with the correct versions
RUN pip show flask werkzeug

# Expose port 5000 to the outside world
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]