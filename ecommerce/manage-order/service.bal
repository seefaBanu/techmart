import ballerina/http;

service / on new http:Listener(8080) {

    //  isolated resource function post .(@http:Payload Order orderDet) returns int|error? {
    //     return addOrder(orderDet);
    // }

    // isolated resource function get [string id]() returns Order|error? {
    //     return getOrder(id);
    // }

    isolated resource function post create\-order() returns string|error? {
        return "order Added Successfully";
    }

    resource function get order\-by\-id/[string id]() returns Order|error? {
        return getOrder(id);
    }

    resource function get orders() returns Order[]|error? {
        return getOrders();
    }

}
