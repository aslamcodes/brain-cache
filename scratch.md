Given: The Jenkins pipeline is set up to deploy to multi-tenant servers, and deployment configurations are stored in an S3 bucket.
When: A deployment is triggered for a specific tenant environment, and the pipeline fetches the corresponding configuration from the S3 bucket.
Then: The pipeline uses the fetched configuration to deploy the code to the appropriate server, ensuring tenant-specific settings are applied correctly during the deployment.
