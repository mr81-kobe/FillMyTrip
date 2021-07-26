;(function ($) {
	
	'use strict';
	
	//Date Picker
    $('#date-start, #date-end').datepicker();

	// Parallax
	var parallax = function() {
		var mobile_device = false;
		
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			mobile_device = true;
		}
		
		if( mobile_device == false ) { 
			$(window).stellar(); 
		}
		
		if (navigator.userAgent.indexOf('Edge') >= 0){
			$(".blend-container h2").css("color","rgba(0,0,0,0.4)");
		}
		
	};

	
	// responsive navbar
	var responsiveNavbar = function(){
		
		//clone navbar menu
		var $clone = $('#delcd-menu-wrap').clone();
		$clone.attr({
			'id' : 'offcanvas-menu'
		});
		$clone.find('> ul').attr({
			'class' : '',
			'id' : ''
		});

		$('#delcd-page').prepend($clone);
		
		// create offcanvas-menu height
		$('#offcanvas-menu').css('height', $(window).height()+60);
		
		$(window).resize(function(){
			var w = $(window);
			
			// create offcanvas-menu height when window resize
			$('#offcanvas-menu').css('height', w.height()+60);
			
			if ( w.width() > 769 ) {
				if ( $('body').hasClass('delcd-offcanvas') ) {
					$('body').removeClass('delcd-offcanvas');
				}
			}

		});
		
		// click the burger
		function burgerClicked(){		
			
			// add and remove delcd-offcanvas class
			$('body').toggleClass('delcd-offcanvas');
			
			// clear dropdown
			if( $('.delcd-sub-ddown').hasClass('active') ){
				$('.delcd-sub-ddown').removeClass('active')
			}
		}	

		// Click outside of the Mobile Menu
		function outsideMenu(){	
			
			if ( $('body').hasClass('delcd-offcanvas') ) {
					
				$('body').removeClass('delcd-offcanvas');
				
				//remove class active
				$('.js-delcd-nav-toggle').removeClass('active');
			}
		}	
		
		//event delegation
		$(document).on('click', 'a, div', function(event){
			
			var target = event.target;
			
			switch(target.tagName.toLowerCase()) {
				case 'a':
					if( $(this).hasClass('js-delcd-nav-toggle') ){
						event.preventDefault();
						burgerClicked(); 
						$(this).toggleClass('active');
					}
					else if( $(this).hasClass('delcd-sub-ddown') ){
						event.preventDefault();
						$(this).toggleClass('active'); 
					}	
					break;
				case 'div':
					if( this.id === 'delcd-page' ){
						outsideMenu(); }
					break;
				default:
					break;
			}
			
		});	
		
	};
	
	// Animations
	var contentWayPoint = function() {
		var i = 0;
		$('.animate-box').waypoint( function( direction ) {

			if( direction === 'down' && !$(this.element).hasClass('animated') ) {
				
				i++;

				$(this.element).addClass('item-animate');
				setTimeout(function(){

					$('body .animate-box.item-animate').each(function(k){
						var el = $(this);
						setTimeout( function () {
							el.addClass('fadeInUp animated');
							el.removeClass('item-animate');
						},  k * 50, 'easeInOutExpo' );
					});
					
				}, 100);
				
			}

		} , { offset: '85%' } );
	};
	
	var stickyBanner = function() {
		var $stickyElement = $('.sticky-banner');
		var sticky;
		if ($stickyElement.length) {
		  sticky = new Waypoint.Sticky({
		      element: $stickyElement[0],
		      offset: 0
		  })
		}
	}; 

	// MagnificPopup
	var magnifPopup = function() {
		$('.image-popup').magnificPopup({
			type: 'image'
		});
	};
	
	// smooth scroll
	//SmoothScroll({ stepSize: 50 });
	
	// Document on load.
	$(function(){
		parallax();
		responsiveNavbar();
		contentWayPoint();
		stickyBanner();
		magnifPopup();
	});


}(jQuery));