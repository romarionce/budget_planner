import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late Box<int> themeBox;
  late Box<bool> launch;

  ThemeMode getTheme() {
    var themeIndex = themeBox.get('theme') ?? 0;
    return ThemeMode.values[themeIndex];
  }

  Future<void> setTheme(ThemeMode mode) => themeBox.put('theme', mode.index);

  bool isFirstLanuch() => launch.get('launch') ?? true;
  Future<void> setFirstLaunch() => launch.put('launch', false);

  Future<StorageService> init() async {
    await Hive.initFlutter();
    themeBox = await Hive.openBox<int>('theme');
    launch = await Hive.openBox<bool>('launch');
    return this;
  }

  Future<void> clearData() => Hive.deleteFromDisk().then((value) => init());
}
