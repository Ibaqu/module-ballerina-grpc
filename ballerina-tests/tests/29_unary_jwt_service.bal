// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/grpc;
import ballerina/io;
import ballerina/protobuf.types.wrappers;
import ballerina/jwt;

listener grpc:Listener ep29 = new (9119);

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_29_UNARY_JWT,
    descMap: getDescriptorMap29UnaryJwt()
}
service /HelloWorld29 on ep29 {

    remote isolated function testStringValueReturn(HelloWorld29StringCaller caller, ContextString request) returns grpc:Error? {
        io:println("name: " + request.content);
        string message = "Hello " + request.content;
        map<string|string[]> responseHeaders = {};
        grpc:JwtValidatorConfig config = {
            issuer: "wso2",
            audience: "ballerina",
            signatureConfig: {
                trustStoreConfig: {
                    trustStore: {
                        path: TRUSTSTORE_PATH,
                        password: "ballerina"
                    },
                    certAlias: "ballerina"
                }
            },
            scopeKey: "scope"
        };
        if !request.headers.hasKey(grpc:AUTH_HEADER) {
            check caller->sendError(error grpc:AbortedError("AUTH_HEADER header is missing"));
        } else {
            grpc:ListenerJwtAuthHandler handler = new(config);
            jwt:Payload|grpc:UnauthenticatedError authResult = handler.authenticate(request.headers);
            if authResult is grpc:UnauthenticatedError {
                check caller->sendError(authResult);
            } else {
                grpc:PermissionDeniedError? authrzResult = handler.authorize(<jwt:Payload>authResult, "write");
                if authrzResult is () {
                    responseHeaders["x-id"] = ["1234567890", "2233445677"];
                    wrappers:ContextString responseMessage = {content: message, headers: responseHeaders};
                    grpc:Error? err = caller->sendContextString(responseMessage);
                    if err is grpc:Error {
                        io:println("Error from Connector: " + err.message());
                    } else {
                        io:println("Server send response : " + message);
                    }
                } else {
                    check caller->sendError(authrzResult);
                }
            }
        }
        checkpanic caller->complete();
    }

    remote isolated function testStringValueReturnNegative(HelloWorld29StringCaller caller, ContextString request) returns grpc:Error? {
        grpc:JwtValidatorConfig config = {
            issuer: "wso2",
            audience: "ballerina",
            signatureConfig: {
                trustStoreConfig: {
                    trustStore: {
                        path: TRUSTSTORE_PATH,
                        password: "ballerina"
                    },
                    certAlias: "ballerina"
                }
            },
            scopeKey: "scope"
        };
        if !request.headers.hasKey(grpc:AUTH_HEADER) {
            check caller->sendError(error grpc:AbortedError("AUTH_HEADER header is missing"));
        } else {
            grpc:ListenerJwtAuthHandler handler = new(config);
            jwt:Payload|grpc:UnauthenticatedError authResult = handler.authenticate(request.headers);
            if authResult is grpc:UnauthenticatedError {
                check caller->sendError(authResult);
            } else {
                grpc:PermissionDeniedError? authrzResult = handler.authorize(<jwt:Payload>authResult, "write");
                if authrzResult is grpc:PermissionDeniedError {
                    check caller->sendError(authrzResult);
                } else {
                    check caller->sendError(error grpc:AbortedError("Expected error was not found."));
                }
            }
        }
    }
}
