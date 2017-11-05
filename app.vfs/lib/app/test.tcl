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

    put {
	<wc-panel id="my-panel-1" collapsible="true" height="250px" class="uxcoe">
	<wc-panel-header>My Panel Header</wc-panel-header>
	<wc-panel-body>
	<h5>Panel content goes here</h5>
	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
	tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
	At vero eos et accusam et justo duo dolores et ea rebum.
	Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
	Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
	sed diam nonumy eirmod tempor 
	</wc-panel-body>
	<wc-panel-footer>My Panel Footer</wc-panel-footer>
	</wc-panel>
    }
}
