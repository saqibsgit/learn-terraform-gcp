# 🚀 Terraform GCP Infrastructure

This Terraform project provisions a **secure GCP infrastructure** using Terraform modules for **networking, storage, IAM, secrets, and logging**.

## 📖 Project Overview

This project automates the deployment of a **Google Cloud environment** using Terraform. It follows **best practices** for security, modularity, and maintainability.

### 🔹 Features:
- ✅ **Networking**: Creates a VPC with public & private subnets and firewall rules.
- ✅ **Secure Storage**: Provisions a private **Google Cloud Storage (GCS) bucket** with encryption.
- ✅ **IAM (Least Privilege)**: Manages service accounts and enforces **least privilege** roles.
- ✅ **Secrets Management**: Stores and retrieves **secrets securely** using **Google Secret Manager**.
- ✅ **Cloud Logging & Audit Logs**: Captures **audit logs** and stores them in a dedicated bucket.

---

## 🔧 Prerequisites

Before running Terraform, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.5+ recommended)
- [Google Cloud SDK (`gcloud` CLI)](https://cloud.google.com/sdk/docs/install)
- [`tfsec`](https://aquasecurity.github.io/tfsec/) (for security scanning)

## 📦 Module Descriptions

| Module      | Description |
|-------------|------------|
| `network`   | Creates a VPC, subnets, and firewall rules. |
| `storage`   | Provisions a secure **GCS bucket** with versioning & encryption. |
| `iam`       | Manages service accounts and IAM roles (Least Privilege). |
| `secrets`   | Stores & retrieves **secrets securely** using **Google Secret Manager**. |
| `logging`   | Captures **audit logs** and stores them in a dedicated log bucket. |

---

## 🔐 Security Best Practices

This project follows **Terraform security best practices**, including:

- ✅ **IAM Least Privilege**: No overly permissive roles (`owner/editor` roles are avoided).
- ✅ **Private Subnets**: Only necessary services can access sensitive resources.
- ✅ **Firewall Rules**: Restrict inbound access; no `0.0.0.0/0` open ports.
- ✅ **Encrypted Storage**: Uses **Google-managed encryption** for GCS.
- ✅ **Audit Logging Enabled**: Logs access to secrets, storage, and IAM.

## ⚙️ Usage

To run this Terraform configuration, you will need to supply environment-specific variables via `.tfvars` files. For example, a `dev.tfvars` might contain values for your development environment, while a `prod.tfvars` has production-specific settings.

### Create Environment-Specific Variables Files

In the root of this project, create a `.tfvars` file for each environment you want to deploy. For example:
<code>dev.tfvars</code>

Following Variables are required:
# tfvars file Description

| Variable     | Description |
|-------------|------------|
| `project_id`   | The project id of GCP project. |
| `env`   | The deployment environment, acceptable values: dev or prod. |
| `region`       | choose the region in which to deploy infrastructure. |
| `public_subnet_cidr`   | CIDR range for public subnet within your VPC. |
| `private_subnet_cidr`   | CIDR range for private subnet within your VPC. |



## 📜 Future Improvements

- 🔹 **Implement CI/CD Pipelines**  
  - Automate Terraform deployment using **GitHub Actions**, **GitLab CI**, or **Google Cloud Build**.

- 🔹 **Enhance Security with KMS Encryption**  
  - Use **Customer-Managed Encryption Keys (CMEK)** instead of Google-managed keys for **GCS, Secret Manager, and Logging**.

- 🔹 **Add Monitoring & Alerting**  
  - Implement **Cloud Monitoring dashboards** and **alerts** for infrastructure health and security events.

- 🔹 **Expand Multi-Region Support**  
  - Modify networking and storage modules to support **multi-region deployments** for high availability.

- 🔹 **Optimize Cost with Terraform Best Practices**  
  - Use **reserved instances**, **autoscaling**, and **budget alerts** to optimize costs across environments.

---
