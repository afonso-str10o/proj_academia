sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        onChangeStock: async function(oEvent) {
            const oContext = oEvent.getSource().getBindingContext();
            const productId = oContext.getProperty("ID");

            await fetch(`/catalog/changeStock`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ ID: productId, amount: 1 })
            });

            MessageToast.show("Stock changed!");
            this.getView().getModel().refresh();
        }
    };
});
