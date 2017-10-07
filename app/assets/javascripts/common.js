function changePage(url){
	$("#top-sites").empty();
	$.ajax({
    	url: url,
    	cache: false,
    	success: function(html){
      	$("#top-sites").append(html);
    	}
	});
}