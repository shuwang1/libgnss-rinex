# Installation

`libgnss-rinex-swift` is distributed as a standard Swift Package. 

## Integrating into a Swift Project

To add `libgnss-rinex-swift` to your Swift project, you can use Swift Package Manager via `Package.swift` or directly within Xcode.

### Using Swift Package Manager (`Package.swift`)

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/libgnss-rinex-swift.git", branch: "main") // Update with actual URL / tag
]
```

Then, add `GNSSRinex` to the dependencies of the target you wish to use it in:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "GNSSRinex", package: "libgnss-rinex-swift")
    ]
)
```

### Using Xcode

1. Open your project in Xcode.
2. Go to **File** > **Add Package Dependencies...**
3. Enter the repository URL in the search bar.
4. Select the versioning rule you wish to apply.
5. Click **Add Package**.

## Building from Source

To clone the repository and build the library locally (e.g., for development or running tests), use the Swift command-line interface.

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/libgnss-rinex-swift.git
   cd libgnss-rinex-swift
   ```

2. Build the project:
   ```bash
   swift build
   ```

3. Run the unit test suite:
   ```bash
   swift test
   ```

4. Run the loopback integration test:
   ```bash
   bash Tests/rinex_loopback/run_test.sh .build/debug
   ```
