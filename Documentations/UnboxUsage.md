## How to use APIKit + Unbox
Example using APIKitExt to combine APIKit and Unbox.
Note that a complete example is available at [Unbox Sample folder](https://github.com/DTVD/APIKitExt/tree/master/Example/Unbox%20Sample).

### Model (Unbox)
Our model file will follow normal Unbox's guide.
```swift
struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: Unboxable {
    init(unboxer: Unboxer) throws {
        id = try unboxer.unbox(key: "id")
        fullName = try unboxer.unbox(key: "full_name")
        stargazersCount = try unboxer.unbox(key: "stargazers_count")
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
