$(function() {
	$('#search_terms').on('input', function() {
		var search_terms = $(this).val();
		
		if (search_terms == "") {
			$('#search_div').html("");
		} else {
			$.get("/reports/search", {"search_terms": search_terms }, function(data) {
				$('#search_div').html(data);
			});
		}
	});
});