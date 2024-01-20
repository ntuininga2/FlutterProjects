import 'package:architecture/features/card_selector/domain/entities/credit_card.dart';

class CreditCardModel extends CreditCardEntity{
  const CreditCardModel({
    int ? id,
    String ? name,
    double ? balance
  });

  factory CreditCardModel.fromJson(Map <String, dynamic> map) {
    return CreditCardModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      balance: map['balance'] ?? ""
    );
  }
}