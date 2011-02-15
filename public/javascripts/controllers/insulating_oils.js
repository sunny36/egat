InsulatingOil = {};

InsulatingOil.setDefaultValues = function () {
	// TODO Get the value 10 from the server
	$("#insulating_oil_test_kv_maintank").val("10");
	$("#insulating_oil_test_kv_oltc").val("10");
};

$(function() {
	InsulatingOil.setDefaultValues();
});