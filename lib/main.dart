import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worker_manager/worker_manager.dart';

import 'core/app/controllers/core_controller.dart';
import 'core/app/views/root.dart';
import 'core/utils/ui_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppUiUtil.autoRotateOff();
  final core = Get.put(CoreController());
  runApp(TuringTechApp(core: core));

  /// this is for an isolate (a kind of thread) used for image processing
  /// don't remove this, otherwise the app will crash
  await Executor().warmUp();
}
