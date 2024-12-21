%dw 2.0
output application/json
---
{
	AppName: app.name,
	Message: error.errorMessage.payload.Message default (error.description),
	ErrorType: error.errorMessage.Payload.ErrorType default (error.errorType.namespace ++ ":" ++ error.errorType.identifier),
	transactionId: vars.transactionId default correlationId
}
