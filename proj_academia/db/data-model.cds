namespace eco;

entity Product {
    key ID : UUID;
    name : String;
    category : String;
    currentStock : Integer;
    minStock : Integer; // Pode não ser aqui que eu guardo esta info
}

entity StockEntry {
    key ID : UUID;
    type : String enum { Entrada; Saída; };
    quantity : Integer;
    date : DateTime;
    product : Association to Product;
}

entity Supplier {
    key ID : UUID;
    name : String;
    contact : String;
}