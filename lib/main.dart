
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/app_provider.dart';
import 'constants/app_routes.dart';

import 'utils/local_storage.dart';
import 'views/auth/login.dart';
import 'views/auth/register.dart';
import 'views/auth/register_otp.dart';
import 'views/dashboard/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));

  //check
 await dotenv.load(fileName: ".env");
  AwesomeNotifications().initialize('resource://drawable/launcher_icon', [
    // notification icon
    NotificationChannel(
        channelGroupKey: 'pharmplug',
        channelKey: 'request',
        channelName: 'Request notifications',
        channelDescription: 'Notification channel for recieving request',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
        playSound: true),

    // NotificationChannel(
    //     channelGroupKey: 'image_test',
    //     channelKey: 'image',
    //     channelName: 'image notifications',
    //     channelDescription: 'Notification channel for image tests',
    //     defaultColor: Pallete.primaryColor,
    //     ledColor: Colors.white,
    //     channelShowBadge: true,
    //     importance: NotificationImportance.High)

    //add more notification type with different configuration
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     AwesomeNotifications().requestPermissionToSendNotifications();

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
            home: FutureBuilder(
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // check if snapshot has data and then convert data to int
                  if (snapshot.hasData) {
                    final data = snapshot.data as int;

                    switch (data) {
                      case 0:
                        return const Login();

                      case 1:
                        return const Register();
                      case 2:
                        return const RegisterOTP();
                      case 3:
                        return const Dashboard();
                    }
                    // if we got our data
                  }
                }
                // Displaying empty to indicate waiting state
                return Container(
                  color: Colors.white,
                );
              },
              future: alreadyAUser,
            ),
          ),
        );
      });
    });
  }
}
