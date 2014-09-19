$( document ).ready(function() {
	$("#searchForm").submit(function(event) {
          /* stop form from submitting normally */
          event.preventDefault();
          $('.response').hide();

          localStorage.clear();
          localStorage.setItem("name", $("#name")[0].value);
  				var promise = jQuery.ajax(
  				{
  					url: "/api/am_i_a_fraud",
  					data: {name: $("#name")[0].value, city: $("#city")[0].value, state: $("#state")[0].value}
  				});

          promise.success(
	          function(data) {  
	          	console.log(data);                    
	          	$('#default').hide();
	          	$('#input_box').hide();
	          	$('#response_text').empty();
	          	var response_text = document.createElement('h3');
	            if ('found' == data.status) {
	              $('#found').show();
	              $('#response_text').append('<h3>Good news!</h3><h3>This is a valid vendor, pay away!</h3>');
	            }
	            else if ('not_found' == data.status) {
	              	$('#not_found').show();
	              	$('#response_text').append("<h3>Hmmm... We couldn't find them in the system.</h3><h3>Double check with someone before paying then!</h3>");
	            }
	            else if ('non_compliant' == data.status) {
	              	$('#non_compliant').show();
	              	$('#response_text').append("<h3>This vendor is non-compliant!</h3><h3>Don't pay them</h3>");
	            	}
	            $('#summary').show();
	           }
          )
        });
});

function go_back() {
	$('#summary').hide();
	$('#input_box').show();
	$('#default').show();
	$('.response').hide();
	var form = document.getElementById("searchForm");
	form.reset()
}