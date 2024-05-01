# LuvIT
LuvIt assessment

## Installation
1. Clone the repository
```
git clone git@github.com:AlphaArtrem/dcob.git
```
2. Setup firebase with ```com.example.luvit``` project
```
flutterfire configure -a com.example.luvit -i com.example.luvit --project=assinmentluvit --platforms=android,ios -y
```
3. Make sure ```config/config.json``` exists

4. Fetch pub dependencies for Flutter and run the app.
```
flutter pub get
flutter run --dart-define-from-file=configs/config.json
```
5. Build project
```
flutter build apk --release --dart-define-from-file=configs/config.json
```