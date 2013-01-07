<sam type="xquery" name="maketable.xq">
xquery version "3.0";
declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare default element namespace "http://samsquire.com/";
declare namespace dc = "http://purl.org/dc/elements/1.1/";

let $ideaTable :=  &lt;rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://samsquire.com/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsd="http://www.w3.org/2001/XMLSchema#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/LifeEngineDashboard"&gt;
    &lt;dc:title&gt;LifeEngine Dashboard&lt;/dc:title&gt;
    &lt;dc:description/&gt;
    &lt;dc:title&gt;LifeEngineDashboard&lt;/dc:title&gt;
  &lt;/rdf:Description&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/MagazineDashboard"&gt;
    &lt;dc:title&gt;Magazine Dashboard&lt;/dc:title&gt;
    &lt;dc:description/&gt;
    &lt;dc:title&gt;MagazineDashboard&lt;/dc:title&gt;
  &lt;/rdf:Description&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/OpenEmailMetadata"&gt;
    &lt;dc:title&gt;Open Email Metadata&lt;/dc:title&gt;
    &lt;dc:description/&gt;
    &lt;dc:title&gt;OpenEmailMetadata&lt;/dc:title&gt;
  &lt;/rdf:Description&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/Dashboard"&gt;
    &lt;dc:description/&gt;
    &lt;dc:title&gt;Dashboard&lt;/dc:title&gt;
  &lt;/rdf:Description&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/EncryptionServer"&gt;
    &lt;dc:title&gt;Encryption Server&lt;/dc:title&gt;
    &lt;dc:description/&gt;
    &lt;dc:title&gt;EncryptionServer&lt;/dc:title&gt;
  &lt;/rdf:Description&gt;
  &lt;rdf:Description rdf:about="http://samsquire.com/"&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/MagazineDashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/LifeEngineDashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/Dashboard"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/OpenEmailMetadata"/&gt;
    &lt;hasIdea rdf:resource="http://samsquire.com/EncryptionServer"/&gt;
  &lt;/rdf:Description&gt;
&lt;/rdf:RDF&gt;
return (
    
for $idea in $ideaTable//hasIdea
    let $data := $ideaTable//rdf:Description[@rdf:about eq $idea/@rdf:resource]
    let $pageName := $data/dc:title/text()
    let $description := $data/dc:description/text()
    return (
        element tr {
            element td { $pageName},
            element td { $description }
        }    
        )
)
</sam>
