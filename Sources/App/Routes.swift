import Vapor

final class Routes: RouteCollection {
	
	// MARK: Constants
	
	private struct View {
		static let index = "index"
	}
	
	private struct Resource {
		static let hello = "hello"
		static let info = "info"
	}

	// MARK: Properties
	
    let renderer: ViewRenderer
	
	// MARK: Initialisations
	
    init(_ renderer: ViewRenderer) {
        self.renderer = renderer
    }
	
	// MARK: Functions
	
    func build(_ builder: RouteBuilder) throws {
        /// GET /
        builder.get { req in
            return try self.renderer.make(View.index)
        }
        
        /// GET /hello/...
        builder.resource(Resource.hello, HelloController(renderer))
        
        // response to requests to /info domain
        // with a description of the request
        builder.get(Resource.info) { req in
            return req.description
        }
        
    }
}
