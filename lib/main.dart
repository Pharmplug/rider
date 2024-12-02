import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmplug_rider/views/navbar/nav.dart';
import 'package:pharmplug_rider/views/onboarding/onboading.dart';
import 'package:pharmplug_rider/views/onboarding/welcome_screen.dart';
import 'package:pharmplug_rider/views/order/order.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_details.dart';
import 'package:pharmplug_rider/views/profile/earnings.dart';
import 'package:pharmplug_rider/views/profile/profile.dart';
import 'package:provider/provider.dart';
import 'constants/app_provider.dart';
import 'constants/app_routes.dart';
import 'utils/local_storage.dart';
import 'views/auth/register.dart';
import 'views/auth/register_otp.dart';
import 'views/dashboard/dashboard.dart';
import '../../constants/resources.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));

  //check
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Future<dynamic> alreadyAUser = showOnce();
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return MultiProvider(
          providers: AppProviders.providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(
                Theme.of(context)
                    .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
              ),
            ),
            routes: AppRoutes.routes(),
            home:OrderScreen()
            // home: FutureBuilder(
            //   builder: (ctx, snapshot) {
            //     // Checking if future is resolved or not
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       // check if snapshot has data and then convert data to int
            //       if (snapshot.hasData) {
            //         final data = snapshot.data as int;

            //         switch (data) {
            //           case 0:
            //             return const WelcomeScreen();
            //           case 1:
            //             return const Register();
            //           case 2:
            //             return const RegisterOTP();
            //           case 3:
            //             return NavBar(
            //                 initialScreen: const Dashboard(), initialTab: 0);
            //         }
            //         // if we got our data
            //       }
            //     }
            //     // Displaying empty to indicate waiting state
            //     return Container(
            //       color: Colors.white,
            //     );
            //   },
            //   future: alreadyAUser,
            // ),
           
          ),
        );
      });
    });
  }
}
