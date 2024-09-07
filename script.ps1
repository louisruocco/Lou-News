function Scrape-Page {
    param (
        [Parameter(Mandatory)]
        [string]$url,
        [string]$filterURL
    )

    $res = (invoke-webrequest $url).Links.href | Select-Object -Unique
    $filter = $filterURL
    $links = ($res | Select-String $filter -AllMatches).Matches
    $results = ($links | Where-Object {$_.Value -ne "/blog/content-type/announcements/" -and $_.Value -ne "/blog/" -and $_.Value -notlike "/blog/author*"}).Value
    $results[0..4]
}

$AzureNews = Scrape-Page -url "https://azure.microsoft.com/en-us/blog/content-type/announcements/" -filterURL "/blog/.*"
