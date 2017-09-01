var app = {};

/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-09-01 14:21:25 (melify)>
/////////////////////////////////////////////////////////////////////////////////
app.init = function() {
    console.group("app.init");
    
    console.group("app.init");
    
    $('body').attr('id','wc');

    wc.subscribe("wc-header", function(e) {
	console.info("'wc-header' subscription was triggered:", JSON.stringify(e.detail));

	$(".apage").hide(0, function() {
	    $("#page-" + e.detail.id).show(0);
	});
    });

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
    app.init();
});
