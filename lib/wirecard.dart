import 'dart:async';

import 'package:flutter/services.dart';

import 'card-credit.dart';

class Wirecard {

  static const MethodChannel _channel = const MethodChannel('wirecard');

  Future<String?> encryptCard(CardCredit cardCredit) async {
    var card = <String, dynamic>{
      'publicKey': cardCredit.publicKey,
      'number': cardCredit.number,
      'expirationMonth': cardCredit.expirationMonth,
      'expirationYear': cardCredit.expirationYear,
      'cvc': cardCredit.cvc
    };

    return await _channel.invokeMethod('encryptCard', card);
  }
}
