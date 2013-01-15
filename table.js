	function isOpen() {
		return $('.ideatable').hasClass("open");
	}

	function toggleEffect(content) {
			// toggle the open and close effects
			if (isOpen()) { 
					console.log(content);
					foldclose(content);
				} else {
					unfold(content);	
			}
	}
	function foldclose(content) {
		console.log("inside foldclose:" + content);
		// $('.camera').css({'-webkit-perspective': '1000px', '-webkit-perspective-origin': '9px 76px 200px'});
		console.log("opened");
		content.slideUp('slow');
		$('.ideatable').one('animationend webkitAnimationEnd', function() {
			$('.camera').css({'-webkit-animation': 'fold 1s 1', top: '25%'});
			$(this).removeClass('open').addClass('close');
		});
		$('.ideatable').css({'-webkit-animation': 'pageclose 1s 1'});
	}

	function unfold(content) {
		// $('.camera').css({'-webkit-perspective': '700px', '-webkit-perspective-origin': $(content).position().left + 'px ' + $(content).position().top + 'px'});
		console.log("closed");
		$('.ideatable').one('animationend webkitAnimationEnd', function() {
			$('.camera').css({'-webkit-animation': 'unfold 1s 1', top: '-20%'});
			$('.ideatable').removeClass('close').addClass('open');
		});
		$('.ideatable').css({'-webkit-animation': 'pageopen 2s 1'});

		content.slideDown('slow');
}


	$(".ideatable tr").bind('click', function() {
		console.log("table row clicked");
		var reference = $(this).data('ref');
		var path = window.location.pathname;
		// window.location.origin + window.location.host + .substring(0, window.location.pathname.lastIndexOf("/"))
		window.location.hash = "opened";
		window.location = reference + ".html";
		console.log(reference, $(this));
		return;

		if (window.location.hash == "#" + reference) {
			changePage();
		} else { 
			window.location.href = window.location.href.split('#')[0] + "#" + reference;
		}
	});
	
	function changePage (reference, callback) {
			console.log("Change Page");
			if (reference.length == 0) { 
				if (isOpen()) {
					var content = $(".rowContent .content");
					console.log("closing previously opened");
					if (content.length > 0) {
						foldclose($(content));	
					}
				}
				return; 
			}

			var getRow = $(".rowContent ." + reference);
			var content = $("." + reference);

			if (getRow.length == 0) { 
				var myRow = $("tr[data-ref=" + reference  + "]");
				var contentRow = content.wrap("<tr></tr>").parent()
				var cell = $("<td></td>");
				cell.attr('colspan', 4).addClass('rowContent');
				content.wrap(cell);
				$(myRow).after(contentRow);	
			}

			toggleEffect(content, callback);	
			
			// $('.camera').css({'-webkit-perspective': '700px', '-webkit-perspective-origin': $(content).position().left + 'px ' + $(content).position().top + 'px'});

	};

	// $(document).on('ready', changePage);
//	$(window).on('hashchange', function() {
//			var reference = document.location.hash.substring(1);
//			console.log('hash change');  changePage(reference)
// 	});


var path = window.location.href;
path = path.substring(1 + path.lastIndexOf("/"), path.lastIndexOf("."));

$(window).on('hashchange', function(e) {
	console.log("change page");
	changePage(path);
});


$(".ideatable").ready(function() {
	console.log("Ideatable ready: " + path);
	if (window.location.hash != "#opened") {
		if ($("." + path).length == 1) {
			console.log("Opening page", path);
			changePage(path);
		}
	}
});

$(window).bind('unload', function() {
	$(".content").slideUp();	
});

$(window).bind('pageshow', function(e) {
	if (window.location.hash == "#opened") {
			$('.ideatable').removeClass('close').addClass('open');
			$('.camera').css({top: '-20%'});
			changePage("123");
	}
});
