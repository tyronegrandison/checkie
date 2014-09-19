$( document ).ready(function() {
	$("#searchForm").submit(function(event) {
          /* stop form from submitting normally */
        event.preventDefault();
        $('.response').hide();

        var name = toTitleCase($("#name")[0].value);
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
	              var response_text = '<h3>Good news!</h3><h3><span style="color: #5A0000">' + name + '</span> is a valid vendor, pay away!</h3>'
	              $('#response_text').append(response_text);
	            }
	            else if ('not_found' == data.status) {
	              	$('#not_found').show();
	              	var response_text = "<h3>Hmmm... We couldn\'t find <span style='color: #5A0000'>" + name + "</span> in the system.</h3><h3>Double check with someone before paying then!</h3>";
	              	$('#response_text').append(response_text);
	            }
	            else if ('non_compliant' == data.status) {
	              	$('#non_compliant').show();
	              	var response_text = "<h3><span style='color: #5A0000'>" + name + "</span> is non-compliant!</h3><h3>Don't pay them</h3>";
	              	$('#response_text').append(response_text);
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

function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}