import 'package:budget_planner/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tTheme = Get.textTheme;
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/onboard.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Let\'s Achieve Financial Success Together',
                    style: tTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Become a financial expert on the go! Bid farewell to financial uncertainty!',
                    style: tTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20, bottom: 60),
                    child: FilledButton(
                        onPressed: controller.toMainPage,
                        child: Text(
                          "Continue",
                          style:
                              tTheme.titleMedium!.copyWith(color: Colors.green),
                        )),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Terms of use",
                          style: TextStyle(color: Colors.white)),
                      Text('  |  ', style: TextStyle(color: Colors.white)),
                      Text("Data usage", style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
