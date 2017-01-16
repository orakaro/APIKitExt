## How to use APIKit + ObjectMapper
Example using APIKitExt to combine APIKit and ObjectMapper.
Note that a complete example is available at [Object Mapper Sample folder](https://github.com/DTVD/APIKitExt/tree/master/Example/ObjectMapper%20Sample).

### Model (ObjectMapper)
Our model file will follow normal ObjectMapper's guide.
```swift
struct Repo: Mappable {
    var id: Int!
    var fullName: String!
    var stargazersCount: Int!

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id              <- map["id"]
        fullName        <- map["full_name"]
        stargazersCount <- map["stargazers_count"]
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
