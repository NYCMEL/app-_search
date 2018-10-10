/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2018-10-10 16:02:59 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var search = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.init = function(options) {
    console.group("search.init");

    $("#searcher").focus();

    let admin = $.cookie("admin");

    $("#show-ip").on("click", function() {
	$.cookie("qip", $(this).is(":checked"));
	search.doit()
    });
    
    $("#show-tag").on("click", function() {
	$.cookie("qtag", $(this).is(":checked"));
	search.doit()
    });
    
    $("#show-date").on("click", function() {
	$.cookie("qts", $(this).is(":checked"));
	search.doit()
    });

    $("#my").on("click", function() {
	if ($("#my").is(":checked")) {
	    $('#searcher, #do-search').val("").prop("disabled","disabled");
	    $(".result").load("/mtk/render?ajax=1&callback=search::cb&my=1");
	} else {
	    $('#searcher, #do-search').prop("disabled","");
	    $(".result").load("/mtk/render?ajax=1&callback=search::help");
	}
    });

    $("#searcher-type a").on("click", function() {
	let obj = $(this);
	let eid = obj.attr("id");

	$("#searcher-type a").removeClass("selected");

	obj.addClass("selected");
    });
    
    $("#do-search").on("click", function() {
	let val = $("#searcher").val().trim();
	$(".result").load("/mtk/render?ajax=1&callback=search::cb&tags=" + escape(val));
    });

    $("#searcher").keyup((e) => {
	let val = $("#searcher").val().trim();

	// CLEAR RESULTS 
	if (val == "") {
	    $(".result").load("/mtk/render?ajax=1&callback=search::help");
	}

	if ($("#searcher").is(":focus") && (e.keyCode == 13)) {
	    search.doit()
	}
    });

    $("#add-new-bookmark").unbind().on("click", function() {
	$("#url, #des, #tag").val("");
	$('.add').slideToggle();
    });

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.doit = function(key) {
    console.group("search.doit");

    let val = $("#searcher").val().trim();
    $(".result").load("/mtk/render?ajax=1&callback=search::cb&tags=" + escape(val));

    console.groupEnd();
}

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.admin = function(key) {
    console.group("search.admin");

    let admin = $.cookie("admin");

    if ((admin == undefined) || (admin == 0)) {
	$.cookie("admin",1);
    } else {
	$.cookie("admin",0);
    }

    document.location.reload();

    console.groupEnd();
}

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.add = function(options) {
    console.group("search.add");

    let edi = $("[name=editing]").val()
    let url = $("#url").val()
    let des = $("#des").val()
    let tag = $("#tag").val()

    if (url == "" || des == "" || tag == "") {
	alert("ALL FIELDS ARE REQUIRED")
	return false;
    }

    $(".tk-dummy").load("/mtk/render?ajax=1&callback=search::add&url=" + escape(url) + "&des=" + escape(des) + "&tag=" + escape(tag) + "&edi=" + edi);
    
    $(".add").slideToggle();

    $("#searcher").focus();

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.delete = function(id) {
    console.group("search.delete:", id);

    $("#row-" + id).remove()

    $(".tk-dummy").load("/mtk/render?ajax=1&callback=search::del&id=" + id);

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.edit = function(id,url,des,tag) {
    console.group("search.edit:", id, url, des, tag);

    // set the edit flag
    $("[name=editing]").val(id);

    // SET VALUES ON THE FORM
    $("#url").val(url);
    $("#des").val(des);
    $("#tag").val(tag);

    // OPEN ADD CONTAINER
    $(".add").show();

    console.groupEnd();
};

