# ShopSphere - Failure Testing

## 1. Nginx Failure Test
- Stopped the Nginx service on an EC2 instance.
- The target group detected the instance as unhealthy.
- Started Nginx again.
- The instance became healthy after recovery.

## 2. Auto Scaling Replacement Test
- Terminated an EC2 instance managed by the Auto Scaling Group.
- Auto Scaling launched a replacement instance.
- The desired capacity was restored to 2 instances.

## 3. Load Balancer Test
- Accessed the website using the Application Load Balancer DNS.
- Confirmed that the ShopSphere website was accessible.

## 4. EFS Shared Storage Test
- Created a test file on one EC2 instance.
- Accessed the same file from another EC2 instance.
- Confirmed that shared storage was working.
