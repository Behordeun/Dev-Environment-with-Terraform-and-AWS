# Dev-Environment-with-Terraform-and-AWS

This project introduces beginners to building a dev environment with **Terraform** and **AWS**.

## Prerequisites

1. AWS account.
2. Creation of **AWS IAM keys**
3. Terraform installation.
4. Microsoft Visual Studio Code **(VSC)** Installation or an IDE of choice.
   **NB**
   Installation of VSC is most prefered.
5. Installation of the following VSC extensions
   - AWS Toolkit
   - Remote - SSH

Next, we proceed to create resources in our AWS instance, by automating the process right from our terraform files. 9 resources were created in our AWS instance right from terraform. These resources are:

1. Virtual Private Cloud (VPC).
2. Subnet into the VPC.
3. Internet Gateway.
4. Route Table.
5. Route.
6. Route Table Association.
7. Security Group
8. Key Pair
9. Ubuntu Server (Here, ubuntu 20.0.4 was chosen).
   Under resource 9:
   - we increased the disk space from the default 8Gb to 10Gb; under the ***root_block_device***.
   - We also specified a provisioner and an interpreter which informs the system which scripting tool to use based on the host operating system.

## How to use this repo

Run git clone [https://github.com/Behordeun/Dev-Environment-with-Terraform-and-AWS.git](https://github.com/Behordeun/Dev-Environment-with-Terraform-and-AWS.git)

After having cloned the repository, run `terraform init` to initialize your terraform work environment.

After setting up your workflow, run:

```
# initialize terraform

terraform init
```

```
# Check the resources that will be added to your AWS EC2 instance

terraform plan
```

```
# Apply (create) the resources

terraform apply
```

If you run **terraform apply**, you will get a prompt to type **yes**. If you do not want to get any prompt, run

```
terraform apply -auto-approve
```

## Tips

Here are a few terraform commands and their functions.

- `terraform init -upgrade` - Reinitialize terraform to catch up with updates in your files.
- `terraform state list` - Lists all the resources in your instance.
- `terraform state show <resource name>` - Displays all properties of the specified resource.
- `terraform destroy` - Destroys and delete all the resources in your instance.
- `terraform apply -replace <resource name>` - run the creation of resources again, while making a change to the specified resource.
- `terraform apply -refresh` - Updates the resources without having to destroy the resources.
- `terraform console` - An interpreter that you can use to evaluate Terraform expressions and explore your Terraform project's state.

These and more are Terraform commands.

Feel free to fork this repo, raise a **pull request** to contribute to this project, and raise an issue if you encounter any challenge.

## **About the author**

**Muhammad Abiodun Sulaiman** is a graduate of **Mathematics and Statistics** from the prestigious **Federal University of Technology Minna, Niger State, Nigeria** with Second-Class Honors. He is a smart, innovative, and seasoned analytics expert with a track record dating back to his undergraduate days.

Muhammad is a Data Science Fellow with **Insight2Impact (i2i) facilities**. A Microsoft Recognized Data-scientist which he bagged with an overall performance of 85%.  As a top-performing data enthusiast in the DataHack4FI Innovation Award 2019 season 3, He was awarded a gold badge (Medal). He finished up in the top 3 in the Microsoft Capstone Challenge for Mortgage Loan Approval, a Machine Learning Challenge that Involves predictive modelling. Similarly, he finished up in the top 1% in the Data Science Nigeria 2019 Artificial Intelligence preselection Kaggle Challenge, a Machine Learning Challenge that also Involves predictive modelling.

He also finished up in the top 5 Data Scientists who participated in the Data Science Nigeria 2019 AI Bootcamp pre-selection Kaggle Challenge, which involves the application of Artificial Intelligence to build an algorithmic predictive model for staff promotion.

Muhammad doubles as a **Google Africa Developers Scholar** and a member of the **Facebook Developers Circle (DevC)**, he bagged in 2019, 2020 and 2021 **Andela Learning Community** (ALC) scholarships where he got admitted for the Google Cloud Architecture Engineering tracks consecutively.

 As a passionate self-taught Data-scientist who transitioned from being a Data Analyst, who is enthusiastic about training and helping aspiring data enthusiasts towards honing their analytical skills, He started an online coding class in collaboration with a few friends during his service year in 2019 to help interested people (graduates and nongraduates) learn how to code towards a data related career.

He is an experienced Data Scientist and Business Intelligence Analyst with a demonstrated history of working in the Research industry, extracting actionable insights from massive amounts of data, and with in-depth experience in applying advanced machine learning and data mining methods in analyzing data and in handling multiple business problems across Retail and Technology Domain. Skilled in Machine Learning, Deep Learning, Software Engineering (Backend), Statistical Modeling, Data Visualization with strong presentation and communication skills, Strong Business Development, excellent Critical Thinking and Problem-solving skills and attention to detail.

Muhammad currently works as a Business Intelligence Specialist at Stata Insight Technologies Ltd. Prior to his current role, he held different roles at varying times in organizations such as Data Scientist at Prince_Analyst Concept, Data Scientist and Python Back-end Software Engineer at the Nigerian branch of Rhics UK. Muhammad had worked with different teams of Data Analysts/Scientists and Developers on freelance projects. He is also partnering with other innovative minds to develop solutions to varieties of problems across different sectors, health and finance inclusive.

Muhammad had over the last 4 years mentored over 20 data enthusiasts who are into either Data Analytics,  Business Analytics or Artificial Intelligence.

**Author:** Muhammad Abiodun Sulaiman

**Email:** abiodun.msulaiman@gmail.com

**LinkedIn:** [Muhammad Abiodun Sulaiman](https://www.linkedin.com/in/muhammad-abiodun-sulaiman)

**Twitter:** [@Prince_Analyst](https://www.twitter.com/Prince_Analyst)

**Facebook:** [Muhammad Abiodun Sulaiman](https://www.facebook.com/muhammad.herbehordeun)

**Tel:** +(234)8108316393, +(234)7012284454

[![My Pix.png](https://user-images.githubusercontent.com/45925374/140731559-e56f334c-8e89-48b8-92f7-fbe66a7447d9.png)](https://user-images.githubusercontent.com/45925374/140731559-e56f334c-8e89-48b8-92f7-fbe66a7447d9.png)

# See you in another project, but before then, always remember to terraform apply yourself 😉
