import * as dotenv from 'dotenv';
import S3EnhancedClient from "./s3EnhancedClient";

async function main() {
    
    dotenv.config()
    const region = process.env.AWS_REGION ?? ''
    const accessKeyId = process.env.ACCESS_KEY_ID ?? ''
    const secretAccessKey = process.env.SECRET_ACCESS_KEY ?? ''

    const s3EnhancedClient = new S3EnhancedClient({ region, credentials: { accessKeyId, secretAccessKey } })
    
    const bucketsInfo = await s3EnhancedClient.getBuckets();

    console.log(`Owner:\t${JSON.stringify(bucketsInfo.Owner)}\nBuckets:\n${JSON.stringify(bucketsInfo.Buckets)}`)
}

main()