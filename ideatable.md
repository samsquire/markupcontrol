<document>
<sam name="header.md">
<![CDATA[
<html version="HTML+RDFa 1.1" lang="en" xmlns=
"http://www.w3.org/1999/xhtml" xmlns:rdf=
"http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs=
"http://www.w3.org/2000/01/rdf-schema#" xmlns:xsd=
"http://www.w3.org/2001/XMLSchema#" xmlns:cc=
"http://creativecommons.org/ns#" xmlns:dc=
"http://purl.org/dc/elements/1.1/" xmlns:foaf=
"http://xmlns.com/foaf/0.1/" xmlns:sam=
"http://samsquire.co.uk/">
<head>
<link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'></link>
<title>ideas.samsquire.co.uk</title>
<script src="jquery-1.8.3.min.js"></script>


<style>
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

</style>

</head>
<body>
	<h1>ideas.samsquire.co.uk</h1>

	<sam:table xmlns="http://samsquire.co.uk/">
		<Config>
			<Headings>
			<Name></Name><Description></Description><Status></Status>
			</Headings>
		</Config>


		<Rows>	
			<Idea>
				<Name>Encryption Server</Name>
			</Idea>	
		</Rows>
	</sam:table>
	<div class="camera">
]]>

<sam name="another.js"/>
<sam type="sparql" name="insertideas.sparql"><![CDATA[
PREFIX : <http://samsquire.com/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX xml: <http://www.w3.org/XML/1998/namespace> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX samsquire: <http://samsquire.com/> 
PREFIX dc: <http://purl.org/dc/elements/1.1/>
BASE <http://samsquire.com/> 

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
]]>
</sam>
</sam>

<sam name="fulltable.md">
<![CDATA[
<table class="ideatable">
<thead>
	<th>Idea name</th>
	<th>Description</th>
</thead>
<tbody>
]]>
<sam type="xquery" name="theideatable.xq"><![CDATA[
xquery version "3.0";
declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace sam = "http://samsquire.com/";
(: declare default element namespace "http://samsquire.com/"; :)
declare namespace dc = "http://purl.org/dc/elements/1.1/";

let $ideaTable := ]]> <sam type="data" name="ideaasxml.sparql" to="xml"><![CDATA[
PREFIX : <http://samsquire.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
CONSTRUCT {
	 <http://samsquire.com/> :hasIdea ?ideas .
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
]]></sam><![CDATA[

return (
    
for $idea in $ideaTable//sam:hasIdea
    let $data := $ideaTable//rdf:Description[@rdf:about eq $idea/@rdf:resource]
    let $pageName := $data/dc:title/text()
    let $description := $data/dc:description/text()
    let $identifier := $data/dc:identifier/text()
    return (
        element tr {
						attribute data-ref { $identifier },
            element td { $pageName},
            element td { $description }
        }    
        )
)
]]></sam>
<![CDATA[
</tbody>
</table>
</div>

	<div class="content 123">
	The encryption server is a way of keeping files on a computer secure.
	</div>	

]]>
<![CDATA[
<script src="table.js"></script>	
</body>
</html>
]]>
</sam>
</document>
