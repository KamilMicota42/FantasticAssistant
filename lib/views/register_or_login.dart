import 'package:fantastic_assistant/cubits/MainNavigation/main_navigation.dart';
import 'package:fantastic_assistant/utils/styles.dart';
import 'package:fantastic_assistant/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:fantastic_assistant/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterOrLoginView extends StatefulWidget {
  const RegisterOrLoginView({super.key});

  @override
  State<RegisterOrLoginView> createState() => _RegisterOrLoginViewState();
}

class _RegisterOrLoginViewState extends State<RegisterOrLoginView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<String> titlesList = ['Create character', 'Take notes', 'Make a story'];
    List<String> descriptionList = [
      'Forge mighty heroes and craft intricate backstories, where imagination meets customization.',
      'Unravel secrets, and keep track of essential details, ensuring no treasure or crucial plot point goes forgotten.',
      'Unleash epic narratives, shape destiny, and immerse yourself in a world of endless possibilities.'
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.roseRed,
            MyColors.black,
          ],
          stops: [0.2192, 0.6798],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 400,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayInterval: const Duration(seconds: 5),
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: [0, 1, 2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/assets/images/image$i.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          titlesList[i],
                          style: MyTextStyles.spaceGrotesk24regular400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          descriptionList[i],
                          style: MyTextStyles.spaceGrotesk16regular400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            width: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.animateToPage(0);
                    setState(() {});
                  },
                  child: _current == 0
                      ? Container(height: 4, width: 16, decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(20)))
                      : Container(height: 4, width: 8, decoration: BoxDecoration(color: MyColors.grey, borderRadius: BorderRadius.circular(20))),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.animateToPage(1);
                    setState(() {});
                  },
                  child: _current == 1
                      ? Container(height: 4, width: 16, decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(20)))
                      : Container(height: 4, width: 8, decoration: BoxDecoration(color: MyColors.grey, borderRadius: BorderRadius.circular(20))),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.animateToPage(2);
                    setState(() {});
                  },
                  child: _current == 2
                      ? Container(height: 4, width: 16, decoration: BoxDecoration(color: MyColors.white, borderRadius: BorderRadius.circular(20)))
                      : Container(height: 4, width: 8, decoration: BoxDecoration(color: MyColors.grey, borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
          ),
          Column(
            children: [
              DefaultButton(
                text: "Sign in",
                function: () {
                  BlocProvider.of<MainNavigationCubit>(context).setMainNavigationIndex(1);
                },
                width: MediaQuery.of(context).size.width - 50,
                height: 56,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account?',
                    style: MyTextStyles.spaceGrotesk16regular400,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Log in',
                      style: MyTextStyles.spaceGrotesk16regular500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
