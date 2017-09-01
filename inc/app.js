var app = {};

/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-09-01 14:38:48 (melify)>
/////////////////////////////////////////////////////////////////////////////////
app.init = function() {
    console.group("app.init");
    
    console.group("app.init");
    
    $('body').attr('id','wc');

    wc.subscribe("wc-header", function(e) {
	console.info("app.js 'wc-header' subscription was triggered:", JSON.stringify(e.detail));
	
	$(".apage").hide(0, function() {
	    $("#page-" + e.detail.id).show(0);
	});
    });

    wc.subscribe("wc-footer", function(e) {
	console.info("app.js 'wc-footer' subscription was triggered:", JSON.stringify(e.detail));
    });

    //$(".container").removeClass("container").addClass("container-fluid");

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
    app.init();
});
