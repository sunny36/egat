# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Egat::Application.initialize!
# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
#   if html_tag =~ /<label/
#     t = html_tag.split('</')
#     %(#{t[0]}<small>**</small></#{t[1]})
#   else
#     html_tag
#   end
# end
