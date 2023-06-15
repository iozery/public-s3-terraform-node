import { ListBucketsCommand, ListBucketsOutput, S3Client, S3ClientConfig } from "@aws-sdk/client-s3";

export default class S3EnhancedClient {

    private s3Client: S3Client

    constructor(s3ClientConfig: S3ClientConfig){
        this.s3Client = new S3Client(s3ClientConfig);
    }

    getBuckets = async (): Promise<ListBucketsOutput> => {
        const command = new ListBucketsCommand({});
        return this.s3Client.send(command)
      };
}