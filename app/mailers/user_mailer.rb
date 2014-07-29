class UserMailer < ActionMailer::Base
  #default  from: "from@example.com"
 def visit_created(mail, location)
 	mail( to: mail,
 	subject: "New visit created in Location #{location.name}"
 )
 end
end
