![Screenshot](https://github.com/esmaeil-ahmadipour/flutter_glass/blob/master/img/banner.png?raw=true "Flutter Glass Banner")
# Flutter Glass plugin

A flutter package that adds the possibility of making glass containers to your app.

![Screenshot](https://github.com/esmaeil-ahmadipour/flutter_glass/blob/master/img/flutter_glass.gif?raw=true "Flutter Glass Demo")

### Installation

To use this plugin, add flutter_glass in your `pubspec.yaml`

```
dependencies:
  flutter_glass: ^0.0.2
```

Or install automatically using this command

```
$ flutter pub add flutter_glass
```

### Super simple to use

```dart
import 'package:flutter_glass/flutter_glass.dart';

...
    GlassContainer(
      height: 200,
      width: 360,
      children: [
        Text("Sample Text"),
      ],
    ),
...
```

### And bonus widget 🎉

```dart
import 'package:flutter_glass/flutter_glass.dart';

...
    GradiantContainer(
      child:  // Something ...It can be a glass container ! ,
    ),
...

```

### License

This SDK is available under the MIT license.
