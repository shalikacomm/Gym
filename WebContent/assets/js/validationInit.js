function formValidation() {
    "use strict";
  
   

    $('#productForm').validate({
        rules: {/*
             this is product form validation */         
            desc: "required",
            p_price: {
            	required: true,
            	number:true,
            	min:1,
            	
            },
            s_price: {
            	required: true,
            	number:true,
            	min:1,
            	
            },
            r_level: {
                required: true,
                min:1,
                digits: true
            },
            unit_id: {
                required: true,
               
            },
            confirm_password2: {
                required: true,
                minlength: 5,
                equalTo: "#password2"
            },
            agree2: "required",
            digits: {
                required: true,
                digits: true
            },
            range: {
                required: true,
                range: [5, 16]
            }
        },
        messages: {
        	desc:"Please fill this field",
        	p_price:{
        		min:"Please add value greater than 0"
        	}
        },
        errorClass: 'help-block',
        errorElement: 'span',
        highlight: function (element, errorClass, validClass) {
            $(element).parents('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents('.form-group').removeClass('has-error').addClass('has-success');
        }
    });
    /*----------- END validate CODE -------------------------*/

    $('#userForm').validate({
        rules: {/*
             this is product form validation */         
            desc: "required",
            first_name: {
            	required: true,
            	number:false,
            	
            	
            },
            last_name: {
            	required: true,
          
            },
            email: {
                required: true,
               email:true
            },
            nic: {
                required: true,
               
            },
            mobile_number: {
                required: true,
               number:true,
               maxlength:10
            },
            nic: {
                required: true,
               maxlength:10
            },
            address: {
                required: true,
               
            }, 
            role: {
                required: true,
               
            },
            dob: {
                required: true,
               
            },
            confirm_password2: {
                required: true,
                minlength: 5,
                equalTo: "#password2"
            },
            agree2: "required",
            digits: {
                required: true,
                digits: true
            },
            range: {
                required: true,
                range: [5, 16]
            }
        },
        messages: {
        	//desc:"Please fill this field",
        	first_name:{
        		// min:"Please add value greater than 0",
        		desc:"Please fill this field"
        	}
        
        
        },
        errorClass: 'help-block',
        errorElement: 'span',
        highlight: function (element, errorClass, validClass) {
            $(element).parents('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents('.form-group').removeClass('has-error').addClass('has-success');
        }
    });
}