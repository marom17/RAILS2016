$(function() {
	$('#source_search_terms').on('input', function() {
		$.get("/sources/search", {"search_terms": $(this).val()}, function(data) {
			$('#source_search_results').html(data);
		});
	});
});

function add_source_to_report(trigger, id, name) {
	$("#source_list").append('<li><div class="checkbox"><label><input type="checkbox" name="report[sources][]" value="' + id + '" checked="checked" onchange="remove_source_from_report(this)" />' + name + '</div></label></li>');
	trigger.closest('li').remove();
}

function remove_source_from_report(trigger) {
	trigger.closest('li').remove();
}
