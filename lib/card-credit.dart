class CardCredit {
  String publicKey;

  String expirationMonth;
  String expirationYear;
  String number;
  String cvc;

  CardCredit(this.publicKey,
      {this.number, this.expirationMonth, this.expirationYear, this.cvc});
}
