# MarkupControl
===

You like using markup languages:

 * HTML
 * Markdown
 * Textile
 * MediaWiki

You also like template languages such as:

 * HAML
 * Moustache
 * Handlebars
 * XLST
 
You don't want to fully commit to a particular brand of CMS, blog, generator or language ecosystem. You want the freedom to pick and choose the features that you like. Sometimes you just want:

 * to use any markup language
 * mix and match different markup languages in the same file
 * keep everything under version control
 * to split up content and keep it reuseable
 * future proof markup by marking up data how you see it
 * use markup as a form of metadata
 * defer doing things until you really need to
 * update something once and only once and keep everything synchronized
 * use dynamic or static generation depending on the circumstances

# Concept
===

MarkupControl is simple. Any language can be wrapped by MarkupControl. MC is a script that you can use manually or integrate with your content workflow for automation. Your content can be processed before it makes its journey to other ecosystems, such as your CMS or your web framework.

MC essentially takes your file and wraps it up with a root MC tag so it can be processed as a regular XML file. This essentially gives us a powerful markup ecosystem for free.

# Ad Hoc Markup - Mark Up data how you see fit

XML is great for making up text so it can be understood by machines. This principle adopted by MarkupControl so that you should be able to freely create elements and attributes how you see fit. You do not have a predescribed list of elements that you are allowed to use. You don't have to install a plugin to use a new element. Please note that none of the following examples exist (yet):

 * If you're writing a filename, maybe you should mark it up as a `<filename/>` element - you might want to do something smart with them in the future.
 
 * You're including a picture of your friend, maybe you use a `<friend/>` or `<photo/>` element.
 
 * Referring to a table of data?  Make an element for it `<json>/`, `<datatable/>` or `<sqlquery/>` or your own custom `<table/>` element.

While none of the above examples exist, the principle of MC is that it *should* be easy to use whatever element you like and then dictate how it gets rendered after the fact - perhaps with another MC file, element processor or another method.

Rather than your platform or blog platform 'allowing you to use' certain elements at creation time, you should be able to use whatever you like and then make decisions about how these custom elements will be rendered after creation time. For example, you can find out where you have used your `<filename/>` elements and then define some MarkupControl to handle all cases where you have used them. You might make a fleeting reference to `<petpeeve/>` in an element and want to compile your `<petpeeve/>` articles in the future.

Your choice of element might dictate the format, the API of the data. For example, if you're using an `<sqlquery/>` element, you should be able to interact with the data inside that element with SQL statements. The same applies to a `<json/>` element.

# Types of Tag

There are some powerful ways that MC can be represented.

* **Unknown Tags**: These are tags that have been used but have no meaning attached to them. An interface can show a sequence of unknown tags and provide facility to display them in a certain way.
* **Reverse Tags**: These are programs that look for unstructured text to be substituted with tags. Some examples:
	* a regular expression that matches a phone number or some other repeating text.
	* a list of abbreviations/substitutions that you commonly use
	* a set of subjects, objects or predicates that you wish to refer to such as a product, a person or a company.

# Dependency Tracking

One file can have many different components or sections. You do not want to generate lots of files unnecessarily - especially if your documents contain element processors. MC has a `makefile` that ensures only modified pages or sections trigger re-generation.

 * if an untyped section file has changed, the file can be `re-joined`
 * if a typed section has changed, the file must be `re-processed` and `re-joined`
 * if a MC file has changed, the file must be `re-extracted`.

## Named Sections

A named section is simply extracted into a separate file when it is encountered. This gives you more fine control over re-useable sections in your document. 

```
	<sam name="">
		Your content here. (Absolutely anything)
	</sam>
```

## Nested Nodes

Nested nodes allow you to process content through multiple stages. The output from the innermost node is passed to its parent and up the markup tree.

```
<sam name="" type="">
	<sam name="" type="">
	
	</sam>
</sam>
```


# Custom Elements

Custom nodes can be implemented by simply creating a shell script written in a language of your choice. This script will be passed a:

 * path to the file containing **only** the `section` element such as `sections/section.xml`
 * the name given to the section such as `section.xml`
 * standard output is then redirected to be the output for that section
 
Whatever your script outputs is what will will replace that element.

 
# Element Processors

All element processors operate on sections to output the result of processing that section. They are usually called with the following arguments:

```
	processor.sh sections/section.xml sectionName.xml
```

## Drools Rules

```
	<sam type="rule">
	
	rule "when something happens"
	when 
		UserCommand(name == "something")
	then
		// do something
	end
	
	</sam>
```

The `rules.sh` processor puts sections into a folder that is managed by a running Drools Expert rule engine Knowledge Agent.

# RDF Translator Service

The `n3.sh` processor integrates with the [RDF Translator]( http://rdf-translator.appspot.com/) service to translate between various semantic languages such as N3, RDFa, Turtle, JSON and XML. You can provide the conversion

The default is to convert N3 triples to RDFa for inclusion on a webpage. This is useful for GoodRelations style triples which are easier to read and understand in triple format.

```
	<sam type="n3.sh">
	
	</sam>
```

You can specify the input and output formats with the `from` and `to` attributes with choices the same as the RDF Translator service:

 * **From** rdfa | microdata | xml | n3 | nt | rdf-json | json-ld | detect
 * **To** rdfa | microdata | pretty-xml | xml | n3 | nt | rdf-json-pretty | rdf-json | json-ld

For example,

	<sam type="n3.sh" from="xml" to="n3">
	
	</sam>

`./n3.sh sections/section.xml section.xml n3 rdfa`

`./n3.sh sections/section.xml section.xml xml n3`


# SPARQL Query

The `sparql.sh` processor talks to a Apache Jena/Fuseki's SPARQL endpoint for running SPARQL update queries against triple datastores.

`sparql.sh sections/section.xml sections.xml`

This produces no output that is inserted into the document. Output must be produced from the `data.sh` SPARQL query.

# SPARQL Data Query

The `data.sh` processor runs a SPARQL query against a SPARQL endpoint and returns the data in a requested format.

```
<sam type="data" name="section.xml" to="format"></sam>
```

`data.sh sections/section.xml section.xml`

The `format` attribute is passed as-is to fuseki's s-query command as the --format parameter. By default, `text` is assumed which produces a basic textual table. Valid options are:
 * json | xml | text | csv | tsv
  

```
<sam type="data">
	PREFIX : <http://samsquire.co.uk/> 
	PREFIX owl: <http://www.w3.org/2002/07/owl#> 
	PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
	PREFIX xml: <http://www.w3.org/XML/1998/namespace> 
	PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
	PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
	PREFIX samsquire: <http://samsquire.co.uk/> 
	BASE <http://samsquire.co.uk/> 
	
	INSERT DATA {
	:Idea a owl:Class .
	:IdeaStatus a owl:Class.
	:IdeaProgress a owl:ObjectProperty.
	
	:NoKnownImplementations a owl:Class;
	        rdfs:subClassOf :IdeaStatus.
	        
	:AttemptedImplementation a owl:Class;
	        rdfs:subClassOf :IdeaStatus.
	
	:MarkupControl a owl:Class; a :Idea.
	:OpenEmailMetadata a owl:Class; a :Idea.
	}

</sam>


```
This is especially useful with the RDF Translator Service as a nested processor. This will make a query and a convert the result into RDFa for inclusion into a web page.

```
	<sam type="n3">
		<sam type="data">
			PREFIX : <http://samsquire.com/>
			PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
			PREFIX owl: <http://www.w3.org/2002/07/owl#>
			PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
			PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
			CONSTRUCT   { <http://samsquire.com/> :hasIdea ?ideas }
			WHERE { ?ideas a :Idea  }
		</sam>
	</sam>
```

# DotML

The `dotml.sh` processor uses DotML produce an SVG. You can then insert Dot ML into your markup and have SVG files take their place.

```
<sam type="dotml" name="graph.xml"><![CDATA[
	<dotml:graph xmlns:dotml="http://www.martin-loetzsch.de/DOTML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" file-name="ideas" rankdir="LR">
	    <dotml:node id="ideasmd" label="ideasmd" fontsize="9" font="Arial"/>
	    <dotml:node id="ideatablexq" label="ideatablexq"/>
	    <dotml:edge from="ideatablexq" to="ideasmd" label="xquery" fontsize="9" font="Arial"/>
	    <dotml:node id="examplesparql" label="examplesparql"/>
	    <dotml:edge from="examplesparql" to="ideasmd" label="data" fontsize="9" font="Arial"/>
	    <dotml:node id="insertrdfxq" label="insertrdfxq"/>
	    <dotml:edge from="insertrdfxq" to="ideasmd" label="xquery" fontsize="9" font="Arial"/>
	    <dotml:node id="ideaasxmlsparql" label="ideaasxmlsparql"/>
	    <dotml:edge from="ideaasxmlsparql" to="ideasmd" label="data" fontsize="9" font="Arial"/>
	    <dotml:node id="ideassparql" label="ideassparql"/>
	    <dotml:edge from="ideassparql" to="ideasmd" label="sparql" fontsize="9" font="Arial"/>
	    <dotml:node id="samideardfa" label="samideardfa"/>
	    <dotml:edge from="samideardfa" to="ideasmd" label="n3" fontsize="9" font="Arial"/>
	    <dotml:node id="samsideassparql" label="samsideassparql"/>
	    <dotml:edge from="samsideassparql" to="ideasmd" label="data" fontsize="9" font="Arial"/>
	</dotml:graph>]]>
</sam>
```

# eXist-db XQuery

The `xquery.xq` processor lets you talk to an [eXist-db](http://exist-db.org/) XML database to execute XQuery. In order to run the XQuery, it has to be run as a 'stored xquery', this processor will first `PUT` the XQuery and then execute it, returning the output.

`xquery.sh sections/section.xml section.xml`

```
	<sam type="xquery" name="xml.xml">
	XQuery
	</sam>
```

# File Dependencies

You can see some file dependencies with the following. This is `xquery` processor to create graphs from XML data. For example, this creates a graph of all the included sections in a file under MarkupControl by translating it to DotML:

```
	<sam type="dotml" name="svg.xml" graphname="ideas">
	<sam type="xquery" name="graph.xml">
	xquery version "3.0";
	let $idea := fn:doc("xmldb:exist:///db/sam/output/ideas.md")
	return element dotml:graph {
		namespace dotml {"http://www.martin-loetzsch.de/DOTML"},
		namespace xsi {"http://www.w3.org/2001/XMLSchema-instance"},

		attribute file-name { "ideas" },
		attribute rankdir { "LR" },
		element dotml:node {
			attribute id  {"ideasmd"},
			attribute label {"ideasmd"},
			attribute fontsize { 9 },
			attribute font { "Arial" }
		},
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
```

# ToDo

 * Pull code from extractblocks.sh into a script that processes the blocks in a single file.
 * Extract a block given a name or all blocks in a file.