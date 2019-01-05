##HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

namespace eval search {}

include "/inc/search.css"
include "/inc/search.js"

if {[info exist my]      == 0} {set       my 0}
if {[info exist find]    == 0} {set    find ""}
if {[info exist private] == 0} {set private ""}

######################################################
##### 
######################################################
m::proc -public search::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "search"
}

######################################################
##### 
######################################################
m::proc -public search::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a search page"
}

######################################################
##### 
######################################################
m::proc -public search::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Search"
}

######################################################
##### 
######################################################
m::proc -public search::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public search::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [[namespace current]::id]
    
    [template]
}

######################################################
##### 
######################################################
m::proc -public search::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division id="${_id}" {
	division id="search-header" {
	    division class="container" {
		division class="row" {
		    division class="col-md-12" {
			top
		    }
		}
		
		division class="row" {
		    division class="col-md-12 add" [style display none margin-top -33px] {
			add
		    }
		}
	    }
	}

	division class="container" {
	    division class="row" {
		division class="col-md-12 result" {
		    search::help
		}
	    }
	}

	if {$::find != ""} {
	    javascript {
		put [subst {
		    jQuery("#searcher").val("$::find");

		    search.doit();
		}]
	    }
	}


	javascript {
	    put {
		jQuery(document).ready(function() {
		    search.init();
		});
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public search::help {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division class="alert alert-warning hidden-sm-down d-none d-sm-block shadow" {
	put "<span class='amplitude-regular'>YOU CAN ENTER PARTIAL STRINGS IN ANY ORDER :</span>"
	
	division class="container" {
	    division class="row" {
		division class="col-md-6" {
		    bullet_list class="mt-2" {
			li "goog fin"
			li "mel port"
			li "jav sc def"
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public search::adddb {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    foreach i {url des tag} {
	regsub -all "'" [set ::$i] "''" ::$i
    }

    # IF TAGS ARE EMPTY USE DESCRIPTION
    if {[string trim $::tag] == ""} {
	set ::tag $::des
    }

    if {$::edi == "false"} {
	set cnt [tk::db::sqlite::query "SELECT count(*) FROM search where url='$::url'"]
	
	if {$cnt == 0} {
	    set res [tk::db::sqlite::query "INSERT INTO search (url,description,tag,ip,ts) VALUES ('$::url', '$::des', '$::tag', '$::env(REMOTE_ADDR)', '[clock seconds]')"]
	} else {
	    javascript {
		put [subst {
		    alert("A URL EXIST FOR THIS BOOKMARK $cnt");
		}]
	    }
	}
    } else {
	set res [tk::db::sqlite::query "UPDATE search SET url='$::url', description='$::des', tag='$::tag', ts='[clock seconds]' WHERE id=$::edi"]
    }
}

######################################################
##### 
######################################################
m::proc -public search::cb {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    switch $::my {
	"0" {
	    if {$::tags == ""} {
		javascript {
		    put {
			$(".result").load("/mtk/render?ajax=1&callback=search::help");
		    }
		}
		return
	    } elseif {$::tags == "*"} {
		tk::db::sqlite::query:v -variable result "select * from search"
	    } else {
		set term ""

		foreach i $::tags {
		    append term "(tag like '%$i%' OR description like '%$i%') AND "
		    #append term "tag like '%$i%' AND "
		}
		
		set term [string range $term 0 end-4]

		division class="clearfix" {
		    division class="pull-right" {
			put [url "&nbsp;&nbsp;" "#" class="btn" onclick="jQuery('#show-query').slideToggle()" [style height 30px width 30px]]
		    }
		}

		division [style display none] id="show-query" class="p-2" {
		    hr
		    put "select * from search where ($term)"
		}
		
		tk::db::sqlite::query:v -variable result "select * from search where ($term)"
	    }
	}
	"1" {
	    tk::db::sqlite::query:v -variable result "select * from search where ip='[string trim $::env(REMOTE_ADDR)]'"
	}
    }
    
    set cnt 0

    if {[lindex $result(*) 0] == 0} {
	division class="alert alert-danger" {
	    h3 class="pt-2" align="center" "No Boomarks found !"
	}
	exit
    }

    if {$::my == 0} {
	set style ""
    } else {
	set style [style border "2px red dashed"]
    }

    division class="table-responsive" {
	table id="search-table" class="table table-striped table-bordered" $style {
	    table_head {
		table_row {
		    table_th class="td-col-0" [style width 30px text-align right] {
			put "#"
		    }
		    table_th class="td-col-1" [style width 30px text-align center] {
			put ""
		    }
		    table_th class="td-col-2" [style width 30px text-align center] {
			put ""
		    }
		    table_th class="td-col-3" {
			put "DESCRIPTION"
		    }

		    if {$::qtag == "true"} {
			table_th class="td-col-4" {
			    put "TAGS"
			}
		    }

		    if {$::qip == "true"} {
			table_th class="td-col-5" [style text-align center] {
			    put "IP"
			}
		    }

		    if {$::qts == "true"} {
			table_th class="td-col-6" [style text-align center] {
			    put "DATE"
			}
		    }
		}
	    }

	    table_body {
		for {set r 0} {$r < [lindex $result(*) 0]} {incr r} {
		    table_row id="row-$result($r,id)" [style width 30px text-align right] {
			table_data class="td-col-0" {
			    put [incr cnt]
			}
			table_data class="td-col-1" [style width 30px text-align center] {
			    if {($::admin == 1) || ([string trim $::env(REMOTE_ADDR)] == [string trim $result($r,ip)])} {
				put [url "<i class='fa fa-trash'></i>" "#" bid="$result($r,id)"]
			    } else {
				put "<span style='color:#999' title='Not Your Bookmark'><i class='fa fa-trash'></i></span>"
			    }
			}
			table_data class="td-col-2" [style width 30px text-align center] {
			    if {($::admin == 1) || ([string trim $::env(REMOTE_ADDR)] == [string trim $result($r,ip)])} {
				put [url "<i class='fa fa-edit'></i>" "#" pid="$result($r,id)", url="$result($r,url)" desc="$result($r,description)" tag="$result($r,tag)"]
			    } else {
				put "<span style='color:#999' title='Not Your Bookmark'><i class='fa fa-edit'></i></span>"
			    }
			}
			table_data class="td-col-3" [style text-align left] {
			    put [url $result($r,description) $result($r,url) target=_blank]
			}

			if {$::qtag == "true"} {
			    table_data class="td-col-4 truncate" title="$result($r,tag)" [style text-align left] {
				put $result($r,tag)
			    }
			}

			if {$::qip == "true"} {
			    table_data class="td-col-5" [style text-align center] {
				put $result($r,ip)
			    }
			}

			if {$::qts == "true"} {
			    table_data class="td-col-6" [style text-align center] {
				put [clock format $result($r,ts)]
			    }
			}
		    }
		}
	    }
	}

	javascript {
	    put {
		jQuery(document).ready(function() {
		    $(".td-col-1 a").on("click", function() {
			search.delete($(this).attr("bid"))
		    });

		    $(".td-col-2 a").on("click", function() {
			search.edit($(this).attr("pid"),$(this).attr("url"),$(this).attr("desc"),$(this).attr("tag"))
		    });
		});
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public search::top {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    table width=100% {
	table_row {
	    table_data width=100% {
		text search= id="searcher" placeholder="I am looking for ..." class="form-control input-lg p-3" [style height 70px] 
	    }
	    table_data [style max-width 150px] {
		button "<i class='fa fa-search fa-lg'></i>" class="btn btn-lg btn-outline-secondary" [style padding 18px width 80px height 70px] id="do-search"
	    }

	    table_data class="hidden-sm-down d-none d-sm-block" {
		button "<i class='fa fa-plus-circle fa-lg'></i>" id="add-new-bookmark" class="btn btn-lg btn-outline-success" [style padding 18px width 100% height 70px width 80px]
	    }
	}

	table_row  {
	    table_data colspan="4" {
		division class="clearfix hidden-sm-down d-none d-sm-block" {
		    division class="pull-left" {
			division class="pull-left mr-1" {
			    checkbox cb= id="my" 
			}
			division class="pull-left mr-4" {
			    label for="my" class="ml-1" [style margin-top 2px] "My Bookmarks"
			}

			division class="pull-left mr-1" {
			    checkbox cb= id="private" 
			}
			division class="pull-left mr-4" {
			    label for="private" class="ml-1" [style margin-top 2px] "Private to me"
			}
		    }

		    division class="pull-right" {
			division class="pull-left mr-1" {
			    if {$::qtag == "true"} {
				set state "checked"
			    } else {
				set state ""
			    }
			    checkbox cb= id="show-tag" $state
			}
			division class="pull-left mr-3" {
			    label for="show-tag" class="ml-1" [style margin-top 2px] "Show Tags"
			}

			division class="pull-left mr-1" {
			    if {$::qip == "true"} {
				set state "checked"
			    } else {
				set state ""
			    }
			    checkbox cb= id="show-ip" $state
			}
			division class="pull-left mr-3" {
			    label for="show-ip" class="ml-1" [style margin-top 2px] "Show User IP"
			}

			division class="pull-left mr-1" {
			    if {$::qts == "true"} {
				set state "checked"
			    } else {
				set state ""
			    }
			    checkbox cb= id="show-date" $state
			}
			division class="pull-left" {
			    label for="show-date" class="ml-1" [style margin-top 2px] "Updated Date"
			}
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public search::add {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division class="alert alert-success shadow" {
	table id="add-table" width="100%" {
	    table_head {
		table_row {
		    table_th {
			label "URL"
		    }
		    table_th {
			label "DESCRIPTION"
		    }
		    table_th {
			label "TAGS"
		    }
		}
	    }

	    table_body {
		table_row {
		    table_data {
			text url= class="form-control" id="url" [style font-size 16px height 50px]
			put "<small>Enter bookmark URL</small>"
		    }
		    table_data {
			text des= class="form-control" id="des" [style font-size 16px height 50px]
			put "<small>Bookmark description</small>"
		    }
		    table_data {
			text tag= class="form-control truncate" id="tag" [style background #FFF height 50px font-size 16px]
			put "<small>Bookmarks are found from these tags</small>"
		    }
		}
	    }
	}

	division {
	    division class="mt-4 mb-2 clearfix" {
		export editing=false

		division class="pull-left" {
		    button "SUBMIT" class="btn btn-lg btn-outline-primary" onclick="search.add()" style="width:120px"
		    space 10 0
		    put [url "Cancel" "#" class="btn btn-lg btn-outline-secondary" onclick="jQuery('.add').slideToggle()" style="width:120px"]
		}
		division class="pull-right" {
		    division class="pull-left mr-1" {
			checkbox cb= id="is-private" 
		    }
		    division class="pull-left mr-4" {
			label for="is-private" class="ml-1 amplitude-regular" [style margin-top 2px] "Make it Private"
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public search::del {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    tk::db::sqlite::query "delete from search where id=$::id"
}
