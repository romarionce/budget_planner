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
                    'Logremos el éxito financiero juntos',
                    style: tTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '¡Conviértete en un experto financiero mientras viajas! ¡Adiós a la incertidumbre financiera!',
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
                          "Continuar",
                          style:
                              tTheme.titleMedium!.copyWith(color: Colors.green),
                        )),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Condiciones de uso",
                          style: TextStyle(color: Colors.white)),
                      Text('  |  ', style: TextStyle(color: Colors.white)),
                      Text("Uso de datos",
                          style: TextStyle(color: Colors.white)),
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
