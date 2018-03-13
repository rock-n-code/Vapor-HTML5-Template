import LeafProvider

extension Config {
	
	// MARK: Functions
	
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [JSON.self, Node.self]

        try setupProviders()
    }
	
	// MARK: Helpers
	
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(LeafProvider.Provider.self)
    }
	
}
