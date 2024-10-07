$myTeamsWebHook = 'https://prod-22.centralindia.logic.azure.com:443/workflows/ad1b358eb8d54bfd9d34ebdabe2df150/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=aQPRKvlSgjxesYctqohRxhy3_JLGmu1CiBM_CS1dMaI'

# Read and convert JSON file content to a PowerShell object
$json = Get-Content -Path .\Src\SendMsgChannel\content.json | ConvertFrom-Json

# Convert the PowerShell object back to JSON string format
$jsonBody = $json | ConvertTo-Json -Depth 10

# Invoke the REST method with the correct JSON string body
$response = Invoke-RestMethod -Method Post -Uri $myTeamsWebHook -Body $jsonBody -ContentType 'application/json' -UseBasicParsing

# Print the response for debugging
$response
