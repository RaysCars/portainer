cat .\portainer-templates.txt | 
   Foreach-Object { $a = curl.exe $_  | convertFrom-Json
      $b = $a.templates | ConvertTo-Json | out-String
      $global:c = "{
   `"version`": `"2`",
   `"templates`":$b
}"

   } #foreach
   
   $c | 
      Out-String | 
         Set-Content .\portainer_templates.json