sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project3/test/integration/pages/StockEntriesList",
	"project3/test/integration/pages/StockEntriesObjectPage"
], function (JourneyRunner, StockEntriesList, StockEntriesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project3') + '/test/flpSandbox.html#project3-tile',
        pages: {
			onTheStockEntriesList: StockEntriesList,
			onTheStockEntriesObjectPage: StockEntriesObjectPage
        },
        async: true
    });

    return runner;
});

