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
	include "/tk/lib/components/w3c//ext/fa/css/font-awesome.min.css"

	if {0} {
	    include "/tk/lib/components/w3c/scss/wc.common.css"
	    include "/tk/lib/components/w3c/scss/wc.form.min.css"
	} else {
	    include "/tk/lib/components/w3c/dist/wc.base.min.css"
	    include "/tk/lib/components/w3c/dist/wc.form.css"
	}

	include "/inc/app.css"

	# USED FROM W3C JS FOLDER
	include "/tk/jquery/scripts/jquery-2.1.4.min.js"
	
	# REQUIRED BY MTK
	include "/GitHub/jquery-cookie/src/jquery.cookie.js"
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

    # IN main.tcl
    if {$::environment == "prod"} {;
	include "/tk/lib/components/w3c/dist/wc.base.min.js"
	include "/tk/lib/components/w3c/dist/wc.form.min.js"
    } else {
	include "/tk/lib/components/w3c/js/wc.common.min.js"
	include "/tk/lib/components/w3c/js/wc.components.js"
	include "/tk/lib/components/w3c/js/wc.form.min.js"
    }

    include "/inc/app.js"
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
