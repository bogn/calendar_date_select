= CalendarDateSelect

http://code.google.com/p/calendardateselect/

== Examples

"See a demo here":http://electronicholas.com/calendar

== Installation
* script/plugin install git@github.com:stereosupersonic/calendar_date_select.git
* if you're using jrails or you have jquery in the javascript dir it should work out of the box
* otherwise copy calendar_date_select.jquery.js from the plugin's dir to /public/javascripts/calendar_date_select/

== Configuration

=== inlclude 
* add this to the header section 		<%= calendar_date_select_includes %>

=== enviroment.rb

* CalendarDateSelect.format = :german
== how to use
 * <%= calendar_date_select_tag "start_date", "", :time => false, :popup => :force %>
 or
 * <%= calendar_date_select :start_date", :time => false, :popup => :force %>

== Submitting patches


Please take care to do the following:

* Clean up your patch (don't send a patch bomb with a hundred features in one)
* Write test cases!
* As a general rule of thumb, think of ways to make things more general purpose than specific. 

