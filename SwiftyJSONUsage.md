## How to use APIKit + SwiftyJSON
Example using APIKitExt to combine APIKit and SwiftyJSON.
Note that a complete example is available at [SwiftyJSON Sample folder](https://github.com/DTVD/APIKitExt/tree/master/Example/SwiftyJSON%20Sample).

### Model (SwiftyJSON)
Our model file will follow normal SwiftyJSON's guide.
```swift
struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: SwiftyJSONable {
    init?(data: JSON) {
        id = data["id"].intValue
        fullName = data["full_name"].stringValue
        stargazersCount = data["stargazers_count"].intValue
    }
}
```

### Defining request type (APIKit + APIKitExt)
With APIKit used along with APIKitExt, we can parse Json result and immediately return Response type :tada:
```swift
struct RepoRequest: Request {
    typealias Response = [Repo]
    // ...
}

extension RepoRequest {
    func response(from object: Any, urlResponse: HTTPURLResponse) -> [Repo] {
        guard
            let tree = object as? [String: Any],
            let items = tree["items"],
            let repos = try? Repo.mapArray(items) // <- notice mapArray method here !
        else {
            return []
        }
        return repos
    }
}
```

### Supported method
Here is list of supported methods
* `mapObject` : map a json object to a model object.
* `mapArray` : map a json object to a list of model objects.
