<sam name="fulltable.md">

&lt;html version="HTML+RDFa 1.1" lang="en" xmlns=
"http://www.w3.org/1999/xhtml" xmlns:rdf=
"http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs=
"http://www.w3.org/2000/01/rdf-schema#" xmlns:xsd=
"http://www.w3.org/2001/XMLSchema#" xmlns:cc=
"http://creativecommons.org/ns#" xmlns:dc=
"http://purl.org/dc/elements/1.1/" xmlns:foaf=
"http://xmlns.com/foaf/0.1/" xmlns:sam=
"http://samsquire.co.uk/"&gt;
&lt;head&gt;
&lt;link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'&gt;&lt;/link&gt;
&lt;title&gt;ideas.samsquire.co.uk&lt;/title&gt;
&lt;script src="jquery-1.8.3.min.js"&gt;&lt;/script&gt;


&lt;style&gt;
	* {
		 -webkit-font-smoothing: subpixel-antialiased;   
	 }

	h1 {
		color: lime;
		font-family: 'Belgrano';
	}

	body {
		background-color: black;
	}


	.content {
		display: none;
	}

	@-webkit-keyframes wobble  /* Safari and Chrome */
	{
		0%   {  -webkit-transform: rotateY(15deg) rotateZ(5deg) rotateX(5deg);  }
		100% {  -webkit-transform: rotateY(15deg) rotateZ(-5deg) rotateX(5deg);}
	}

	@-webkit-keyframes pageopen  /* Safari and Chrome */
	{
		0%   {  -webkit-transform: rotateY(15deg) rotateZ(5deg) rotateX(5deg);  }
		100% {  -webkit-transform: rotateY(0deg) rotateZ(-0deg) rotateX(0deg);}

	}

	@-webkit-keyframes pageclose  /* Safari and Chrome */
	{
		0% 	{  -webkit-transform: rotateY(0deg) rotateZ(0deg) rotateX(0deg);}
		100% {  -webkit-transform: rotateY(15deg) rotateZ(5deg) rotateX(5deg);  }
	}

	@-webkit-keyframes fold  /* Safari and Chrome */
	{
		0% 	 { top: -20%;  }
		100% { top: 25%;  }
	}

	@-webkit-keyframes unfold  /* Safari and Chrome */
	{
		0% 	 { top: 25%;  }
		100% { top: -20%;  }
	}

	.ideatable {
		background-color: black;
		color: lime;
		margin: auto;
		left: auto;
		width: 90em;
		border: 3px solid #74AB00;
		border-radius: 1em;	
		border-top: none;
		border-bottom: none;
		padding: 0.5ex;
		position: relative;
		font-family: 'Belgrano';
		-webkit-transform-style: preserve-3d;
		-webkit-perspective: 1000px;	
		-webkit-perspective-origin: 0px 0px 0px;
		-webkit-transform: rotateY(15deg) rotateZ(5deg) rotateX(5deg);
		/* -webkit-animation: wobble 10s 1; */
		/* -webkit-animation-direction:alternate; */
		-webkit-transform-origin: 50% 50% 0%;
		border-spacing:0;
	}

	.open {
		-webkit-transform: rotateY(0deg) rotateZ(-0deg) rotateX(0deg);
	}
	.close {
		-webkit-transform: rotateY(15deg) rotateZ(5deg) rotateX(5deg);
	}

	.statustable {

	}

	.ideatable th {
		padding: 0.3ex;
		color: teal;
		border: 2px solid #74AB00;
		border-right: none;
		border-left: none;
		border-radius: 1ex;	
		/* background-color: #332F3E; */
		margin-bottom: 0.5ex;
	}


	.ideatable tr td:first-child {
		margin: 0.5ex;
	}
/* 
	.ideatable tr td:first-child {
		background-color: #E5FCC2;
		border-top-left-radius: 1em;	
		border-top-right-radius: 1em;	
	}
	.ideatable tr:last-child td {
		background-color: #E5FCC2;
	}

	.ideatable tr:nth-child(even) td {
		background-color: #E5FCC2;
	}
*/

	.camera {
		display: block;
		-webkit-transform-style: preserve-3d;
		-webkit-perspective-origin: 9px 76px 200px;
		-webkit-perspective: 1000px;	
		position: relative;
		top: 25%;
	}

	.ideatable tr:hover td {
		border-left:3px solid #74AB00;
		background-color: #3B3B3D;
		border-radius: 0.5ex;
	}

	h1 {
	width: 100%;
	}

&lt;/style&gt;

&lt;/head&gt;
&lt;body&gt;
	&lt;h1&gt;ideas.samsquire.co.uk&lt;/h1&gt;

	&lt;sam:table xmlns="http://samsquire.co.uk/"&gt;
		&lt;Config&gt;
			&lt;Headings&gt;
			&lt;Name&gt;&lt;/Name&gt;&lt;Description&gt;&lt;/Description&gt;&lt;Status&gt;&lt;/Status&gt;
			&lt;/Headings&gt;
		&lt;/Config&gt;


		&lt;Rows&gt;	
			&lt;Idea&gt;
				&lt;Name&gt;Encryption Server&lt;/Name&gt;
			&lt;/Idea&gt;	
		&lt;/Rows&gt;
	&lt;/sam:table&gt;
	&lt;div class="camera"&gt;


<sam type="sparql" name="insertideas.sparql">
PREFIX : &lt;http://samsquire.com/&gt; 
PREFIX owl: &lt;http://www.w3.org/2002/07/owl#&gt; 
PREFIX rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; 
PREFIX xml: &lt;http://www.w3.org/XML/1998/namespace&gt; 
PREFIX xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; 
PREFIX rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; 
PREFIX samsquire: &lt;http://samsquire.com/&gt; 
PREFIX dc: &lt;http://purl.org/dc/elements/1.1/&gt;
BASE &lt;http://samsquire.com/&gt; 

INSERT DATA {
:Idea a owl:Class .
:IdeaStatus a owl:Class.
:IdeaProgress a owl:ObjectProperty.

:NoKnownImplementations a owl:Class;
        rdfs:subClassOf :IdeaStatus.
        
:AttemptedImplementation a owl:Class;
        rdfs:subClassOf :IdeaStatus.

:EncryptionServer a owl:Class; a :Idea;
	 dc:title "Encryption Server";
	 dc:description "Encrypt files one by one in a schedule.";
	 dc:identifier "EncryptionServer".


:OpenEmailMetadata a owl:Class; a :Idea;
	 dc:title "Open Email Metadata";
	 dc:description "Send metadata in emails to make email more useful.";
	 dc:identifier "OpenEmailMetadata".

:Dashboard a owl:Class; rdfs:subClassOf :Idea;
	 dc:title "Dashboard";
	 dc:description "";
	 dc:identifier "Dashboard".

:LifeEngineDashboard a :Dashboard;
	 dc:title "LifeEngine Dashboard";
	 dc:description "Take control of your life with a standard dashboard.";
	 dc:identifier "LifeEngineDashboard".

:MagazineDashboard a :Dashboard;
	 dc:title "Magazine Dashboard";
	 dc:description "Your life as an infographic.";
	 dc:identifier "MagazineDashboard".
}

</sam>

&lt;table class="ideatable"&gt;
&lt;thead&gt;
	&lt;th&gt;Idea name&lt;/th&gt;
	&lt;th&gt;Description&lt;/th&gt;
&lt;/thead&gt;
&lt;tbody&gt;

<sam type="xquery" name="theideatable.xq">
xquery version "3.0";
declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare default element namespace "http://samsquire.com/";
declare namespace dc = "http://purl.org/dc/elements/1.1/";

let $ideaTable :=  <sam type="data" name="ideaasxml.sparql" to="xml">
PREFIX : &lt;http://samsquire.com/&gt;
PREFIX rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;
PREFIX owl: &lt;http://www.w3.org/2002/07/owl#&gt;
PREFIX xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt;
PREFIX rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt;
PREFIX dc: &lt;http://purl.org/dc/elements/1.1/&gt;
CONSTRUCT {
	 &lt;http://samsquire.com/&gt; :hasIdea ?ideas .
			?ideas dc:title ?name.
			?ideas dc:description ?description.
			?ideas dc:identifier ?identifier.
}
WHERE {
	 ?ideas a :Idea .
	 ?ideas dc:title ?name.
	 ?ideas dc:description ?description.
	 ?ideas dc:identifier ?identifier.
}
</sam>
return (
    
for $idea in $ideaTable//hasIdea
    let $data := $ideaTable//rdf:Description[@rdf:about eq $idea/@rdf:resource]
    let $pageName := $data/dc:title/text()
    let $description := $data/dc:description/text()
    let $identifier := $data/dc:identifier/text()
    return (
        element tr {
						attribute data-reg { $identifier },
            element td { $pageName},
            element td { $description }
        }    
        )
)
</sam>

&lt;/tbody&gt;
&lt;/table&gt;
&lt;/div&gt;

	&lt;div class="content 123"&gt;
	The encryption server is a way of keeping files on a computer secure.
	&lt;/div&gt;	



	&lt;script&gt; 

		$(".ideatable tr").bind('click', function() {
			console.log("table row clicked");
			var reference = $(this).data('ref');
			
			if (window.location.hash == "#" + reference) {
				changePage();
			} else { 
				window.location.href = window.location.href.split('#')[0] + "#" + reference;
			}
					
			/*
			var myRow = $(this).closest('tr');
			console.log(myRow.html());
			console.log(reference);
			var content = $("." + reference);
			var contentRow = content.wrap("&lt;tr&gt;").parent()
			content.wrap("&lt;td colspan='4'&gt;");
			$(myRow).after(contentRow);	
			$(content).slideToggle();	
			$('.camera').css({'-webkit-perspective': '700px', '-webkit-perspective-origin': $(content).position().left + 'px ' + $(content).position().top + 'px' });
			*/
		});
		
		var changePage =	function() {
				var reference = document.location.hash.substring(1);
				console.log(reference);
				if (reference.length == 0) { 
					return; 
				}

				var getRow = $(".rowContent ." + reference);
				var content = $("." + reference);

				if (getRow.length == 0) { 
					var myRow = $("tr[data-ref=" + reference  + "]");
					var contentRow = content.wrap("&lt;tr&gt;&lt;/tr&gt;").parent()
					var cell = $("&lt;td&gt;&lt;/td&gt;");
					cell.attr('colspan', 4).addClass('rowContent');
					content.wrap(cell);
					$(myRow).after(contentRow);	
				}

				toggleEffect(content);	
				
				$('.camera').css({'-webkit-perspective': '700px', '-webkit-perspective-origin': $(content).position().left + 'px ' + $(content).position().top + 'px'});
		};
		$(document).on('ready', changePage);
		$(window).on('hashchange', function() {console.log('hash change');  changePage() });

		function toggleEffect(content) {
				// toggle the open and close effects
				if ($('.ideatable').hasClass("open")) { 
						foldclose(content);
					} else {
						unfold(content);	
				}
		}
		function foldclose(content) {
			console.log("opened");
			$('.ideatable').one('animationend webkitAnimationEnd', function() {
				$('.camera').css({'-webkit-animation': 'fold 1s 1', top: '25%'});
			});
			$('.ideatable').css({'-webkit-animation': 'pageclose 1s 1'}).addClass('close').removeClass('open');
			content.slideUp('slow');
		}

		function unfold(content) {
			console.log("closed");
			$('.ideatable').one('animationend webkitAnimationEnd', function() {
				$('.camera').css({'-webkit-animation': 'unfold 1s 1', top: '-20%'});
			});
			$('.ideatable').css({'-webkit-animation': 'pageopen 2s 1'}).removeClass('close').addClass('open');

			content.slideDown('slow');

}

		&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;

</sam>
