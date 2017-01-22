## How to use APIKit + JASON
Example using APIKitExt to combine APIKit and JASON.
Note that a complete example is available at [JASON Sample folder](https://github.com/DTVD/APIKitExt/tree/master/Example/JASON%20Sample).

### Model (JASON)
Our model file will follow normal JASON's guide.
```swift
private extension JSONKeys {
    static let id = JSONKey<Int>("id")
    static let fullName = JSONKey<String>("full_name")
    static let stargazersCount = JSONKey<Int>("stargazers_count")
}

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: JASONable {
    init?(data: JSON) {
        id = data[.id]
        fullName = data[.fullName]
        stargazersCount = data[.stargazersCount]
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
