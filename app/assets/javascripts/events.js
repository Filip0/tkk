document.addEventListener("turbolinks:load", function() {
	$( "#tabs" ).tabs({
		collapsible: true
	});

	$('.datetimepicker').datetimepicker();
	var elements = $(".simplemde");
	for (var i = elements.length - 1; i >= 0; i--) {
		console.log(elements[i]);
		new SimpleMDE({ element: elements[i] });
	};
})
