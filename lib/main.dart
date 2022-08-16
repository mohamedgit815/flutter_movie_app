import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_api_app/Core/Services/service_locator.dart';
import 'package:flutter_architecture_api_app/Core/Utils/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<void> main() async {

  ServiceLocator().init();

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);


  runApp(const ProviderScope(child: MyApp()));

}

