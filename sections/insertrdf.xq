<sam name="insertrdf.xq" type="xquery">
		declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
		declare default element namespace "http://samsquire.com/";
		(: Query begins :)
		(: Query begins :)
		(: Query begins :)
		let $rdf :=&lt;rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://samsquire.com/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsd="http://www.w3.org/2001/XMLSchema#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/"&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/MagazineDashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/LifeEngineDashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/Dashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/OpenEmailMetadata"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/EncryptionServer"/&gt;
  &lt;/rdf:Description&gt;
&lt;/rdf:RDF&gt;

		for $idea in $rdf//hasIdea return &lt;a href="{$idea/@rdf:resource}"&gt;Idea&lt;/a&gt;
</sam>
