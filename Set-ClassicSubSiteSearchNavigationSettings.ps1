function Set-PnPClassicSiteSearchSettings ($siteUrl, $searchResultsPageAbsoluteUrl, $inherit, $showNavigation, $recurse) {

# get instance of site collection

$site = Get-SPSite $siteUrl



# iterate through all webs

foreach ($web in $site.AllWebs) {

  # check that we are not in the root web (only inherit search navigation for subsites)

  if($web.Id -ne $site.RootWeb.Id) {

    # # get the number of existing search navigation nodes

    # $count = $web.Navigation.SearchNav.Count

    # # use a classic for loop to iterate through the collection

    # for($i = 0; $i -lt $count; $i++) {

    #   # delete the 0th node

    #   $navItem = $web.Navigation.SearchNav[0];

    #   $node = $web.Navigation.SearchNav.Delete($navItem)

    # }



    # # iterate through the root navigation nodes

    # foreach($navitem in $site.RootWeb.Navigation.SearchNav) {

    #   # add the node to the search navigation collection

    #   $node = new-object -TypeName "Microsoft.SharePoint.Navigation.SPNavigationNode" -ArgumentList $navitem.Title, $navitem.Url, $true

    #   $node = $web.Navigation.SearchNav.AddAsLast($node)

    # }

    $web.Navigation.SearchNav.

    # update the web

    $web.Update()

  }

}
}