Get-ChildItem .\questions -Filter *.json -File |
Where-Object { $_.Name -ne 'index.json' } |
Sort-Object Name |
Select-Object -ExpandProperty Name |
ConvertTo-Json |
Out-File .\questions\index.json -Encoding UTF8

