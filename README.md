# smart-static-website

We'll creating a smart static using VSCode and Terraform. 

I'll be using my-first-static-website and build on top of that.

Services used are S3 bucket, ACM (certificate manager), Cloudwatch logs, Cloudfront, Route53 and WAF.

First thing's first, create a folder and name it "smart-static-website" but you can name it whatever you want to.

# Project Layout: 
In the screenshot below, this is how the project files should look at the end of the project

<img width="218" height="669" alt="project files" src="https://github.com/user-attachments/assets/2177ba7a-5f52-4a17-9aab-3879aaa138e7" />

# Provider.tf: 
Create a provider.tf file. This is where our aws region code will be witten and it is crucial that you configure a us-east-1 provider in which i'll explain later.

<img width="288" height="81" alt="provider 1" src="https://github.com/user-attachments/assets/f1154981-6939-4dd7-abcf-8afc187ad5db" />

<img width="177" height="81" alt="provider 2" src="https://github.com/user-attachments/assets/3f385bc8-a98f-4d11-bd38-6a680fb7c94c" />

<img width="354" height="103" alt="aws_region" src="https://github.com/user-attachments/assets/f0272b37-6f9d-4a6a-a20e-260d20500f81" />
