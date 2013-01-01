<document>I am a post. This is my text. I like text very much,
yesiree! 

Should be ignored
<sam type="n3" name="myideas.rdfa">
<sam type="data" name="ideasearch.sparql"><![CDATA[
PREFIX : <http://samsquire.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
CONSTRUCT   { <http://samsquire.com/> :hasIdea ?ideas }
WHERE { ?ideas a :Idea  }
]]>
</sam>
</sam>


```
<sam name="code.py">This is revised now cool and YEAH
MAN!</sam>yes. 
```
<nested>
	First
	<nested>
	Inner text
	<nested>
		Inner inner text
	</nested>
	
	Outer text
	</nested>
	Second
</nested>

```
<sam name="another.js">I have been updated</sam>
```
<sam name="animals.sparql" type="sparql">
<![CDATA[
PREFIX rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:   <http://www.w3.org/2000/01/rdf-schema#>
PREFIX ex:   <http://example.org/>
PREFIX zoo:   <http://example.org/zoo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

INSERT DATA {

ex:dog1    rdf:type         ex:animal .
ex:cat1    rdf:type         ex:cat .
ex:cat     rdfs:subClassOf  ex:animal .
zoo:host   rdfs:range       ex:animal .
ex:zoo1    zoo:host         ex:cat2 .
ex:cat3    owl:sameAs       ex:cat2 .

}
]]>
</sam>

<sam type="n3" name="n3.n3"><![CDATA[
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix gr: <http://purl.org/goodrelations/v1#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix vcard: <http://www.w3.org/2006/vcard/ns#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<#company> a gr:BusinessEntity;
    rdfs:label "Hepp Space Ventures Inc.";
    gr:legalName "Hepp Space Ventures Inc.";
    gr:seeks <#mydemand>;
    vcard:adr <#address>;
    vcard:fn "Hepp Space Ventures Inc.";
    vcard:tel "+49-89-6004-0"^^xsd:string;
    vcard:url <http://www.heppnetz.de/>;
    foaf:page <>,
        <http://www.heppnetz.de/> .

<#UnitPriceSpecification> a gr:UnitPriceSpecification;
    gr:hasCurrency "EUR"^^xsd:string;
    gr:hasMaxCurrencyValue "200"^^xsd:float .

<#address> a vcard:Address;
    vcard:country-name "Germany";
    vcard:locality "Neubiberg";
    vcard:postal-code "85577"^^xsd:string;
    vcard:region "Bavaria";
    vcard:street-address "1234 Hepp Road" .

<#mydemand> a gr:Offering;
    gr:hasBusinessFunction gr:Sell;
    gr:hasPriceSpecification <#UnitPriceSpecification>;
    gr:includes [ a gr:SomeItems;
            rdfs:label "A TV set with at least 30 CMT screen-size";
            rdfs:comment "A TV set with at least 30 CMT screen-size";
            foaf:page <> ];
    gr:validFrom "2009-07-20T00:00:00Z"^^xsd:dateTime;
    gr:validThrough "2010-07-20T00:00:00Z"^^xsd:dateTime;
    foaf:page <> .
]]>
</sam>

Some ideas I have:
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

:NoKnownImplementations a owl:Class;
        rdfs:subClassOf :IdeaStatus.
        
:AttemptedImplementation a owl:Class;
        rdfs:subClassOf :IdeaStatus.

:EncryptionServer a owl:Class; a :Idea.
:OpenEmailMetadata a owl:Class; a :Idea.
:Dashboard a owl:Class; rdfs:subClassOf :Idea.
:LifeEngineDashboard a :Dashboard.
:MagazineDashboard a :Dashboard.
}
]]>
</sam><sam type="data" name="currentideas.sparql">
<![CDATA[
PREFIX : <http://samsquire.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?subject 
        WHERE { ?subject a :Idea . }
]]>
</sam>
<sam type="rule" name="page.drl">
<![CDATA[package lifeengine.dashboard 
rule "I like crisps tuesdays"
when
        UserCommand(message.equals("crispst")) from entry-point "Remote Users"
then
        System.out.println("Crisps are tgood");
end

rule "I like cheese everyday such as roquefort"
when
        $uc : UserCommand(message == "roquefort") from entry-point "Remote Users"
then
        System.out.println($uc.getMessage() + " is good");
end

rule "oli sent me an idea"
when
        UserCommand(message == "oi") from entry-point "Remote Users"
then
        System.out.println("Oli sent me an idea :-)");
end

]]>
</sam></document>
