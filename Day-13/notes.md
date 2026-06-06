📌 Day 13 — Creating a Linux Server on AWS | DevOps & Cloud Program @MiseAcademy

Today's session was all hands-on. I launched and connected to an Ubuntu Linux Server on AWS EC2 using the Free Tier.

Key steps covered:

🔹 Launched an EC2 instance — Ubuntu Server 22.04 LTS, t2.micro (Free Tier eligible)
🔹 Created an RSA Key Pair (.pem) for secure authentication
🔹 Configured Security Groups to allow SSH (port 22)
🔹 Connected via SSH: ssh -i "ubuntu-key.pem" ubuntu@<Public-IP>
🔹 Best practice: Always TERMINATE (not just stop) your EC2 instance after practice to stay within the 750 free hours/month

This is a fundamental skill for any DevOps or Cloud Engineer — knowing how to provision, access, and manage virtual servers in the cloud.

Building real skills, one day at a time. 🔧

#AWS #EC2 #Linux #CloudComputing #DevOps #MiseAcademy #LearningInPublic #CloudEngineer
