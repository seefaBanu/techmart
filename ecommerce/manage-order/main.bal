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

isolated function addOrder(Order orderDet) returns int|error {
    return 1;
}

function getOrder(string id) returns Order {
    return testOrder;
}

function getOrders() returns Order[] {
    return [testOrder, testOrder2];
}
