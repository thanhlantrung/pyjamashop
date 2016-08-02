$(document).on('ready page:load', function(){
	$('.img-zoom').elevateZoom(); //{ 	zoomWindowHeight: 100,
								//	zoomWindowWidth: 100,
								//});
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets', 
	  readOnly: true,
	  score: function() {
	  	return $(this).attr('data-score');
	  }
    });
});

