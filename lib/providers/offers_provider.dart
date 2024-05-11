import 'package:dio/dio.dart';

import '../models/music_offers_model.dart';

Future<List<Offer>> fetchOffers() async {
  var dio = Dio();
  try {
    final response = await dio
        .get('https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de');
    if (response.statusCode == 200) {
      List<dynamic> offersJson = response.data['offers'];
      return offersJson.map((json) => Offer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load offers');
    }
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}
