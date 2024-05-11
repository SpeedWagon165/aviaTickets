class OfferList {
  List<Offer> offers;

  OfferList({required this.offers});

  factory OfferList.fromJson(Map<String, dynamic> json) {
    var list = json['offers'] as List;
    List<Offer> offersList = list.map((i) => Offer.fromJson(i)).toList();
    return OfferList(offers: offersList);
  }
}

class Offer {
  int id;
  String title;
  String town;
  Price price;

  Offer(
      {required this.id,
      required this.title,
      required this.town,
      required this.price});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      town: json['town'],
      price: Price.fromJson(json['price']),
    );
  }
}

class Price {
  int value;

  Price({required this.value});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      value: json['value'],
    );
  }
}
