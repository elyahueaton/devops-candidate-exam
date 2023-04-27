pipeline{
    agent any
    environment {
        bucket_id = ""
        vpc_id = ""
        region = ""
    }
    options {
            buildDiscarder(logRotator(numToKeepStr: '10'))
            timeout(time: 1, unit: 'HOURS')
            ansiColor('xterm')
    }
    stages{
        stage("TF Init"){
            steps{
                echo "Executing Terraform Init"
                sh "terraform init"
            }
        }
        stage("TF Validate"){
            steps{
                echo "Validating Terraform Code"
                sh "terraform validate"
            }
        }
        stage("TF Plan"){
            steps{
                echo "Executing Terraform Plan"
                sh "terraform plan"
            }
        }
        stage("TF Apply"){
            steps{
                echo "Executing Terraform Apply"
                sh "terraform apply"
            }
        }
        stage("Invoke Lambda"){
            steps{
                echo "Invoking your AWS Lambda"
                sh "aws s3 cp triggerPost.py s3://3.devops.candidate.exam/Elyahu.Eaton"
                sh "aws lambda invoke --function-name triggerPost.py --s3-bucket 3.devops.candidate.exam --s3-key Elyahu.Eaton --region ap-south-1 output.txt"
            }
        }
    }
}

/* Example of Labda use */
def updateLambda(functionName, bucketName, s3key, codeFileName, region, updateAlias = true, aliasName = "active") {
    sh "aws s3 cp ${codeFileName} s3://${bucketName}/${s3key}"
    sh "aws lambda update-function-code --function-name ${functionName} --s3-bucket ${bucketName} --s3-key ${s3key} --region ${region} --output json"
    updateLambdaAlias(functionName,region,updateAlias,aliasName)
}
