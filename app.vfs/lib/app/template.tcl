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
    
    put [subst [file:read "/Melify/mtk/dev/app/wcw/app.vfs/data/navbar.public.html"]]
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
	division class="row" {
	    division class="col-md-12" {
		put "$::company footer"
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
