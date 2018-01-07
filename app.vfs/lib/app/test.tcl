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

    division id="wc" {
	tk::test:procs
    }
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
    division class="container" id="wc" {
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

######################################################
##### 
######################################################
m::proc -public test::login {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    br
    division class="container" id="wc" [style margin 100px] {
	division class="row" {
	    division class="col-md-4" {
		tag wc-form name="form-1" role="form" id="form-1" method="POST" action="/mtk/render" size="input-md" {
		    tag wc-text name="v(email)" id="email" label="Email" placeholder="your email..." columns="4,8" data-key="email" required pattern="email" data-error="like: mel@melify.com" {}
		    tag wc-text name="v(paswd)" id="paswd" label="Password" placeholder="your paswd..." columns="4,8" data-key="paswd" required type="password" {}
		    
		    hr
		    division class="form-group" {
			division class="col-md-4" {
			}
			division class="col-md-8" {
			    submit_button action=Login class="btn btn-primary"
			}
		    }
		}
	    }
	    division class="col-md-8" {
		tk::dummy::3
	    }
	}
    }
}
