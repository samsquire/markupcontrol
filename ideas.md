<document>Ideas in a definition list
by fuz

<idea>Encryption server</idea>

:	 Lets you encrypt files.

Personal dashboard

:	 Manage your life and your digital assets and relationships.


Declarative site

:	 Manage your site declaratively.


Live Parsing (merging parsers together)

:	 You want to parse a date, an address, a sequence of characters that represent a button keypress. You process it like a stream.
  As you type, the editor keeps an in-memory tree of always valid code.

<sam type="xquery" name="ideatable.xq"><![CDATA[
let $a := <Element cheese="5"></Element>
return $a/@cheese
]]></sam>

<div>
	<sam type="dotml" name="svg.xml" graphname="ideas">
<sam type="xquery" name="graph.xml">
xquery version "3.0";
let $idea := fn:doc("xmldb:exist:///db/sam/output/ideas.md")
return element dotml:graph {
		namespace dotml {"http://www.martin-loetzsch.de/DOTML"},
		namespace xsi {"http://www.w3.org/2001/XMLSchema-instance"},

		attribute file-name { "ideas" },
		attribute rankdir { "LR" },
		element dotml:node { attribute id  {"ideasmd"}, attribute label {"ideasmd"}, attribute fontsize { 9 },
										attribute font { "Arial" } },
		(for $section in $idea//sam
				let $name := fn:replace($section/@name, '\.', '')
				return (element dotml:node {
								attribute id { $name },
								attribute label { $name }
								},
								element dotml:edge {
										attribute from { $name },
										attribute to { "ideasmd" },
										attribute label { $section/@type },
										attribute fontsize { 9 },
										attribute font { "Arial" }
										
								})
				
		)
}
</sam></sam>
</div>

<sam type="data" name="example.sparql" to="xml"><![CDATA[
			PREFIX : <http://samsquire.com/>
			PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
			PREFIX owl: <http://www.w3.org/2002/07/owl#>
			PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
			PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
			CONSTRUCT   { <http://samsquire.com/> :hasIdea ?ideas }
			WHERE { ?ideas a :Idea  }
			]]></sam>

<sam name="insertrdf.xq" type="xquery"><![CDATA[
		declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
		declare default element namespace "http://samsquire.com/";
		(: Query begins :)
		(: Query begins :)
		(: Query begins :)
		let $rdf :=]]><sam type="data" name="ideaasxml.sparql" to="xml"><![CDATA[
			PREFIX : <http://samsquire.com/>
			PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
			PREFIX owl: <http://www.w3.org/2002/07/owl#>
			PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
			PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
			CONSTRUCT   { <http://samsquire.com/> :hasIdea ?ideas }
			WHERE { ?ideas a :Idea  }
			]]></sam><![CDATA[

		for $idea in $rdf//hasIdea return <a href="{$idea/@rdf:resource}">Idea</a>
]]></sam>

Before idea insert:
<sam type="sparql" name="ideas.sparql">
<![CDATA[
PREFIX : <http://samsquire.com/> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX xml: <http://www.w3.org/XML/1998/namespace> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX samsquire: <http://samsquire.com/> 
BASE <http://samsquire.com/> 

INSERT DATA {
:Idea a owl:Class .
:IdeaStatus a owl:Class.
:IdeaProgress a owl:ObjectProperty.

:SiteTag a owl:AnnotationProperty.

:NoKnownImplementations a owl:Class;
        rdfs:subClassOf :IdeaStatus.
        
:AttemptedImplementation a owl:Class;
        rdfs:subClassOf :IdeaStatus.

:EncryptionServer a owl:Class;
		a :Idea;
	 :SiteTag "EncryptionServer".

:OpenEmailMetadata a owl:Class; a :Idea; :SiteTag "OpenEmailMetadata".
:Dashboard a owl:Class; rdfs:subClassOf :Idea; :SiteTag "Dashboard".
:LifeEngineDashboard a :Dashboard; :SiteTag "LifeEngineDashboard".
:MagazineDashboard a :Dashboard; :SiteTag "MagazineDashboard".

}
]]></sam>
End idea insert


<sam type="n3" name="samidea.rdfa">
<sam type="data" name="samsideas.sparql"><![CDATA[
PREFIX s: <http://samsquire.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
CONSTRUCT   { s:Sam s:hasIdea ?ideas }
WHERE { ?ideas a s:Idea  }
]]>
</sam>
</sam>
</document>
