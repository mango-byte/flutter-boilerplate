# flutterapp

## Run project:
- To run in development env:   ``flutter run -t lib/main_dev.dart --flavor dev``
- To run in staging env:       ``flutter run -t lib/main_stg.dart --flavor stg``
- To run in production env:    ``flutter run -t lib/main_prod.dart --flavor prod``
- **NOTE:** To run in release mod, just add ``--release`` at the end of command.

## Build project:
1. Android:
    - Development:  ``flutter build apk -t lib/main_dev.dart --flavor dev --release``
    - Staging:      ``flutter build apk -t lib/main_stg.dart --flavor stg --release``
    - Production:   ``flutter build apk -t lib/main_prod.dart --flavor prod --release``
    - **NOTE:** Make sure you have config the key.properties for the build release with keystore. The keystore is already at the ``android/app`` already. The directory for the apk file will be in the project ``build/app/outputs/flutter-apk`` (this might change in the next future, check the terminal after build it will show you where the apk file is)

2. iOS:
    - Development:  ``flutter build ios -t lib/main_dev.dart --flavor dev --release && open ios/Runner.xcworkspace``
    - Staging:      ``flutter build ios -t lib/main_stg.dart --flavor stg --release && open ios/Runner.xcworkspace``
    - Production:   ``flutter build ios -t lib/main_prod.dart --flavor prod --release && open ios/Runner.xcworkspace``
    - **NOTE:** After

flutter run --flavor dev -t lib/main_dev.dart

flutter run --flavor staging -t lib/main_staging.dart
