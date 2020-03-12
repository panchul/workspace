# F#

---

Tons of unnecessary function wrapping. Ugly code made probably by Java or C# people.
https://docs.microsoft.com/en-us/dotnet/fsharp/tutorials/asynchronous-and-concurrent-programming/async

---

Sample of high-level web access, hiding all the client/server stuff away:

    open System
    open System.Net

    let fetchHtmlAsync url =
        async {
            let uri = Uri(url)
            use webClient = new WebClient()
    
            // Execution of fetchHtmlAsync won't continue until the result
            // of AsyncDownloadString is bound.
            let! html = webClient.AsyncDownloadString(uri)
            return html
        }
    
    let html = "https://dotnetfoundation.org" |> fetchHtmlAsync |> Async.RunSynchronously
    printfn "%s" html

---
 