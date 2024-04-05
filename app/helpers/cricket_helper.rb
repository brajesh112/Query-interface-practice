module CricketHelper
	def error_method (object,error_field)
    if object.errors.any?
   		object.errors.messages[error_field].join("")
 		 end
  end 

  def addresses_method(object)
			str=""
			 i= 1
				@cricketer.addresses.each do|address|
				str += "<tr><td> <b>Address</b>  #{i}:</td><td>
				   				 <b>House No:</b> #{address.house },
				   				 <b>Street:</b> #{address.street },
				   				 <b>Landmark:</b> #{address.landmark},
				   		     <b>City:</b> #{address.city} ,
				   				 <b>State:</b> #{address.state},
				   				 <b> Pincode:</b> #{address.pincode},
				   				 <b> Country:</b> #{address.country} 
				</td></tr>"
				i+=1 
			end 
			str
  end
end