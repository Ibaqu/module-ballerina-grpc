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
import ballerina/protobuf.types.wrappers;

public isolated client class HelloWorld26Client {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR_26_RETURN_DATA_CLIENT_STREAMING, getDescriptorMap26ReturnDataClientStreaming());
    }

    isolated remote function lotsOfGreetings() returns LotsOfGreetingsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("grpcservices.HelloWorld26/lotsOfGreetings");
        return new LotsOfGreetingsStreamingClient(sClient);
    }
}

//public client class LotsOfGreetingsStreamingClient {
//    private grpc:StreamingClient sClient;
//
//    isolated function init(grpc:StreamingClient sClient) {
//        self.sClient = sClient;
//    }
//
//    isolated remote function sendString(string message) returns grpc:Error? {
//        return self.sClient->send(message);
//    }
//
//    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
//        return self.sClient->send(message);
//    }
//
//    isolated remote function receiveString() returns string|grpc:Error? {
//        var response = check self.sClient->receive();
//        if response is () {
//            return response;
//        } else {
//            [anydata, map<string|string[]>] [payload, _] = response;
//            return payload.toString();
//        }
//    }
//
//    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
//        var response = check self.sClient->receive();
//        if response is () {
//            return response;
//        } else {
//            [anydata, map<string|string[]>] [payload, headers] = response;
//            return {content: payload.toString(), headers: headers};
//        }
//    }
//
//    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
//        return self.sClient->sendError(response);
//    }
//
//    isolated remote function complete() returns grpc:Error? {
//        return self.sClient->complete();
//    }
//}

public client class HelloWorld26StringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

const string ROOT_DESCRIPTOR_26_RETURN_DATA_CLIENT_STREAMING = "0A2532365F72657475726E5F646174615F636C69656E745F73747265616D696E672E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F325F0A0C48656C6C6F576F726C643236124F0A0F6C6F74734F664772656574696E6773121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801620670726F746F33";

public isolated function getDescriptorMap26ReturnDataClientStreaming() returns map<string> {
    return {"26_return_data_client_streaming.proto": "0A2532365F72657475726E5F646174615F636C69656E745F73747265616D696E672E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F325F0A0C48656C6C6F576F726C643236124F0A0F6C6F74734F664772656574696E6773121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801620670726F746F33", "google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"};
}

