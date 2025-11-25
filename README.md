# DocCArchiveTransformer

The data files for ingesting DocC archives source from the [DocC repository](https://github.com/swiftlang/swift-docc/) of
the [Swift Project](https://swift.org/):

```
./Sources/SwiftDocC/SwiftDocC.docc/Resources/RenderNode.spec.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/IndexingRecords.spec.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/Metadata.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/RenderIndex.spec.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/Benchmark.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/Diagnostics.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/LinkableEntities.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/ThemeSettings.spec.json
./Sources/SwiftDocC/SwiftDocC.docc/Resources/Assets.json
```

swift run swift-openapi-generator generate --mode types --naming-strategy idiomatic \
   --output-directory Sources/DocCArchiveTransformer \
   ~/src/swift-project/swift-docc/Sources/SwiftDocC/SwiftDocC.docc/Resources/RenderNode.spec.json
