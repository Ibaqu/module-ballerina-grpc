import ballerina/grpc;
import ballerina/time;
import ballerina/protobuf.types.wrappers;
import ballerina/protobuf.types.timestamp;
import ballerina/grpc.types.timestamp as stimestamp;
import ballerina/grpc.types.wrappers as swrappers;

public isolated client class helloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR_HELLOWORLDTIMESTAMP, getDescriptorMapHelloWorldTimestamp());
    }

    isolated remote function getTime(string|wrappers:ContextString req) returns stream<time:Utc, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/getTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        stimestamp:TimestampStream outputStream = new stimestamp:TimestampStream(result);
        return new stream<time:Utc, grpc:Error?>(outputStream);
    }

    isolated remote function getTimeContext(string|wrappers:ContextString req) returns timestamp:ContextTimestampStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/getTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        stimestamp:TimestampStream outputStream = new stimestamp:TimestampStream(result);
        return {content: new stream<time:Utc, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function sendTime(time:Utc|timestamp:ContextTimestamp req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        time:Utc message;
        if req is timestamp:ContextTimestamp {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/sendTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function sendTimeContext(time:Utc|timestamp:ContextTimestamp req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        time:Utc message;
        if req is timestamp:ContextTimestamp {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/sendTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function exchangeTime(time:Utc|timestamp:ContextTimestamp req) returns stream<time:Utc, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        time:Utc message;
        if req is timestamp:ContextTimestamp {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/exchangeTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        stimestamp:TimestampStream outputStream = new stimestamp:TimestampStream(result);
        return new stream<time:Utc, grpc:Error?>(outputStream);
    }

    isolated remote function exchangeTimeContext(time:Utc|timestamp:ContextTimestamp req) returns timestamp:ContextTimestampStream|grpc:Error {
        map<string|string[]> headers = {};
        time:Utc message;
        if req is timestamp:ContextTimestamp {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/exchangeTime", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        stimestamp:TimestampStream outputStream = new stimestamp:TimestampStream(result);
        return {content: new stream<time:Utc, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function getGreeting(string|wrappers:ContextString req) returns stream<Greeting, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/getGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        GreetingStream outputStream = new GreetingStream(result);
        return new stream<Greeting, grpc:Error?>(outputStream);
    }

    isolated remote function getGreetingContext(string|wrappers:ContextString req) returns ContextGreetingStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/getGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        GreetingStream outputStream = new GreetingStream(result);
        return {content: new stream<Greeting, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function sendGreeting(Greeting|ContextGreeting req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Greeting message;
        if req is ContextGreeting {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/sendGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function sendGreetingContext(Greeting|ContextGreeting req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Greeting message;
        if req is ContextGreeting {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/sendGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function exchangeGreeting(Greeting|ContextGreeting req) returns stream<Greeting, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Greeting message;
        if req is ContextGreeting {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/exchangeGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        GreetingStream outputStream = new GreetingStream(result);
        return new stream<Greeting, grpc:Error?>(outputStream);
    }

    isolated remote function exchangeGreetingContext(Greeting|ContextGreeting req) returns ContextGreetingStream|grpc:Error {
        map<string|string[]> headers = {};
        Greeting message;
        if req is ContextGreeting {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/exchangeGreeting", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        GreetingStream outputStream = new GreetingStream(result);
        return {content: new stream<Greeting, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class GreetingStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Greeting value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|Greeting value;|} nextRecord = {value: <Greeting>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class HelloWorldStringCaller {
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

public client class HelloWorldGreetingCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGreeting(Greeting response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGreeting(ContextGreeting response) returns grpc:Error? {
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

public client class HelloWorldTimestampCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendTimestamp(time:Utc response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextTimestamp(timestamp:ContextTimestamp response) returns grpc:Error? {
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

public type ContextGreetingStream record {|
    stream<Greeting, error?> content;
    map<string|string[]> headers;
|};

public type ContextGreeting record {|
    Greeting content;
    map<string|string[]> headers;
|};

public type Greeting record {|
    string name = "";
    time:Utc time = [0, 0.0d];
|};

const string ROOT_DESCRIPTOR_HELLOWORLDTIMESTAMP = "0A1968656C6C6F576F726C6454696D657374616D702E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F224E0A084772656574696E6712120A046E616D6518012001280952046E616D65122E0A0474696D6518022001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D70520474696D653286030A0A68656C6C6F576F726C6412450A0767657454696D65121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1A2E676F6F676C652E70726F746F6275662E54696D657374616D70300112460A0873656E6454696D65121A2E676F6F676C652E70726F746F6275662E54696D657374616D701A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112480A0C65786368616E676554696D65121A2E676F6F676C652E70726F746F6275662E54696D657374616D701A1A2E676F6F676C652E70726F746F6275662E54696D657374616D70300112380A0B6765744772656574696E67121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A092E4772656574696E67300112390A0C73656E644772656574696E6712092E4772656574696E671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122A0A1065786368616E67654772656574696E6712092E4772656574696E671A092E4772656574696E673001620670726F746F33";

public isolated function getDescriptorMapHelloWorldTimestamp() returns map<string> {
    return {"google/protobuf/timestamp.proto": "0A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F120F676F6F676C652E70726F746F627566223B0A0954696D657374616D7012180A077365636F6E647318012001280352077365636F6E647312140A056E616E6F7318022001280552056E616E6F7342580A13636F6D2E676F6F676C652E70726F746F627566420E54696D657374616D7050726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "helloWorldTimestamp.proto": "0A1968656C6C6F576F726C6454696D657374616D702E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F224E0A084772656574696E6712120A046E616D6518012001280952046E616D65122E0A0474696D6518022001280B321A2E676F6F676C652E70726F746F6275662E54696D657374616D70520474696D653286030A0A68656C6C6F576F726C6412450A0767657454696D65121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1A2E676F6F676C652E70726F746F6275662E54696D657374616D70300112460A0873656E6454696D65121A2E676F6F676C652E70726F746F6275662E54696D657374616D701A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112480A0C65786368616E676554696D65121A2E676F6F676C652E70726F746F6275662E54696D657374616D701A1A2E676F6F676C652E70726F746F6275662E54696D657374616D70300112380A0B6765744772656574696E67121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A092E4772656574696E67300112390A0C73656E644772656574696E6712092E4772656574696E671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122A0A1065786368616E67654772656574696E6712092E4772656574696E671A092E4772656574696E673001620670726F746F33"};
}

