# The final project

## Project Structure and File Descriptions
* Source Code (src/)
* src/api_app_titanic.py - API application built with FastAPI.
* src/dataset_titanic_modifed.py - Script to create a "bad" dataset.
* src/make_dataset_titanic.py - Script to save the Titanic dataset.
* src/model_titanic.py - Script to train the model on the Titanic dataset.
* Testing (test/)
* test/api_app_test.py - Unit tests for the API application.
* test/dataset_test.py - Functional tests for the model's predictive capabilities.
* Scripts and Configurations
* doker_container_run.bat - Batch file to run the Docker container with the application (Windows).
* doker_container_run.sh - Shell script to run the Docker container with the application (Unix).
* Dockerfile - File to create the Docker image of the application.
* Jenkinsfile - Pipeline for automatic deployment, testing, and Docker image creation.
* predict_titanic.bat - Batch file to check the API application's functionality (Windows).
* predict_titanic.sh - Shell script to check the API application's functionality (Unix).

## Deployment and Usage

The application is packaged in a Docker container. The build, testing, and Docker image creation are automated in Jenkins using the Jenkinsfile script.

After creating the Docker image, run the doker_container_run.bat (for Windows) or doker_container_run.sh (for Unix) to build and launch the Docker container with the application. The application will be available on port 8091.

To verify the application's functionality, run the predict_titanic.bat (for Windows) or predict_titanic.sh (for Unix) script.

This README provides an overview of the project structure, describes the purpose of each file, and offers instructions on how to build, deploy, and verify the application.


## Contributors

1. Maksim Nadezhdin
