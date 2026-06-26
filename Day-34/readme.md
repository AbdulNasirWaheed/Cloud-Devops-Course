(Amazon S3 Bucket Setup & Public URL Sharing)

markdown
# ☁️ Day 34: Amazon S3 Bucket Setup & Public File Sharing

![AWS](https://img.shields.io/badge/Cloud-AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![S3](https://img.shields.io/badge/Service-S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)

## 📘 Project Overview

Today's objective was to learn cloud storage fundamentals by setting up an **Amazon S3 bucket** from scratch. I configured it to host image files and documents, enabled public access, and generated shareable URLs for seamless integration with a frontend team.

This is a critical skill for any developer working with media-heavy applications, static website hosting, or asset delivery pipelines.

---

## 🎯 Learning Objectives

- ✅ Create and configure an Amazon S3 bucket
- ✅ Upload image files and documents to the bucket
- ✅ Configure bucket policies for **public read access**
- ✅ Generate and share public Object URLs with team members
- ✅ Understand basic IAM permissions and bucket security

---

## 🛠️ Steps Performed

| Step | Action |
|------|--------|
| 1️⃣ | Created a new S3 bucket with a unique global name |
| 2️⃣ | Disabled "Block all public access" during setup |
| 3️⃣ | Uploaded sample images (`.jpg`, `.png`) and documents (`.pdf`) |
| 4️⃣ | Added a bucket policy to grant `s3:GetObject` to `*` (public read) |
| 5️⃣ | Retrieved the Object URLs for each file |
| 6️⃣ | Shared URLs with the frontend team for integration testing |

---

## 🔐 Sample Bucket Policy (Public Read)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
🌐 Generated Public URL Format
text
https://your-bucket-name.s3.amazonaws.com/filename.jpg
Example: https://my-dev-assets.s3.amazonaws.com/team-photo.png

📂 Files Uploaded
team-banner.png

profile-pic.jpg

onboarding-guide.pdf

💡 Key Takeaways
S3 is highly scalable and perfect for static asset hosting.

Understanding bucket policies is crucial—misconfiguration can lead to security leaks, but proper setup enables smooth frontend-backend collaboration.

Always test public URLs in an incognito window to verify access permissions.

🙏 Acknowledgments
A huge thank you to:

miseacademy – For providing structured, industry-aligned cloud training.

Hafiz Muhammad Umair Munir – For expert mentorship and guidance on AWS fundamentals.