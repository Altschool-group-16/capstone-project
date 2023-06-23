## Note that in cloudfront.tf file -

The WorkflowID is declared as a variable.
The CloudFront origin access identity is defined using the aws_cloudfront_origin_access_identity resource.
The CloudFront distribution is defined using the aws_cloudfront_distribution resource. The depends_on attribute ensures that the origin access identity is created before the distribution.
The WorkflowID output value is declared, with an export configuration to make it available for cross-stack references or sharing with other resources.

## Note that in frontend.tf file -

The ID is declared as a variable.
The S3 bucket for the website is defined using the aws_s3_bucket resource. The bucket parameter uses variable interpolation to construct the bucket name.
The bucket policy is defined using the aws_s3_bucket_policy resource. The bucket reference is obtained using aws_s3_bucket.WebsiteBucket.id.
The WebsiteURL output value is declared, which uses the website_endpoint attribute of the S3 bucket resource.

## Note that in backend.tf file -

The ID is declared as a variable.
The EC2 instance security group is defined using the aws_security_group resource. The ingress rules allow access to ports 22, 3030, and 9100 from all IP addresses (0.0.0.0/0).
The EC2 instance is defined using the aws_instance resource. The security group reference is obtained using aws_security_group.InstanceSecurityGroup.name.
Tags are applied to the EC2 instance using the tags attribute.
Please note that you should replace the key pair name (udacity) and the AMI ID (ami-068663a3c619dd892) with appropriate values for your specific environment and requirements.
