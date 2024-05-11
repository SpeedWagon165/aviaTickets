part of 'music_offers_bloc.dart';

abstract class OffersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadOffers extends OffersEvent {}
