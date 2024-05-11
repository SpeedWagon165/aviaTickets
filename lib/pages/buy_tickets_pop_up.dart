import 'package:flutter/material.dart';

import '../themes/text_styles.dart';
import '../utilities/cyrillic_formatter.dart';

void buyTicketsPopUp(BuildContext context, {initialText}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        TextEditingController controller = TextEditingController();
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.935,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF242529),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: 42.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                            color: const Color(0xFF5E5F61),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 310,
                            child: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: "Откуда - Москва",
                                hintStyle: AppTextStyles.hintStyle,
                                border: InputBorder.none,
                              ),
                              style: AppTextStyles.inputText,
                              inputFormatters: [CyrillicInputFormatter()],
                            ),
                          ),
                          const SizedBox(
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              height: 0.8,
                              width: 320,
                              color: const Color(0xFF5E5F61),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      });
}
