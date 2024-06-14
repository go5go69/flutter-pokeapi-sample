<img src="https://github.com/go5go69/poke-match/blob/docs/update_readme/assets/images/poke_match_logo.png" width="100%">

学習用レポジトリ  
「Poke Match」はPokeAPIからポケモンをランダムに取得し表示、マッチング対象のポケモンをTinder風のUI/UXで選り分けられます。

![](https://github.com/go5go69/poke-match/blob/docs/update_readme/assets/images/app_image.GIF)

## Getting Started
このFlutterプロジェクトにはfvmを利用しいています。  
`fvm flutter pub get`  
を実行してください。  

## Features
- ホーム画面ではスワイプでマッチング対象を選り分けられます。
  - Right: LIKE（20%マッチ）
  - Up: SUPER LIKE（100%マッチ）
  - Left or Down: NOPE
- マッチしたポケモンのリストを表示

## Architecture
```
lib
├── constants/
├── core/
│   ├── network/
│   └── state/
├── data/
│   ├── repositories/
│   └── services/
├── domain/
│   └── models/
├── enums/
├── presentations/
│   ├── view_models/
│   └── views/
│       └── widgets/
├── themes/
└── main.dart
```

## Author
https://zenn.dev/go5go69

## Refarences
https://pokeapi.co/  
https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/  
