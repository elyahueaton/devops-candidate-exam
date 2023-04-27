import json
import boto3
import urllib.request

def lambda_handler(event, context):
    # Set up the request parameters
    url = 'https://ij92qpvpma.execute-api.eu-west-1.amazonaws.com/candidate-email_serverless_lambda_stage/data'
    headers = {'X-Siemens-Auth': 'test'}
    data = {
        "subnet_id": "private_subnet",
        "name": "Elyahu_Eaton",
        "email": "elyahu.eaton@siemens.com"
    }

    # Encode the data payload as JSON
    data = json.dumps(data).encode('utf-8')

    # Create a POST request with the headers and data
    req = urllib.request.Request(url=url, data=data, headers=headers)

    # Send the request and capture the response
    response = urllib.request.urlopen(req)

    # Print the response to the logs
    print(response.read().decode('utf-8'))
    """ 
    return {
        'statusCode': 200,
        'body': json.dumps('Request sent successfully!')
    }

    """