import ballerina/http;

type InventoryItem record {
    string item_id;
    string item_name;
    int quantity;
    decimal unit_price;
};

InventoryItem inventory1 = {
    item_id: "1",
    item_name: "Widget A",
    quantity: 100,
    unit_price: 10.50
};

InventoryItem inventory2 = {
    item_id: "2",
    item_name: "Widget B",
    quantity: 200,
    unit_price: 20.00
};

service /inventory on new http:Listener(8080) {

    //  isolated resource function post .(@http:Payload Order orderDet) returns int|error? {
    //     return addOrder(orderDet);
    // }

    // isolated resource function get [string id]() returns Order|error? {
    //     return getOrder(id);
    // }

    isolated resource function post .() returns string|error? {
        return "Inventory created Successfully";
    }

    resource function get [string id]() returns InventoryItem|error? {
        return inventory1;
    }

    resource function get .() returns InventoryItem[]|error? {
        return [inventory1, inventory2];
    }

    resource function put .(string id, int orderQuantity) returns InventoryItem|error? {
        if (id == "1") {
            inventory1.quantity -= orderQuantity;
            return inventory1;
        } else if (id == "2") {
            inventory2.quantity -= orderQuantity;
            return inventory2;
        } else {
            return error("Item not found");
        }        
    }

}