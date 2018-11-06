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

namespace eval template {
    namespace eval 1 {}
}

division class="tk-dummy" [style display none] {}

######################################################
##### 
######################################################
m::proc -public template::1::header {
} {
    Documentation goes here...
} {
    Trace
    
    set size [tk::db::sqlite::query "select count(*) from search"]

    set url "/mtk/render?page=sqlite::db::viewer&db=/Melify/mtk/dev/app/_search/db/sqlite.db"
    division [style position fixed top 0 left 0 width 25px height 25px] class="bg-light" onclick="document.location.href='$url'" {
    }

    division [style position fixed top 0 right 0 width 25px height 25px] class="bg-light" onclick="search.admin()" {
    }
    
    division class="container$::fluid pt-3" {
	division class="row" {
	    division class="col-md-6 mt-2 amplitude-regular" [style font-size 36px color #BCAAA4] {
		puts "Melify <small class=amplitude-light>- Bookmark Vault</small> <sub style=font-size:12px>$size</sub>"
	    }

	    division class="col-md-6 mt-2 hidden-sm-down d-none d-sm-block" [style font-size 36px color #BCAAA4] {
		put [url "<i class='fa fa-bug'></i> GOT BUGS ?" "mailto:mel.heravi@gmail.com?subject=FIX+THIS+BUG" class="btn btn-info btn-lg float-right"]
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public template::1::footer {
} {
    Documentation goes here...
} {
    Trace
    
    division class="container$::fluid" {
	# division class="row" {
	#     division class="col-md-12 mb-3" {
	# 	put [img /tk/img/common/divider-shadow-2.png width=100% height=30]
	#     }
	# }
	
	division class="row" {
	    division class="col-md-6 mb-5" {
		put "$::company 2018 &copy; Mel"
	    }
	    division class="col-md-6 hidden-xs-down d-none d-sm-block" {
		division class="pull-right" {
		    put "<i class='fa fa-envelope'></i> <a href='mailto:mel.heravi@gmail.com'>Mel M. Heravi +1 646.303.1234</a>"
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public template::0 {
} {
    Documentation goes here...
} {
    Trace

    tk::comment "template::0" {
	division id="wc" {
	    uplevel guts
	}
    }
}

######################################################
##### 
######################################################
m::proc -public template::1 {
} {
    Documentation goes here...
} {
    Trace
    
    tk::comment "template::1" {
	division id="wc" {
	    division class="template" id="template" {
		division class="template-header" id="template-header" {
		    template::1::header
		}

		division class="template-guts" id="template-guts" {
		    uplevel guts
		}

		division class="template-footer" id="template-footer" {
		    template::1::footer
		}
	    }
	}
    }
}
