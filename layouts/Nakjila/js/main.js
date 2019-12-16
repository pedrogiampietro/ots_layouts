/*
    Main Script
    --------------------------------------------------------------
    Script name:        ForumUS - Responsive phpBB 3.2 Theme/Style
    Based on style:     prosilver (the default phpBB 3.1.x style)
    Author:             ThemeLooks ( https://themeloooks.com/ )
    --------------------------------------------------------------
*/

;(function ($) {
    "use strict";
	
	/* ------------------------------------------------------------------------- *
	 * COMMON VARIABLES
	 * ------------------------------------------------------------------------- */
	var $wn = $(window),
		$body = $('body');
    
    $(function () {
		/* ------------------------------------------------------------------------- *
		 * CUSTOM BACKGROUND IMAGE
		 * ------------------------------------------------------------------------- */
        var dataBgImg = $('[data-bg-img]');
		
		dataBgImg.each(function () {
			$(this).css('background-image', 'url('+ $(this).data('bg-img') +')').removeAttr('data-bg-img');
		});
        
        /* -------------------------------------------------------------------------*
         * HEADER STICKY
         * -------------------------------------------------------------------------*/
        /*var $headerEl = $('#header'),
			$headerNavEl = $('.header--nav'),
			headerH = $headerEl.outerHeight();
        
        $headerNavEl.sticky();*/
        
        /* -------------------------------------------------------------------------*
         * HEADER NAV TAB
         * -------------------------------------------------------------------------*/
        var $headerNavLinks = $('.header--nav [data-toggle="tab"]')
        ,   $headerNavTab = $('.header-nav--tab')
        ,   $headerNavTabPane = $('.header-nav--tabpane')
        ,   headerNavTabPaneH = $headerNavTabPane.outerHeight();
        
        $headerNavLinks.on('click', function () {
            var $t = $(this)
            ,   $tp = $(this).parent('li')
            ,   toggleClas = 'active'
            ,   curHref = $t.attr('href')
            ,   $targetEl = $(curHref);

            if ( $tp.hasClass(toggleClas) ) {
                $tp.removeClass(toggleClas);

                $targetEl.slideUp();
                
                //$('#sticky-wrapper').css('height', ($headerNavEl.outerHeight() - $headerNavTab.outerHeight()));
            } else {
                $tp.siblings().removeClass(toggleClas);
                $tp.addClass(toggleClas);

                $targetEl.siblings().slideUp();
                $targetEl.slideDown();
                
                /*if ( !$('#sticky-wrapper').hasClass('is-sticky') ) {
                    $('#sticky-wrapper').css('height', ($headerNavEl.outerHeight() + headerNavTabPaneH));
                }*/
            }

            return false;
        });

        
        /* -------------------------------------------------------------------------*
         * TOGGLE TOPIC
         * -------------------------------------------------------------------------*/
        var $topicToggleBtn = $('.topic-list-header--toggle-btn');
        
        $topicToggleBtn.on('click', function () {
            var $t = $(this)
            ,   $toggleEl = $t.parent('.topic-list--header').siblings('.topic-list--content');
            
            if ( $toggleEl.height() === 0 ) {
                $t.removeClass('toggled');
                $toggleEl.animate({ height: $toggleEl.data('old-height') }, 500).removeAttr('data-old-height');
            } else {
                $t.addClass('toggled');
                $toggleEl.attr('data-old-height', $toggleEl.outerHeight()).animate({ height: '0' }, 500);
            }
        });
        
        /* -------------------------------------------------------------------------*
         * TOGGLE SIDEBAR
         * -------------------------------------------------------------------------*/
        var $toggleSidebarEl = $('.toggle-sidebar')
        ,   $topicBodyEl = $('.topic--body')
        ,   $topicSidebarEl = $('.topic--sidebar');
        
        $toggleSidebarEl.on('click', function () {
            var $t = $(this);
            
            if ( $t.hasClass('active') ) {
                $toggleSidebarEl.removeClass('active');
                
                $topicBodyEl.add($topicSidebarEl).removeClass('expended');
                
                $topicSidebarEl.delay(300).fadeIn('slow');
            } else {
                $toggleSidebarEl.addClass('active');
                
                $topicSidebarEl.fadeOut('slow', function () {
                    $topicBodyEl.add($topicSidebarEl).addClass('expended');
                });
            }
        });
        
        /* -------------------------------------------------------------------------*
         * PAGES
         * -------------------------------------------------------------------------*/
		var $pagesContent = $('.pages-content');
		
		if ( $pagesContent.length ) {
			$headerEl.next('.panel, .pages-content').addClass('page-template');
		}
        
        /* -------------------------------------------------------------------------*
         * FORM VALIDATION
         * -------------------------------------------------------------------------*/
        var $searchFormEl = $('.header--search-bar form');
        
        if ( $searchFormEl.length ) {
            $searchFormEl.validate({
                rules: {
                    keywords: "required"
                },
                errorPlacement: function () {
                    return false;
                }
            });
        }
        
        var $LoginFormEl = $('#LoginForm form');
        
        if ( $LoginFormEl.length ) {
            $LoginFormEl.validate({
                rules: {
                    "username": "required",
                    "password": "required"
                },
                errorPlacement: function () {
                    return false;
                }
            });
        }
        
        var $SignupFormEl = $('#SignupForm form');
        
        if ( $SignupFormEl.length ) {
            $SignupFormEl.validate({
                rules: {
                    signupEmail: {
                        email: true,
                        required: true
                    }
                },
                errorPlacement: function () {
                    return false;
                }
            });
        }
        
        var footerSubscribeFormEl = $('#footerSubscribeForm');

        if ( footerSubscribeFormEl.length ) {
            footerSubscribeFormEl.validate({
                rules: {
                    EMAIL: {
                        required: true,
                        email: true
                    }
                },
                errorPlacement: function () {
                    return true;
                }
            });
        }
        
        /* -------------------------------------------------------------------------*
         * PHPBB AJAX CALLBACKS
         * -------------------------------------------------------------------------*/
		var $headerMNotifyEl = $('.header-member--notifications');
		
		phpbb.addAjaxCallback('notifications.mark_all', function(res) {
			if (typeof res.success !== 'undefined') {
				/* Remove Has Unread Class */
				$headerMNotifyEl.removeClass('has-unread');
				
				/* Close Popup Box */
				phpbb.closeDarkenWrapper(1000);
			}
		});

		/* ------------------------------------------------------------------------- *
		 * COLOR SWITCHER
		 * ------------------------------------------------------------------------- */
        var themePath = $body.data('theme-path');
        
        if ( typeof $.cColorSwitcher !== "undefined" ) {
            $.cColorSwitcher({
                'switcherTitle': 'Style 1 Colors:',
                'switcherColors': [{
                    bgColor: '#293a4a',
                    fgColor: '#ff6c2c',
                    filepath: themePath + '/colors/style-1-color-1.css'
                }, {
                    bgColor: '#8bc34a',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-2.css'
                }, {
                    bgColor: '#03a9f4',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-3.css'
                }, {
                    bgColor: '#ff9600',
                    fgColor: '#293a4a',
                    filepath: themePath + '/colors/style-1-color-4.css'
                }, {
                    bgColor: '#e91e63',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-5.css'
                }, {
                    bgColor: '#00BCD4',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-6.css'
                }, {
                    bgColor: '#FC5143',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-7.css'
                }, {
                    bgColor: '#00B249',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-8.css'
                }, {
                    bgColor: '#D48B91',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-9.css'
                }, {
                    bgColor: '#8CBEB2',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-10.css'
                }, {
                    bgColor: '#4267b2',
                    fgColor: '#303030',
                    filepath: themePath + '/colors/style-1-color-11.css'
                }, {
                    bgColor: '#ff5252',
                    fgColor: '#293a4a',
                    filepath: themePath + '/colors/style-1-color-12.css'
                }],
                'switcherTarget': $('#mainColorScheme')
            })
                .children('.ccs--body')
                    .children('ul')
                    .eq(1)
                        .children('li')
                            .each(function () {
                                var $t = $(this),
                                $tD = $t.data('file-path'),
                                $tDR = $tD.replace('style-1', 'style-2');

                                $(this).attr('data-file-path', $tDR);
                            })
                    .end()
                    .siblings('a')
                    .css({
                        'display': 'block',
                        'color': '#293a4a',
                        'text-align': 'center',
                        'line-height': '40px'
                    });
        }

		/* ------------------------------------------------------------------------- *
		 * BACK TO TOP BUTTON
		 * ------------------------------------------------------------------------- */
        var backToTop = {
            $el: $('.back-to-top'),
            $btn: $('.back-to-top button'),
            show: function () {
                return ( $(window).scrollTop() > 1 ) ? backToTop.$el.addClass('show') : backToTop.$el.removeClass('show');
            }
        };
        
        backToTop.show();
        
        backToTop.$btn.on('click', function() {
            $("html, body").animate({scrollTop: 0}, 500);
        });
		
		/* -------------------------------------------------------------------------*
		 * ON SCROLL
		 * -------------------------------------------------------------------------*/
        $(window).on('scroll', function () {
            backToTop.show();
        });
    });
    
    $(window).on('load', function () {
		/* ------------------------------------------------------------------------- *
		 * PRELOADER
		 * ------------------------------------------------------------------------- */
        $('#preloader').fadeOut('slow');
    });
})(jQuery);