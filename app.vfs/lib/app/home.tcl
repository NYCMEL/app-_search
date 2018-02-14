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
		    put {
		<wc-form name="my-form" role="form" id="my-form" size="form-control-md" style="border:1px #CECECE solid;padding:20px">
		    <div class="row">
			<div class="col-md-6">
			    <wc-text name="v(uname)" id="uname-1" label="Full Name" placeholder="your name goes here..." columns="4,8"
				     value="Mel Heravi" data-key="uname1" required></wc-text>
			    <wc-text name="v(email)" id="email-1" label="Email" placeholder="your email here..." columns="4,8" type="email"
				     pattern="email" value="mel@melify.com" required></wc-text>
			    <wc-text name="v(phone)" id="phone-1" label="Phone" placeholder="Like: 212-555-5555"
				     data-key="phone1" pattern="phone" columns="4,8" help="Phone number is NOT required"
				     data-error="Format like 212-555-5555"></wc-text>

			    <wc-calendar id="my-calendar" name="adate" label="Date" columns="4,8" placeholder="mm/dd/yyyy"
					 help="date is a required field" data-error="must be a date format..." required>
			    </wc-calendar>
			    
			    <wc-groupbox id="groupbox-1" name="v(gbox)" label="Fav Fruit" columns="4,8" help="Please select one">
				<div class="pull-left">
				    <wc-radiobutton id="fruit-apple" name="v(fruit)" label="Apple"  value="1" required></wc-radiobutton>
				</div>
				<div class="pull-left">
				    <wc-radiobutton id="fruit-orange" name="v(fruit)" label="Orange" value="2"></wc-radiobutton>
				</div>
				<div class="pull-left">
				    <wc-radiobutton id="fruit-peach" name="v(fruit)" label="Peach"  value="3"></wc-radiobutton>
				</div>
			    </wc-groupbox>

			    <wc-groupbox id="groupbox-2" name="v(gbox2)" label="Agreements" columns="4,8" help="You must agree with Terms & Conditions">
				<div class="pull-left">
				    <wc-checkbox id="checkbox-1" name="v(agree)" label="I Agree" checked required></wc-checkbox>
				</div>
				<div class="pull-left">
				    <wc-checkbox id="checkbox-2" name="v(signup)" label="Subscribe me"></wc-checkbox>
				</div>
			    </wc-groupbox>
			</div>

			<div class="col-md-6">
			    <wc-select id="color-1" name="v(color)" data-key="color1" label="Fav Color" columns="4,8" help="Please pick a color" data-error="color is a required field" required searchable="true">
				<option value="">[Please Select]</option>
				<option value="1">1 = Red</option>
				<option value="2">2 = White</option>
				<option value="3">3 = Blue</option>
			    </wc-select>
			    
			    <wc-textarea id="textarea-1" label="Notes" columns="4,8" placeholder="Your notes ..."  help="Notes is NOT a required field"></wc-textarea>
			</div>
			
			<div class="col-md-12">
			    <hr>
			    <div class="form-group">
				<input type="submit" name="action" value="LET'S GO" class="btn btn-primary" id="submit-btn-1">
			    </div>
			</div>
		    </div>
		</wc-form>
		    }
		}
	    }
	}
    }
}
