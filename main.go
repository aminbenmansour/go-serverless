package main

import (
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"

	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbiface"

	"github.com/aminbenmansour/go-serverless/controller"
)

var (
	dynamoClient dynamodbiface.DynamoDBAPI
)

func main() {
	region := os.Getenv("AWS_REGION")
	awsSession, err := session.NewSession(
		&aws.Config{
			Region: aws.String(region),
		},
	)

	if err != nil {
		return
	}

	dynamoClient = dynamodb.New(awsSession)
	lambda.Start(handler)
}

const tableName = "serverless"

func handler(req events.APIGatewayProxyRequest) (*events.APIGatewayProxyResponse, error) {
	switch req.HTTPMethod {
	case "GET":
		return controller.GetUser(req, tableName, dynamoClient)
	case "POST":
		return controller.CreateUser(req, tableName, dynamoClient)
	case "PUT":
		return controller.UpdateUser(req, tableName, dynamoClient)
	case "DELETE":
		return controller.DeleteUser(req, tableName, dynamoClient)
	default:
		return controller.UnhandledMethod()
	}
}
