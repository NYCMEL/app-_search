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

namespace eval test {}

######################################################
##### 
######################################################
m::proc -public test::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "test"
}

######################################################
##### 
######################################################
m::proc -public test::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a test page"
}

######################################################
##### 
######################################################
m::proc -public test::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Test"
}

######################################################
##### 
######################################################
m::proc -public test::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    tk::test:procs
}

######################################################
##### 
######################################################
m::proc -public test::panel {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    br
    division class="container" {
	division class="row" {
	    division class="col-md-6" {
		set hstr {
		    <wc-panel id="$v(id)" collapsible="$v(collapsible)" height="$v(height)" class="uxcoe">
		    <wc-panel-header>$v(header)</wc-panel-header>
		    <wc-panel-body>
		    <h5>$v(pheader)</h5>
		    $v(body)
		    </wc-panel-body>
		    <wc-panel-footer>$v(footer)</wc-panel-footer>
		    </wc-panel>
		}

		array set v [subst {
		    id		"panel-1"
		    collapsible	"true"
		    height	"200px"
		    header	"Panel Title Goes here..."
		    pheader	"body header"
		    body	"[lorem 50]"
		    footer	"Mel was here too..."
		}]

		put [subst $hstr]
	    }
	}
    }
}
