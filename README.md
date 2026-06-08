# libgnss-rinex-swift

`libgnss-rinex-swift` is a pure Swift implementation of GNSS RINEX (Receiver Independent Exchange Format) parsing and generation capabilities, originally adapted from the `libgnss-rinex` C library.

## Features

- **Strict RINEX Parsing:** Robust decoding of RINEX observation and navigation files.
- **RINEX Generation:** Capable of reconstructing RINEX files with proper spacing and standard data formatting.
- **Native Swift:** Built entirely in Swift 6, utilizing native primitives, standard libraries, and modern paradigms.
- **Swift Logging:** Integrated with Apple's official `swift-log` for zero-overhead, highly configurable logging.
- **Cross-Platform:** Uses Swift Package Manager (SPM) and is broadly compatible across macOS, iOS, Linux, and Windows.

## Documentation

This project uses Swift DocC for comprehensive documentation. You can preview the documentation locally by running:

```bash
swift package --disable-sandbox preview-documentation --target GNSSRinex
```

## Structure

- **`Sources/GNSSRinex`**: The core library containing all data structures, parsing logic, and string generators.
- **`Tests/GNSSRinexTests`**: Unit tests verifying bit manipulation, CRC checks, parsing routines, etc.
- **`Tests/rinex_loopback`**: An integration test executable that parses and regenerates a provided test vector to ensure high-fidelity data reconstruction.

## Installation

Please see [INSTALL.md](INSTALL.md) for detailed instructions on how to integrate this library into your projects.
