import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/cubit/maps/maps_cubit.dart';
import '../data/repo/maps_repo.dart';
import '../data/web_services/places_webservices.dart';
import 'screens/map_screen.dart';
import 'screens/otp_screen.dart';
import '../business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../constants/strings.dart';
import 'screens/login_screen.dart';

// class AppRouter {
//   PhoneAuthCubit? phoneAuthCubit;

//   AppRouter() {
//     phoneAuthCubit = PhoneAuthCubit();
//   }

//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case mapScreen:
//         print('h');
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (BuildContext context) =>
//                 MapsCubit(MapsRepository(PlacesWebservices())),
//             child: MapScreen(),
//           ),
//         );

//       case loginScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider<PhoneAuthCubit>.value(
//             value: phoneAuthCubit!,
//             child: LoginScreen(),
//           ),
//         );

//       case otpScreen:
//         final phoneNumber = settings.arguments;
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider<PhoneAuthCubit>.value(
//             value: phoneAuthCubit!,
//             child: OtpScreen(phoneNumber: phoneNumber),
//           ),
//         );
//     }
//   }
// }
class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                MapsCubit(MapsRepository(PlacesWebservices())),
            child: MapScreen(),
          ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
    }
  }
}
