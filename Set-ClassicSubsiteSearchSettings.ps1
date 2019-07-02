#This script sets the search center URL as well as the seach results page URL for a given site collection

function Set-ClassicWebSearchSettings ($web, $searchUrl, $inh, $showNav) {
    # Write-Host $web.Title $web.URL $searchUrl $inh $showNav
    Write-Host $web.Title ( $web.URL ) -ForegroundColor White
    Set-PnPPropertyBagValue -Web $web -Key SRCH_ENH_FTR_URL_SITE -Value $searchUrl
    Set-PnPPropertyBagValue -Web $web -Key SRCH_SB_SET_SITE `
        -Value '{"Inherit":$inh,"ResultsPageAddress":$searchUrl,"ShowNavigation":$showNav}'
}

function Set-PnPClassicSiteSearchSettings ($siteUrl, $searchResultsPageAbsoluteUrl, $inherit, $showNavigation, $recurse) {

    $cred = Get-Credential
    $ctx = Connect-PnPOnline -Url $siteUrl -Credentials $cred
    $web = Get-PnPWeb

    # in PnP PowerShell you don't ACTUALLY have to recurse. Just pass it as a parameter
    if ($recurse -eq $true) {
        $allSites = Get-PnPSubWebs -Recurse
    }

    $allSites += $web

    Write-Host "Setting values to: " $searchResultsPageAbsoluteUrl $inherit $showNavigation

    $allSites | ForEach-Object { 
        Set-ClassicWebSearchSettings $_ $searchResultsPageAbsoluteUrl $inherit $showNavigation
    }
}

# Example
Set-PnPClassicSiteSearchSettings "https://simedev.sharepoint.com/sites/valo1.15.1/" "/search/pages/results.aspx" $true $true $false