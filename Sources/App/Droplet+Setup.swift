@_exported import Vapor

extension Droplet {
	
	// MARK: Functions
	
    public func setup() throws {
        let routes = Routes(view)
		
		try collection(routes)
    }
	
}
