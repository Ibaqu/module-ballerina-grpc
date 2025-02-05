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

listener grpc:Listener ep50 = new (9150);
boolean cancelled = false;

@grpc:ServiceDescriptor {descriptor: ROOT_DESCRIPTOR_50_BIDI_CALLER_CANCEL_STATUS, descMap: getDescriptorMap50BidiCallerCancelStatus()}
service "HelloWorld50" on ep50 {

    remote function sendString(HelloWorld50StringCaller caller,
     stream<string, error?> clientStream) returns error? {
        record {|string value;|}|error? result = clientStream.next();
        result = clientStream.next();
        if caller.isCancelled() {
            cancelled = true;
        }
        _ = check clientStream.next();
        check caller->complete();
    }

    remote function checkCancellation(HelloWorld50BooleanCaller caller) returns error? {
        check caller->sendBoolean(cancelled);
        check caller->complete();
    }
}
