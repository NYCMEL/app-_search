/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2018-10-09 18:53:15 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var search = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.init = function(options) {
    console.group("search.init");

    $("#searcher").focus();

    $("#show-ip").on("click", function() {
	$.cookie("ip", $(this).is(":checked"));
	console.log(">>>>>>>", $.cookie("ip"));
    });
    
    $("#show-date").on("click", function() {
	$.cookie("date", $(this).is(":checked"));
	console.log(">>>>>>>", $.cookie("date"));
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

    $("#searcher").keyup(function (e) {
	let val = $("#searcher").val().trim();

	// CLEAR RESULTS 
	if (val == "") {
	    $(".result").load("/mtk/render?ajax=1&callback=search::help");
	} else {
	    if ($("#searcher").is(":focus") && (e.keyCode == 13)) {
		$(".result").load("/mtk/render?ajax=1&callback=search::cb&tags=" + escape(val));
	    }
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

