### Task & Requirements

Core Task: Using the AWS Provider, code the following:

*  Cluster of application server instances
  * AWS LB in front of this cluster
*  Cluster of worker server instances
*  Aurora database cluster (MySQL Engine, at least 3 instances)
*  Memcached cluster (elasticache)
*  Redis cluster (elasticache)
*  These items should be contained in a basic VPC with the appropriate pieces:
  * security groups
  * Subnets
  * gateways (NAT or otherwise)
  * other infrastructure components as needed, etc

Bonus: None of this is required nor will not doing any of this count against you.
*  Sensible directory and file structure
*  Provide for mapping cloud assets via AWS API (tags)
*  Cloudfront CDN
*  Custom terraform modules
*  "Precompilation" of terraform code files to allow for more advanced topology patterns.
*  Other creative solutions/ideas

File Structure:

.
├── modules
│   ├── alb
│   │   ├── alb.tf
│   │   └── variables.tf
│   ├── app_tier
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── web_tier.tf
│   ├── db
│   │   ├── aurora.tf
│   │   └── variables.tf
│   ├── db_tier
│   │   ├── auroradb_tier.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ec2
│   │   ├── ec2.tf
│   │   ├── example
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ec2.bastion
│   │   ├── bastion_host.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── memcached
│   │   ├── memcached.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── memcached_tier
│   │   ├── memcached_tier.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── public_tier
│   │   ├── outputs.tf
│   │   ├── public_tier.tf
│   │   └── variables.tf
│   ├── redis
│   │   ├── outputs.tf
│   │   ├── redis.tf
│   │   └── variables.tf
│   ├── redis_tier
│   │   ├── outputs.tf
│   │   ├── reddis_tier.tf
│   │   └── variables.tf
│   └── vpc
│       ├── outputs.tf
│       ├── variables.tf
│       └── vpc.tf
├── root
│   ├── alb.tf
│   ├── auroradb.tf
│   ├── instances.tf
│   ├── main.tf
│   ├── memcached.tf
│   ├── redis.tf
│   ├── sqs.tf
│   ├── subnets.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   └── variables.tf
└── tools
    └── gen_vars_oneliner

