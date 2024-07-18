# Enable versioning on an S3 bucket using the AWS CLI:

1. **Create an S3 bucket with versioning enabled**:

```
aws s3api create-bucket --bucket my-bucket --region us-east-1 --versioning-configuration Status=Enabled
```

This command creates a new S3 bucket named `my-bucket` in the `us-east-1` region with versioning enabled.

2. **Enable versioning on an existing S3 bucket**:

```
aws s3api put-bucket-versioning --bucket my-bucket --versioning-configuration Status=Enabled
```

This command enables versioning on an existing S3 bucket named `my-bucket`.

3. **Check the versioning status of an S3 bucket**:

```
aws s3api get-bucket-versioning --bucket my-bucket
```

This command retrieves the versioning status of the S3 bucket named `my-bucket`. The output will show the current versioning status, which can be `Enabled`, `Suspended`, or `(null)` if versioning is not enabled.

Once versioning is enabled, any new objects uploaded to the bucket will be versioned, and you can retrieve previous versions of objects using the `aws s3api get-object` command with the `--version-id` parameter.

Here's an example of how to download a specific version of an object from an S3 bucket with versioning enabled:

```
aws s3api get-object --bucket my-bucket --key my-object.txt --version-id abcd1234-wxyz-0123-4567-efghijklmnop my-object.txt
```

This command downloads the object `my-object.txt` from the `my-bucket` S3 bucket, using the specified version ID.

Remember to replace `my-bucket` and `my-object.txt` with the appropriate names for your S3 bucket and object.

Reference: 
https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html
