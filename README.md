# ShopSphere – Highly Available E-Commerce Website on AWS

ShopSphere is a learning project demonstrating a highly available e-commerce landing page using Amazon EC2, an Application Load Balancer (ALB), an Auto Scaling Group (ASG), and Amazon EFS.

## AWS configuration recorded during the project
- Region: `us-east-1` (US East – N. Virginia)
- VPC: `shopsphere-vpc`
- ALB: `ShopSphere-ALB`, internet-facing, HTTP listener on port 80
- Target group: `ShopSphere-TG`, HTTP port 8000, health check `/`
- Auto Scaling Group: `ShopSphere-ASG`, minimum 2, desired 2, maximum 4
- Scaling policy: target tracking, average CPU target 50%
- Launch template: `ShopSphere-LT` (version 2 shown in console)
- EFS: `ShopSphere-EFS`, file system ID `fs-0a73f02bc36adb6e6`
- Web server: Nginx on port 8000

ALB DNS recorded during testing:
`shopsphere-alb-1896738129.us-east-1.elb.amazonaws.com`

## Files
- `website/` – website HTML and CSS
- `architecture/` – architecture description and Mermaid diagram
- `deployment/` – Nginx config and EC2 user-data example
- `screenshots/` – place AWS evidence screenshots here
- `documentation/` – test record, AWS resource list, cost and cleanup notes

## Run locally
Open `website/index.html` in a browser.

## Recorded tests
During the project, the ALB website loaded, the target group showed healthy targets on port 8000, the ASG showed 2/2 healthy instances with desired capacity 2, the CPU target-tracking policy showed 50%, an Nginx stop/start failure-recovery test was performed, and a shared EFS file was read from another instance. See `documentation/failure-testing.md`.

## Deployment warning
The user-data script is a reference example, not proof that the current AWS launch template uses it. Installing packages on private EC2 instances requires outbound access to package repositories (for example, NAT) unless packages are already baked into the AMI. EFS requires mount targets in the relevant AZs and NFS TCP 2049 access from the EC2 security group. Test a new launch-template version before using it.

## Security
Never commit AWS access keys, secret keys, passwords, `.pem` files, private SSH keys, or sensitive console screenshots. Use IAM roles and least privilege.
