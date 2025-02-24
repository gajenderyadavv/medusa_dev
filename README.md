<p align="center">
  <a href="https://www.medusajs.com">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/59018053/229103275-b5e482bb-4601-46e6-8142-244f531cebdb.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/59018053/229103726-e5b529a3-9b3f-4970-8a1f-c6af37f087bf.svg">
    <img alt="Medusa logo" src="https://user-images.githubusercontent.com/59018053/229103726-e5b529a3-9b3f-4970-8a1f-c6af37f087bf.svg">
    </picture>
  </a>
</p>
<h1 align="center">
  Medusa
</h1>

<h4 align="center">
  <a href="https://docs.medusajs.com">Documentation</a> |
  <a href="https://www.medusajs.com">Website</a>
</h4>

<p align="center">
  Building blocks for digital commerce
</p>
<p align="center">
  <a href="https://github.com/medusajs/medusa/blob/master/CONTRIBUTING.md">
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat" alt="PRs welcome!" />
  </a>
    <a href="https://www.producthunt.com/posts/medusa"><img src="https://img.shields.io/badge/Product%20Hunt-%231%20Product%20of%20the%20Day-%23DA552E" alt="Product Hunt"></a>
  <a href="https://discord.gg/xpCwq3Kfn8">
    <img src="https://img.shields.io/badge/chat-on%20discord-7289DA.svg" alt="Discord Chat" />
  </a>
  <a href="https://twitter.com/intent/follow?screen_name=medusajs">
    <img src="https://img.shields.io/twitter/follow/medusajs.svg?label=Follow%20@medusajs" alt="Follow @medusajs" />
  </a>
</p>

## Compatibility

This starter is compatible with versions >= 1.8.0 of `@medusajs/medusa`. 

## Getting Started

Visit the [Quickstart Guide](https://docs.medusajs.com/create-medusa-app) to set up a server.

Visit the [Docs](https://docs.medusajs.com/development/backend/prepare-environment) to learn more about our system requirements.

## What is Medusa

Medusa is a set of commerce modules and tools that allow you to build rich, reliable, and performant commerce applications without reinventing core commerce logic. The modules can be customized and used to build advanced ecommerce stores, marketplaces, or any product that needs foundational commerce primitives. All modules are open-source and freely available on npm.



Medusa App Deployment with Docker, AWS ECS Fargate, and CI/CD

This documentation outlines the steps to deploy the Medusa app using Docker, AWS ECS Fargate, and GitHub Actions for CI/CD.

# 🚀 Medusa App Deployment with Docker, AWS ECS Fargate, and CI/CD

This repository contains the setup and deployment process for the Medusa app using Docker, AWS ECS Fargate, and GitHub Actions for CI/CD.

---

## 📦 Docker Setup

### 1. Dockerfile
- Ensure a `Dockerfile` exists in the root of your Medusa app.
- It should define the base image, working directory, dependencies, and exposed ports.

### 2. Build Docker Image
- Build the Docker image using the Docker CLI.

### 3. Run Docker Container
- Run the container locally and map the necessary ports (9000 and 7001).

---

## 🐳 Push Docker Image to AWS ECR

### 1. Authenticate Docker with ECR
- Use AWS CLI to log in to your ECR repository.

### 2. Tag Docker Image
- Tag the Docker image with your ECR repository URL.

### 3. Push Image to ECR
- Push the tagged image to your AWS ECR repository.

---

## ☁️ Deploy to ECS Fargate

### 1. Create an ECS Cluster
- Use AWS CLI or Console to create an ECS cluster.

### 2. Define Task Definition
- Create a task definition with container details (image, ports, CPU, memory).

### 3. Register Task Definition
- Register the task definition in ECS.

### 4. Create Fargate Service
- Set up an ECS Fargate service linked to your cluster and task definition.

---

## 🔄 CI/CD with GitHub Actions

### 1. Add GitHub Actions Workflow
- Create a workflow file at `.github/workflows/deploy.yml`.

### 2. Workflow Steps
- Checkout the code.
- Set up Docker Buildx.
- Authenticate with ECR.
- Build and tag the Docker image.
- Push the Docker image to ECR.
- Update ECS service to trigger a new deployment.

### 3. Add GitHub Secrets
- Add the following secrets to your repository settings:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

---

## ✅ Continuous Deployment Flow

Every push to the `main` branch will:
1. Trigger the GitHub Actions workflow.
2. Build and push the Docker image to ECR.
3. Update the ECS Fargate service with the new image.
4. Deploy the latest version of the Medusa app.

---

## 🔗 Useful Commands (Optional)

- **Build Docker image:** `docker build -t medusa-app .`
- **Run Docker container:** `docker run -p 9000:9000 -p 7001:7001 medusa-app`
- **Authenticate to ECR:** `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your-ecr-url>`
- **Push image to ECR:** `docker push <your-ecr-url>:latest`

---

For any questions or suggestions, feel free to open an issue! ✨
