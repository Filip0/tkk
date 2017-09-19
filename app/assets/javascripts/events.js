$(document).on("page:load page:change ready", function() {
	console.log('PAGE LOAD');
	var elements = $(".simplemde");
	for (var i = elements.length - 1; i >= 0; i--) {
		console.log(elements[i]);
		new SimpleMDE({ element: elements[i] });
	};
});

$( function() {
	$( "#tabs" ).tabs({
		collapsible: true
	});
} );
