// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class RepositoryMethodsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query repositoryMethods($login: String!) {
      repositoryOwner(login: $login) {
        __typename
        login
        repositories(last: 100) {
          __typename
          nodes {
            __typename
            name
            primaryLanguage {
              __typename
              name
            }
            stargazers {
              __typename
              totalCount
            }
            isFork
          }
        }
      }
      viewer {
        __typename
        login
      }
    }
    """

  public let operationName: String = "repositoryMethods"

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repositoryOwner", arguments: ["login": GraphQLVariable("login")], type: .object(RepositoryOwner.selections)),
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repositoryOwner: RepositoryOwner? = nil, viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "repositoryOwner": repositoryOwner.flatMap { (value: RepositoryOwner) -> ResultMap in value.resultMap }, "viewer": viewer.resultMap])
    }

    /// Lookup a repository owner (ie. either a User or an Organization) by login.
    public var repositoryOwner: RepositoryOwner? {
      get {
        return (resultMap["repositoryOwner"] as? ResultMap).flatMap { RepositoryOwner(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repositoryOwner")
      }
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct RepositoryOwner: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Organization", "User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositories", arguments: ["last": 100], type: .nonNull(.object(Repository.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeOrganization(login: String, repositories: Repository) -> RepositoryOwner {
        return RepositoryOwner(unsafeResultMap: ["__typename": "Organization", "login": login, "repositories": repositories.resultMap])
      }

      public static func makeUser(login: String, repositories: Repository) -> RepositoryOwner {
        return RepositoryOwner(unsafeResultMap: ["__typename": "User", "login": login, "repositories": repositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
            GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
            GraphQLField("isFork", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, primaryLanguage: PrimaryLanguage? = nil, stargazers: Stargazer, isFork: Bool) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "stargazers": stargazers.resultMap, "isFork": isFork])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
            }
          }

          /// A list of users who have starred this starrable.
          public var stargazers: Stargazer {
            get {
              return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
            }
          }

          /// Identifies if the repository is a fork.
          public var isFork: Bool {
            get {
              return resultMap["isFork"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isFork")
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Language"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Stargazer: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["StargazerConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }
    }
  }
}
