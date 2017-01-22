## How to use APIKit + Himotoki
Example using APIKitExt to combine APIKit and Himotoki.
Note that a complete example is available at [Himotoki Sample folder](https://github.com/DTVD/APIKitExt/tree/master/Example/Himotoki%20Sample).

### Model (Himotoki)
Our model file will follow normal Himotoki's guide.
```swift
struct Repo {
    var id: Int
    var fullName: String
    var avatar: String
    var stargazersCount: Int
}

extension Repo: Decodable {
    static func decode(_ e: Extractor) throws -> Repo {
        return try Repo(
            id: e <| "id",
            fullName: e <| "full_name",
            avatar: e <| ["owner", "avatar_url"],
            stargazersCount: e <| "stargazers_count"
        )
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
