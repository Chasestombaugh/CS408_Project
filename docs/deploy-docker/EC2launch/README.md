# Launching your EC2 Instance

- Video Tutorial: [Launching an EC2 Instance]()
- An AWS EC2 instance running Ubuntu Server 24.04 LTS
- At least t3.micro instance type (or equivalent)
- Minimum 1 GB RAM, 8 GB storage, x86_64 architecture
- Security group allowing inbound traffic on ports 22 (SSH) and 80 (HTTP)
  - Port 443 (HTTPS) can be added later for secure connections
- SSH key pair for secure access to the instance
- Docker installed on the EC2 instance
  - EC2 Configuration Script: [`config-ec2.sh`](https://gist.github.com/shanep/2e84ca1837019b407cb1095e8a4c5ed3)

## Open the Amazon EC2 console.

Go to [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/) and select the Instance from the left-hand navigation menu.

![](image01.png)

## **Application and OS Images (Amazon Machine Image)**

* **Name and tags**: classname-yourname-ec2
* **Amazon Machine Image (AMI)**: Ubuntu
* **Instance type**: t3.micro

![](image02.png)

## Instance type

* **Instance type**: t3.micro

![](image03.png)

## Key pair (login)

* Name the key: classnumber-yourname-sshkey.
  * Example: cs123-shanepanter-ec2
* Your public key is stored in AWS, and your **private** key is downloaded.
* Save the downloaded private key in a safe place. Don’t commit your private key to your GitHub repository or your server will be compromised.
* Since all students share the AWS account, you can see other students' **public** keys in the interface. A **public** key is only helpful if you have the **private** key. You can share your **public** key with anyone. You must treat your **private** key (the one that was downloaded) like your bank account password or ATM PIN number

![](image04.png)

![](image05.png)

## Network settings

* **Network settings:**
  * Allow SSH and HTTP to your instance
  * Auto-assign a public IP

![](image06.png)
![](image07.png)

## Storage

Keep the default settings

![](image08.png)

## Advanced Details

Open up the **Advanced details** and upload the configuration file to install Docker and other necessary packages.

* User data: [`install-docker.sh`](install-docker.sh)

![](image09.png)
![](image10.png)

## Launch the Instance

![](image11.png)
