# Wirecard Grampic

hash do cartao

# instalação
```
dependencies:
  wirecard_grampic: ^1.0.0
```

# Exemplo em codigo
```
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:wirecard/wirecard.dart';
import 'package:wirecard/card-credit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String PUBLIC_KEY = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    CardCredit credit = CardCredit(PUBLIC_KEY);
    credit.cvc = "1234";
    credit.number = "376449047333005";
    credit.expirationMonth = "12";
    credit.expirationYear = "2022";

    String hash = await Wirecard().encryptCard(credit);
    print(hash);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}
}```


## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).

