namespace eco;
using { cuid, managed } from '@sap/cds/common';

@label: '{i18n>Product}'
entity Product : cuid, managed {
    @title: '{i18n>Product-name}'
    name          : String;

    @title: '{i18n>Product-category}'
    category      : String;

    @title: '{i18n>Product-currentStock}'
    currentStock  : Integer;

    @title: '{i18n>Product-minStock}'
    minStock      : Integer;
}

@label: '{i18n>StockEntry}'
entity StockEntry : cuid, managed {
    @title: '{i18n>StockEntry-type}'
    type       : String enum { Entrada; Saída; };

    @title: '{i18n>StockEntry-quantity}'
    quantity   : Integer;

    @title: '{i18n>StockEntry-date}'
    date       : DateTime;

    product    : Association to Product;
}

@label: '{i18n>Supplier}'
entity Supplier : cuid, managed {
    @title: '{i18n>Supplier-name}'
    name     : String;

    @title: '{i18n>Supplier-contact}'
    contact  : String;
}