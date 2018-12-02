import json

def my_handler(event, context):
    message = json.dumps(event, indent=4, separators=(',', ': '))
    print("log message: " + message)
    return {
        "isBase64Encoded": "false",
        "statusCode": 200,
        "headers": {},
        "body": message
    }
