sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project2/test/integration/pages/SuppliersList",
	"project2/test/integration/pages/SuppliersObjectPage"
], function (JourneyRunner, SuppliersList, SuppliersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project2') + '/test/flpSandbox.html#project2-tile',
        pages: {
			onTheSuppliersList: SuppliersList,
			onTheSuppliersObjectPage: SuppliersObjectPage
        },
        async: true
    });

    return runner;
});

