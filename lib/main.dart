import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/src/app.dart';

void main()async {
  await GetStorage.init();
  runApp(App());
}
