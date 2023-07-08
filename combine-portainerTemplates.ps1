$a = cat .\portainer-templates.txt | 
   Foreach-Object {
   curl.exe $_  | convertFrom-Json
   
} #foreach

   
$b = ($a.templates | ConvertTo-Json )
$c = "{
`"version`": `"2`",
`"templates`":$b 
}"

      
$c | Out-String | Set-Content .\portainer_templates.json