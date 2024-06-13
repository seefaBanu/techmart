import ballerinax/mssql.driver as _;
import ballerina/sql;
import ballerinax/mssql;

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

public type Order record {|
    string order_id?;
    string customer_id;
    string order_date;
    string order_status;
    decimal total_amount;
|};

Order testOrder = {
    order_id: "order-123",
    customer_id: "customer-456",
    order_date: "2024-06-15T10:30:00Z",
    order_status: "Pending",
    total_amount: 200.00
};

Order testOrder2 = {
    order_id: "order-456",
    customer_id: "customer-789",
    order_date: "2024-06-15T10:30:00Z",
    order_status: "Pending",
    total_amount: 400.00
};

final mssql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="TechMart"
);

isolated function addOrder(Order orderDet) returns int|error {
    sql:ExecutionResult result = check dbClient->execute(`
        INSERT INTO Orders (order_id, customer_id, order_date, order_status, total_amount, last_updated)
        VALUES (${orderDet.order_id}, ${orderDet.customer_id}, ${orderDet.order_date},  
                ${orderDet.order_status}, ${orderDet.total_amount})
    `);
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to obtain last insert ID");
    }
}

function getOrder(string id) returns Order {
    return testOrder;
}

function getOrders() returns Order[] {
    return [testOrder, testOrder2];
}
