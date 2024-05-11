import 'package:aviabileti/pages/widgets/bottom_bar.dart';
import 'package:aviabileti/pages/widgets/music_offer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/music_offer_bloc/music_offers_bloc.dart';
import '../models/music_offers_model.dart';
import '../themes/text_styles.dart';
import '../utilities/cyrillic_formatter.dart';
import 'buy_tickets_pop_up.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: BlocProvider(
          create: (_) => OffersBloc()..add(LoadOffers()),
          child:
              BlocBuilder<OffersBloc, OffersState>(builder: (context, state) {
            if (state is OffersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OffersLoaded) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 75.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55),
                      child: Text(
                        'Поиск дешевых авиабилетов',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.homeHeader,
                      ),
                    ),
                    const SizedBox(
                      height: 45.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11.0,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFF2F3035),
                        child: SizedBox(
                          height: 140,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(16.0),
                              color: const Color(0xFF3E3F43),
                              child: InkWell(
                                onTap: () {
                                  buyTicketsPopUp(
                                    context,
                                    initialText: controller.text,
                                  );
                                },
                                borderRadius: BorderRadius.circular(16.0),
                                child: SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          child: SvgPicture.asset(
                                            'assets/images/search_icon.svg',
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 310,
                                              child: TextField(
                                                controller: controller,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "Откуда - Москва",
                                                  hintStyle:
                                                      AppTextStyles.hintStyle,
                                                  border: InputBorder.none,
                                                ),
                                                style: AppTextStyles.inputText,
                                                inputFormatters: [
                                                  CyrillicInputFormatter()
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 0.5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              child: Container(
                                                height: 0.8,
                                                width: 320,
                                                color: const Color(0xFF5E5F61),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Куда - Турция',
                                              style: AppTextStyles.hintStyle,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: Text(
                        'Музыкально отлететь',
                        style: AppTextStyles.homeHeader2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.offers.length,
                        itemBuilder: (context, index) {
                          Offer offer = state.offers[index];
                          return musicOfferItem(
                              id: offer.id,
                              title: offer.title,
                              town: offer.town,
                              price: offer.price.value);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is OffersError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("No data available"));
            }
          }),
        ),
        backgroundColor: const Color(0x000c0c0c),
        bottomNavigationBar: const NavigationBarAvia());
  }
}
