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

namespace eval files {
}


include "/inc/files.css"
include "/inc/files.js"

######################################################
##### 
######################################################
m::proc -public files::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "files"
}

######################################################
##### 
######################################################
m::proc -public files::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our files page"
}

######################################################
##### 
######################################################
m::proc -public files::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "files"
}

######################################################
##### 
######################################################
m::proc -public files::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public files::init {
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
m::proc -public files::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division id="${_id}" {
	division class="container" {
	    division class="row" {
		division class="col-md-3" {
		    bullet_list class="list-group" {
			for {set i 0} {$i < 18} {incr i} {
			    if {$i == 3} {
				set state "active"
			    } else {
				set state ""
			    }

			    put [url "[lorem 3]" "#" class="list-group-item $state"]
			}
		    }

		}
		division class="col-md-8" {
		    put [file:read $::starkit::topdir/data/tmp/tabs.html]
		}
	    }
	}
    }
}

