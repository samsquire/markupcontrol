I am a post. This is my text. I like text very much,
yesiree! 

Should be ignored
<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:="http://samsquire.com/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <div typeof="rdfs:Resource" about="http://samsquire.com/">
    <div rel=":hasIdea" resource="http://samsquire.com/Dashboard"></div>
    <div rel=":hasIdea" resource="http://samsquire.com/LifeEngineDashboard"></div>
    <div rel=":hasIdea" resource="http://samsquire.com/MagazineDashboard"></div>
    <div rel=":hasIdea" resource="http://samsquire.com/EncryptionServer"></div>
    <div rel=":hasIdea" resource="http://samsquire.com/OpenEmailMetadata"></div>
  </div>
</div>


```
This is revised now cool and YEAH
MAN!yes. 
```

	First
	
	Inner text
	
		Inner inner text
	
	
	Outer text
	
	Second


```
I have been updated
```

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

Some ideas I have:

PREFIX : <http://samsquire.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?subject 
        WHERE { ?subject a :Idea . }
package lifeengine.dashboard 
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
