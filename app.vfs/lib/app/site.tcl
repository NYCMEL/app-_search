###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval Site {}

##################################################
##### 
##################################################
m::proc -private Site::doctype {
} {
    Documentaion goes here
} {
    Trace

    #GENERAL TITLE FOR OUR WEBSITE
    put "<!DOCTYPE HTML>\n"
}

##################################################
##### 
##################################################
m::proc -private Site::title {
} {
    Documentaion goes here
} {
    Trace

    #GENERAL TITLE FOR OUR WEBSITE
    return "$::company -"
}

##################################################
##### 
##################################################
m::proc -private Site::cookies {
} {
    Documentaion goes here
} {
    Trace

    #NO COOKIES FOR TEMPLATE

    return "userid"
}

##################################################
##### 
##################################################
m::proc -private Site::head {
} {
    Documentaion goes here
} {
    Trace

    tk::comment "Site::head" {
<<<<<<< HEAD
	include "/tk/lib/components/w/dist/wc.bundle.css"
	include "/tk/lib/components/w/dist/wc.bundle.js"
	include "/tk/jquery/scripts/jquery.min.js"

	include "/inc/app.js"
=======
	tk::include::viewport

	include "/tk/lib/components/w/dist/w3c.p.min.css"
	include "/inc/app.css"
>>>>>>> 4e549281e365ece2e37d554a77495c5e6c38e96e
    }
}

##################################################
##### 
##################################################
m::proc -private Site::body {
} {
    Documentaion goes here
} {
    Trace

    if {$::userid == ""} {
	set ::access "public"
    } else {
	set ::access "private"
    }

    tk::comment "Site::body" {
	if {[catch {
	    if {[info exist ::callback] == 0} {
		${::page}::init
	    } else {
		$::callback
	    }
	} e] != 0} {
	    tk::error "$e"
	}
    }
<<<<<<< HEAD
=======

    include "/tk/lib/components/w/dist/w3c.p.min.js"
    include "/inc/app.js"
>>>>>>> 4e549281e365ece2e37d554a77495c5e6c38e96e
}

##################################################
##### 
##################################################
m::proc -private Site::init {
} {
    Documentaion goes here
} {
    Trace

    #LETS START OUR APPLICATION
    tk::site::setup\
	-page		Home\
	-admin		MelifyIT@gmail.com
}
