import 'package:quiz_app/temp_service.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TempService.getInstance().then((value) async {});
  await TempService.instance.loadCategories();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
  // runApp(App());
}
