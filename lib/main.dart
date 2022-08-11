import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:serpay/Categorya/Categoriya.dart';
import 'package:serpay/LogIn/LogIn/LogIn.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/Discount/DiscountProduct.dart';
import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/MainPage/Product/ProductChangeNotifier.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Profile/Profile/Profile.dart';
import 'package:serpay/Sebet/Sebet.dart';
import 'package:serpay/Servers/Servers.dart';
import 'package:serpay/darkMode/theme_services.dart';

import 'MainPage/MainChangeNoti.dart';
import 'MainPage/MainPagee/MainPage.dart';
import 'Profile/Profile/RadioButton.dart';
import 'darkMode/theme_provider.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrids();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<BannerIndex>(
        create: (
          BuildContext context,
        ) =>
            BannerIndex(0),
      ),
      ChangeNotifierProvider<ProductIndex>(
        create: (BuildContext context) => ProductIndex(0),
      ),
      ChangeNotifierProvider<RadioButton>(
        create: (BuildContext context) => RadioButton(""),
      ),
      ChangeNotifierProvider<Counter>(
        create: (BuildContext context) => Counter(0),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      )
    ], child: MaterialPageMain()),
  );
}

class MaterialPageMain extends StatelessWidget {
  const MaterialPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Colrs select = Colrs();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeServices().theme,
      //themeMode: ThemeMode.system,
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List hemmeSah = [];

  // This widget is the root of your application.
  @override
  void initState() {
    setState(() {});
    super.initState();

    Profile profile = Profile();
    MainPage sayfa1 = MainPage();
    Servers servers = Servers();
    Categoriya categoriya = Categoriya();
    Sebet sebet = Sebet();
    LogIn logIn = LogIn();
    hemmeSah = [sayfa1, servers, categoriya, sebet, logIn];
    CheckSignUp().dosyaOku().then((value) {

      if (value.toString().length == 4) {
        debugPrint(value.toString());
        hemmeSah = [sayfa1, servers, categoriya, sebet, profile];
      } else {
        debugPrint(value.toString());
        hemmeSah = [sayfa1, servers, categoriya, sebet, logIn];
      }
    });

    // dosyaOku().then((value) {
    //   if (value.toString().length == 4) {
    //     (value.toString());
    //     hemmeSah = [sayfa1, sayfa2, sayfa3, safya5];
    //   } else {
    //     (value.toString());
    //     hemmeSah = [sayfa1, sayfa2, sayfa3, sayfa4];
    //   }
    // });
  }

  int saylanan = 0;
  bool check = false;

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: hemmeSah[saylanan],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: saylanan != 0 ? true : false,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/bottom_nav_icon/logo.png',
                  width: 18,
                  height: 18,
                ),
                icon: SvgPicture.asset(
                  'asset/bottom_nav_icon/home_off.svg',
                  width: 18,
                  height: 18,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'asset/bottom_nav_icon/serves_on.svg',
                  width: 18,
                  height: 18,
                ),
                icon: SvgPicture.asset(
                  'asset/bottom_nav_icon/serves_off.svg',
                  width: 18,
                  height: 18,
                ),
                label: "Services"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'asset/bottom_nav_icon/categor_on.svg',
                  width: 18,
                  height: 18,
                ),
                icon: SvgPicture.asset(
                  'asset/bottom_nav_icon/categor_off.svg',
                  width: 18,
                  height: 18,
                ),
                label: "Category"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'asset/bottom_nav_icon/cart-icon.svg',
                  width: 18,
                  height: 18,
                ),
                icon: SvgPicture.asset(
                  'asset/bottom_nav_icon/cart_off.svg',
                  width: 18,
                  height: 18,
                ),
                label: "Basket"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'asset/bottom_nav_icon/profile_on.svg',
                  width: 18,
                  height: 18,
                ),
                icon: SvgPicture.asset(
                  'asset/bottom_nav_icon/profile_off.svg',
                  width: 18,
                  height: 18,
                ),
                label: "Profile"),
          ],
          fixedColor: Color.fromRGBO(55, 58, 64, 1),
          type: BottomNavigationBarType.fixed,
          currentIndex: saylanan,
          onTap: ((index) {

            setState(() {

              CheckSignUp().dosyaOku().then((value) {

                if (value.toString().length == 4) {
                  debugPrint(value.toString());
                  saylanan = index;

                } else {
                  debugPrint(value.toString());
                  saylanan = index;
                  saylanan==4?  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn())):null;
                  saylanan==4?saylanan=0:saylanan;
                }
              }

              );});
          }),
        ));
  }
}
