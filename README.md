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

# s3.tf file:

Next, create a s3.tf file. This is where we will configure our static website but you are more than welcome to reuse my-first-static-website

In the s3.tf file, configure your s3 bucket. This bucket will host your static website and store your .html files

<img width="387" height="86" alt="s3_bucket" src="https://github.com/user-attachments/assets/44664d68-147a-45cd-9723-c9645ccdf01d" />

Next, configure a aws_s3_bucket_website_configuration resource. This resource allows and configures static website hosting on an s3 bucket but while the s3 bucket stores your HTML/CSS/JS files,this resource tells AWS how to serve them as a website.

<img width="459" height="229" alt="website_configuration" src="https://github.com/user-attachments/assets/ec12f36d-ef77-4427-b7bb-08da17943516" />

Next, configure an aws_s3_bucket_public_access_block resource. This resource is a firewall before your bucket policy, if this says "block," then even a public bucket policy won't allow access

<img width="539" height="149" alt="public access block" src="https://github.com/user-attachments/assets/61e5af90-9b34-4b51-96a5-dedaafb18e21" />

Next, configure a aws_s3_bucket_policy resource. This resource allows s3 bucket and your users to have access to your files in your bucket

<img width="549" height="268" alt="bucket_policy" src="https://github.com/user-attachments/assets/c8be079d-62ef-4ab3-b63a-e7390dab2f49" />

Next, we will configure a index object resource and a error object resource. This resource will be for our index.html and error.html files and will upload our files into an s3 bucket

<img width="313" height="120" alt="s3_index_object" src="https://github.com/user-attachments/assets/51c44edf-c1a6-493e-b0dd-b85c41fdce86" />
<img width="310" height="115" alt="s3_object_error" src="https://github.com/user-attachments/assets/e4e3d8f5-9b1e-4f3f-934e-eaa755642638" />

# Index.html and Error.html files:

Next, we need an index.html and error.html file that will be used for our static website. You are more than welcome use chatgpt for this.

<img width="267" height="206" alt="index html file" src="https://github.com/user-attachments/assets/74e3dcd0-e58a-4e8b-9a3e-2ee10a5673fb" />
<img width="490" height="274" alt="error html file" src="https://github.com/user-attachments/assets/190fcb45-eeeb-4060-95af-f444da341821" />
