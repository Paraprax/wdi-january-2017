$(function() {
    $("#load-monsters").on('click', function() {
		console.log('Before .ajax line');
		
		$.ajax({
			crossDomain: false, // Needed for dataType because monsters-api is not same origin
			dataType: 'html',
			url: 'http://monsters-api.herokuapp.com/monsters',
			//data: { limit: 2 },
			method: 'GET'
		}).done(function(data) {
			$('body').append(data);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			console.log('Ajax Request Failed!');
			console.log(jqXHR);
		}).always(function() {
			console.log('Ajax Request Sent!');
		});
       
        console.log('After .ajax line');
    });
	
	$("#add-monster").on('click', function() {
		$.ajax({
			//crossDomain: false, // Needed for dataType because monsters-api is not same origin
			//dataType: 'text',
			url: 'http://monsters-api.herokuapp.com/monsters',
			data: { 
				monster: {
					name: 'Frankenstein',
					home: 'Transylvania',
					creepiness: 15
				}
			},
			method: 'POST'
		}).done(function() {
			$('body').append('SUCCESS: Monster created');
		}).fail(function() {
			$('body').append('ERROR: Could not create monster');
		}).always(function() {
			$('body').append('Add operation complete');
		});
	});
});
