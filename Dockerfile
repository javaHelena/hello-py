# Use the latest official Python 3.12 runtime as a parent image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the src directory to /app in the container
COPY src/ /app/

# Verify that the files are copied correctly
RUN ls -la /app/

# Upgrade pip to the latest version to avoid any issues
RUN pip install --upgrade pip

# Install Flask and Werkzeug explicitly with a force-reinstall to avoid any dependency issues
RUN pip install --no-cache-dir --upgrade --force-reinstall Flask==2.2.3 Werkzeug==2.3.7

# Install any additional needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Verify that Flask and Werkzeug are installed with the correct versions
RUN pip show flask werkzeug

# Expose port 5000 to the outside world
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]
