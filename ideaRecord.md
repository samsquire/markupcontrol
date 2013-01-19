xquery version "3.0";

let $subs := fn:doc('xmldb:exist:///sam/sources/sources.subs')
let $replacements := fn:doc('xmldb:exist:///sam/sources/replacements.subs') 

return (
for $replacement in $replacements//sam/node() 
    for $old in $subs//*[name(.) eq name($replacement)]
        let $new := text { ($replacement/text())}
        return ((update insert $new preceding $old), update delete $old)
, $subs
)
