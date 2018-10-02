###HEADS###################################################################
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

if {[info exist searchtype] == 0} {
    set searchtype "links"
}

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
    
    division id="${_id}" class="clearfix" {
	division id="search-header" {
	    division class="container" {
		division class="row" {
		    division class="col-md-12" {
			division [style position relative] {
			    text search= id="searcher" placeholder="ENTER TAGS ..." class="form-control input-lg p-3"

			    division class="col-md-12 add border" [style display none background #ebebeb] {
				table id="add-table" class="table" {
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
						text url= class="form-control p-2" id="url"
					    }
					    table_data {
						text des= class="form-control p-2" id="des"
					    }
					    table_data {
						text tag= class="form-control p-2" id="tag"
					    }
					}
				    }
				}

				division {
				    division class="m-2 mb-4" {
					export editing=false
					button "SUBMIT" class="btn btn-lg btn-outline-primary" onclick="search.add()" style="width:120px"
					space 10 0
					put [url "Cancel" "#" class="btn btn-lg btn-outline-secondary" onclick="jQuery('.add, #add-new').slideToggle()" style="width:120px"]
				    }
				}
			    }
			}
		    }
		}
	    }
	}

	division class="container" {
	    division class="row" {
		division class="col-md-12 result" {
		}
	    }
	}
	
	javascript {
	    put {
		search.init();
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
    
    h1 >>>$::edi
    h1 >>>$::url
    h1 >>>$::des
    h1 >>>$::tag

    if {$::edi == "false"} {
	set res [tk::db::sqlite::query "insert into search (url,description,tag) values ('$::url','$::des','$::tag')"]
    } else {
	set res [tk::db::sqlite::query "UPDATE search SET url='$::url', description='$::des', tag='$::tag' WHERE id=$::edi"]
    }

    h1 >>>>>>>>$res<<<
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
    
    if {$::tags == "*"} {
	tk::db::sqlite::query:v -variable result "select * from search"
    } else {
	set term ""
	foreach i $::tags {append term "tag like '%$i%' AND "}
	set term [string range $term 0 end-4]
	
	tk::db::sqlite::query:v -variable result "select * from search where ($term)"
    }
    
    set cnt 0

    if {$result(*) == 0} {
	button "New Bookmark" class="btn btn-lg btn-outline-success" onclick="jQuery('.add, #add-new').slideToggle()" id="add-new"
	exit
    }

    table id="search-table" class="table table-striped" {
	table_head {
	    table_row {
		table_th {
		    put "#"
		}
 		table_th {
		    put ""
		}
 		table_th {
		    put ""
		}
		table_th {
		    put "DESCRIPTION"
		}
		table_th {
		    put "URL"
		}
	    }
	}

	table_body {
	    for {set r 0} {$r < [lindex $result(*) 0]} {incr r} {
		table_row id="row-$result($r,id)" {
		    table_data {
			put [incr cnt]
		    }
		    table_data {
			put [url "<i class='fa fa-trash'></i>" "#" onclick="search.delete('$result($r,id)')"]
		    }
		    table_data {
			put [url "<i class='fa fa-edit'></i>" "#" onclick="search.edit('$result($r,id)','$result($r,url)','$result($r,description)','$result($r,tag)')"]
		    }
		    table_data {
			put $result($r,description);
		    }
		    table_data [style max-width 400px] {
			division {
			    put [url $result($r,url) $result($r,url) target=_blank]
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
m::proc -public search::del {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    h1 >>>>>>>>>$::id

    tk::db::sqlite::query "delete from search where id=$::id"
}
