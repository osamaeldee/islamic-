import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_project/Veiw/spleachpage.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Box? box;
Future<Box> openHivepox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationCacheDirectory()).path);
  }
  return Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  box = await openHivepox("osama");
  MobileAds.instance.initialize();
  Get.put(Verifications());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
