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
m::proc -public test::comp {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    br
    division class="container" {
	division class="row" {
	    division class="col-md-6" {
		tag wc-panel id="my-panel-1" collapsible="true" height="250px" {
		    tag wc-panel-header {
			put "My Panel Header"
		    }
		    tag wc-panel-body {
			p [lorem 100]
		    }
		}
	    }
	    division class="col-md-6" {
		tag wc-accordion id="my-accordion" active="0" single="true" style="border:10px red solid" {
		    foreach i {1 2 3} {
			tag wc-panel id="my-panel-$i" collapsible="true" {
			    tag wc-panel-header {
				put "My Panel Header $i"
			    }
			    tag wc-panel-body {
				tk::dummy::3
			    }
			}
		    }
		}
	    }
	}
    }
}
