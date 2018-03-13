import Vapor
import HTTP

/// Here we have a controller that helps facilitate
/// creating typical REST patterns
final class HelloController: ResourceRepresentable {
	
	// MARK: Properties
	
    let renderer: ViewRenderer
	
	// MARK: Initialisations
	
    init(_ renderer: ViewRenderer) {
        self.renderer = renderer
    }
	
	// MARK: Functions
	
    /// GET /hello
    func index(_ request: Request) throws -> ResponseRepresentable {
		let parameters = ["name": "World"]
		
        return try renderer.make("hello", parameters, for: request)
    }
    
    /// GET /hello/:string
    func show(_ request: Request, _ string: String) throws -> ResponseRepresentable {
		let parameters = ["name": string]
		
        return try renderer.make("hello", parameters, for: request)
    }

    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this 
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
            index: index,
            show: show
        )
    }
	
}
