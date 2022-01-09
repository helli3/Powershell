$analizaLOKALIZACJA="C:\TEMP\"

$grupyAD =
'1-GROUP',
'2-GROUP',
'3-GROUP',
'4-GROUP'
$grupyAD.count


foreach($grupaAD in $grupyAD){

Get-ADGroupMember $grupaAD | Select name, @{N="grupaAD";E={$grupaAD -join ","}}| Export-Csv -Append -Path $analizaLOKALIZACJA"WORKSTATIONSIAS.csv" -Encoding UTF8 -NoTypeInformation -Delimiter ';'


}
