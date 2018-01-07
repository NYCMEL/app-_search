var app = {};

/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2018-01-07 09:28:37 (melify)>
/////////////////////////////////////////////////////////////////////////////////
app.init = function() {
    console.group("app.init");
    
    console.group("app.init");
    
    $('body').attr('id','wc');

    wcSubscribe("wc-header", function(e) {
	let id = e.detail.id;

	console.info("app.js 'wc-header' subscription was triggered:", JSON.stringify(e.detail));
	
	$(".apage").hide(0, function() {
	    $("wc-header li a").removeClass("active");

	    $("#page-" + id).show(0);

	    $("#" + id).addClass("active");
	});
    });

    wcSubscribe("wc-footer", function(e) {
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
