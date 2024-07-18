# Steps to create, list, and delete an S3 bucket using the AWS CLI:

## Create an S3 Bucket

To create an S3 bucket, use the `aws s3 mb` (make bucket) command:

```
aws s3 mb s3://my-new-bucket
```

This will create a new S3 bucket named `my-new-bucket` in the default AWS region.

## List S3 Buckets

To list all the S3 buckets in your AWS account, use the `aws s3 ls` command:

```
aws s3 ls
```

This will output a list of all your S3 buckets and their creation dates.

You can also list the contents of a specific bucket:

```
aws s3 ls s3://my-new-bucket
```

This will list all the objects inside the `my-new-bucket` S3 bucket.

## Delete an S3 Bucket

To delete an S3 bucket, use the `aws s3 rb` (remove bucket) command:

```
aws s3 rb s3://my-new-bucket
```

This will delete the `my-new-bucket` S3 bucket. Note that the bucket must be empty before it can be deleted.

If the bucket is not empty, you can use the `--force` option to delete all the objects in the bucket and then delete the bucket:

```
aws s3 rb s3://my-new-bucket --force
```

This will delete all the objects in the `my-new-bucket` bucket and then delete the bucket itself.

Remember to replace `my-new-bucket` with the name of your actual S3 bucket in the above commands.
