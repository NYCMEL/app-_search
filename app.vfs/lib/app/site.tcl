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

    return "userid qip qts qtag admin"
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
	put {
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link  rel="stylesheet" href="/inc/app.css">

	    <script>
	    wcENV="dev";
	    wcAPP="tk-search";
	    wcURL="http://localhost:1234";
	    </script>

	    <link href="/GitHub/font-awesome/css/font-awesome.min.css" rel="stylesheet">

	    <script type="text/javascript" src="/tk/bundles/wc.bundle.gz.js"></script>
	    <script type="text/javascript" src="/inc/app.js"></script>
	    <script type="text/javascript" src="/tk/inc/common.js"></script>
	    <script type="text/javascript" src="/tk/inc/jquery.cookie.js"></script>
	}

	javascript {
	    put [subst {
		jQuery(document).ready(function() {
		    app.init({app:"$::APP", env:"$::ENV", local:"$::tk(local)", clock:"$::tk(clock)"});
		});
	    }]
	}
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
