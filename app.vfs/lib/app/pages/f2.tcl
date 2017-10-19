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

namespace eval f2 {}

#include "/inc/f2.css"
#include "/inc/f2.js"

######################################################
##### 
######################################################
m::proc -public f2::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "f2"
}

######################################################
##### 
######################################################
m::proc -public f2::narrative {
} {
    Documentation goes here...
} {
    Trace

    put "this is our f2 page"
}

######################################################
##### 
######################################################
m::proc -public f2::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "f2"
}

######################################################
##### 
######################################################
m::proc -public f2::template {
} {
    Documentation goes here...
} {
    Trace

    return "template::0"
}

######################################################
##### 
######################################################
m::proc -public f2::init {
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
m::proc -public f2::guts {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    division id="${_id}" {
	division class="page-header" {
	    h1 "[namespace current] <small>sub text goes here</small>"
	}

	tk::dummy::2
    }
}

