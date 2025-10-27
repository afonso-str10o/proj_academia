namespace eco;
using { cuid } from '@sap/cds/common';

entity Product : cuid {
    name : String;
    category : String;
    currentStock : Integer;
    minStock : Integer; // Pode não ser aqui que eu guardo esta info
}

entity StockEntry : cuid {
    type : String enum { Entrada; Saída; };
    quantity : Integer;
    date : DateTime;
    product : Association to Product;
}

entity Supplier : cuid {
    name : String;
    contact : String;
}