#Name - SetUserPrincipal-V1.0.ps1
#Autor: Torben Blankertz
#Datum: 2024-06-19
# Verson 1.0'

$WorkplaceID = "DEINE WORKSPACE ID HIER"
$DataSetID = "Deine DATASET ID HIER"

$TenantID = "Deine TENANT ID HIER"
$ClientID = "Deine CLIENT ID HIER"
$ClientSecret = "Deine CLIENT SECRET HIER"

$URL = "groups/$WorkplaceID/datasets/$DatasetID/Default.TakeOver"

# Secret in Secure String umwandeln
$SecurePassword = ConvertTo-SecureString $ClientSecret -AsPlainText -Force

# Credential erstellen
$Credential = New-Object System.Management.Automation.PSCredential(
    $ClientID,
    $SecurePassword
)

# Anmeldung bei Power BI
Connect-PowerBIServiceAccount -ServicePrincipal -Tenant $TenantID -Credential $Credential

#TakeOver Durchführen
try {
    Invoke-PowerBIRestMethod -Url $URL -Method Post -Body "{}"
}
catch {
    $_.Exception.Message
}
