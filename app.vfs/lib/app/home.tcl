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

namespace eval home {}

######################################################
##### 
######################################################
m::proc -public home::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "home"
}

######################################################
##### 
######################################################
m::proc -public home::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a home page"
}

######################################################
##### 
######################################################
m::proc -public home::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Home"
}

######################################################
##### 
######################################################
m::proc -public home::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::1"
}

######################################################
##### 
######################################################
m::proc -public home::init {
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
m::proc -public home::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division id="${_id}" {
	division class="container$::fluid" {
	    division class="row" {
		division class="col-md-6" {
		    division [style max-width 500px height 200px] class="shadow border border-info" {
			h1 class="text-center pt-5" "HELLO"
		    }
		}

		division class="col-md-6" {
		    division [style max-width 500px height 200px] class="shadow border border-info" {
			h1 class="text-center pt-5" "MEL"
		    }
		}
	    }

	    division class="row" {
		division class="col-md-12" {
		    br
		    tk::dummy::2
		}
	    }
	}
    }
}
