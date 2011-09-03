# class QueryTrace < ActiveSupport::LogSubscriber
#   def sql(event)
#     return unless logger.debug?
# 
#     debug caller.
#       select {|stack| stack =~ /\/app\//}.
#         map {|stack| stack.gsub(/^.*app\//, '')}.
#           join("\n")
#   end
# 
#   def logger
#     ActiveRecord::Base.logger
#   end
# end
# 
# QueryTrace.attach_to :active_record
