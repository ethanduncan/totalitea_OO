(function($){
	var inputError = {
		// html markup for error message box
		tipMarkUp: '<span class="tip"></span>',

		// Error message for validation
		errorMessage: {
			required: 'Please fill the required fields',
			emailNotMatch: 'Emails do not match',
			passwordNotMatch: 'Passwords do not match',
			invalidEmail: 'Invalid Email',
		},
	};

	$.fn.extend({
		/** Function to validate email address */
		validateEmail: function(){
			var el = $(this);
			var isValid = false;
			
			// regular expression for email address
			var pattern = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
			var regex = new RegExp(pattern);
			
			var email = el.val();
			
			el.next('.tip').remove();	// remove error box for reset the error message
			// check if the email matches the regex
			if(regex.test(email)){
				isValid = true;				
			} else {
				var tip = $(inputError.tipMarkUp);	// create error box
				if(email == '')				// set the message for empty email input
					tip.text(inputError.errorMessage.required);
				else	 					// set the message for invalid email
					tip.text(inputError.errorMessage.invalidEmail);
				tip.insertAfter(el);
				isValid = false;
			}	
			el.toggleClass('invalid', !isValid);	// highlight the input if email is invalid
			return isValid;
		},
		
		/** Function to check empty input fields */
		checkEmptyInput: function(){
			var el = $(this);
			var isValid = false;
			
			el.next('.tip').remove();	// remove error box for reset the error message
			if($.trim(el.val()).length == 0){
				var tip = $(inputError.tipMarkUp);	// create error box
				tip.text(inputError.errorMessage.required); // set the message for empty input
				tip.insertAfter(el);
				isValid = false;
			} else {
				isValid = true;
			}

			el.toggleClass('invalid', !isValid);	// highlight the input if input is empty
			return isValid;
		},
		
		/** Function to identify values */
		identifyValues: function(options){
			var defaults ={
				password: false,
				email: false,
			};
			
			var options = $.extend(defaults, options);
			
			var input = [];
			var isIdentified = false;	// default as false 
			
			this.each(function(index, obj){
				// Add elements & elements' values to array
				input[index] = {
					'element': $(this),
					'value': $(this).val(),
				};
			});

			if(options.email){
				if(input[0]['element'].validateEmail() && input[1]['element'].validateEmail()){
					input[0]['element'].next('.tip').remove();	// remove 1st error box for reset the error message
					input[1]['element'].next('.tip').remove();	// remove 2nd error box for reset the error message
					var tipBox = '';							// define the tip box
					
					if(input[0]['value'] !== input[1]['value']){
						tipBox = $(inputError.tipMarkUp);		// set the error message if two values aren't identified
						tipBox.text(inputError.errorMessage.emailNotMatch);
					} else {
						isIdentified = true;
					}
					
					input[0]['element'].toggleClass('invalid', !isIdentified).after(tipBox);
					input[1]['element'].toggleClass('invalid', !isIdentified).after(tipBox);
				}
			} else if(options.password){
				if(input[0]['element'].checkEmptyInput() && input[1]['element'].checkEmptyInput()){
					input[0]['element'].next('.tip').remove();	// remove 1st error box for reset the error message
					input[1]['element'].next('.tip').remove();	// remove 2nd error box for reset the error message
					var tipBox = ''								// define the tip box
					
					if(input[0]['value'] !== input[1]['value']){
						tipBox = $(inputError.tipMarkUp);		// set the error message if two values aren't identified
						tipBox.text(inputError.errorMessage.passwordNotMatch);
					} else {
						isIdentified = true;
					}
					
					input[0]['element'].toggleClass('invalid', !isIdentified).after(tipBox);
					input[1]['element'].toggleClass('invalid', !isIdentified).after(tipBox);
				}
			}
			
			return isIdentified;
		},
		
		/** Function to reset validation result*/
		resetForm: function(){
			var el = $(this);
			el.find('.tip').remove();		// clear all error message box
			el.find('.invalid').removeClass('invalid');	// clear all highlights
		},
		
	});
})(jQuery);

$(document).ready(function(){
	
	// Login form with live validation
	$('#form-login').each(function(){
		$('#login-username, #login-password').each(function(){
			$(this).keyup(function(){
				$(this).checkEmptyInput();
			}).blur(function(){
				$(this).checkEmptyInput();			
			});
		});
	});
	
});