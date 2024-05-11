import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/music_offers_model.dart';
import '../../providers/offers_provider.dart';

part 'music_offers_event.dart';

part 'music_offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersLoading()) {
    on<LoadOffers>(_onLoadOffers);
  }

  Future<void> _onLoadOffers(
      LoadOffers event, Emitter<OffersState> emit) async {
    try {
      List<Offer> offers = await fetchOffers();
      emit(OffersLoaded(offers));
    } catch (e) {
      emit(OffersError(e.toString()));
    }
  }
}
