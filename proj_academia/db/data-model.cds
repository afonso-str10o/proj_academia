namespace eco;
using { cuid, managed } from '@sap/cds/common';

@label: '{i18n>Product}'
entity Product : cuid, managed {
    @title: '{i18n>Product-name}'
    @mandatory
    name          : String ;

    @title: '{i18n>Product-category}'
    @mandatory
    category      : String;

    @title: '{i18n>Product-currentStock}'
    currentStock  : Integer;

    @title: '{i18n>Product-minStock}'
    minStock      : Integer;
}

@label: '{i18n>StockEntry}'
entity StockEntry : cuid, managed {
    @title: '{i18n>StockEntry-type}'
    @mandatory
    type       : String enum { Entrada; Saída; };

    @title: '{i18n>StockEntry-quantity}'
    @mandatory
    quantity   : Integer;

    @title: '{i18n>StockEntry-date}'
    date       : DateTime;

    @mandatory
    product    : Association to Product;
}

@label: '{i18n>Supplier}'
entity Supplier : cuid, managed {
    @title: '{i18n>Supplier-name}'
    @mandatory
    name     : String;

    @title: '{i18n>Supplier-contact}'
    @mandatory
    contact  : String;
}