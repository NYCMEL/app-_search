/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2018-10-01 19:52:13 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var search = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
search.init = function(options) {
    console.group("search.init");

    $("#searcher").focus();

    $("#searcher-type a").on("click", function() {
	let obj = $(this);
	let eid = obj.attr("id");

	$("#searcher-type a").removeClass("selected");

	obj.addClass("selected");
    });

    $(document).keyup(function (e) {
	if ($("#searcher").is(":focus") && (e.keyCode == 13)) {
	    let val = $("#searcher").val().trim();

	    if (val != "") {
		$(".result").load("/mtk/render?ajax=1&callback=search::cb&tags=" + escape(val), function() {
		    $(".add").hide();
		})
	    }
	}
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

