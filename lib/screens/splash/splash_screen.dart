import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes_app/bloc/bloc.dart';
import 'package:secure_notes_app/navigation.dart';
import 'package:secure_notes_app/widgets/widgets.dart';


class SplashScreen extends StatefulWidget {
  static const pageRoute = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthLogOutSuccess) {
        Navigation.toAuth();
      } else if (state is AuthSuccessLogin) {
        Navigation.toCatalog(); 
      }
    },
    builder: (context, state) {
      Widget body = Container();

      if (state is AuthInitial) {
        body = Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Пожалуйста, подождите'),
              )
            ],
          ),
        );
      } else if (state is AuthLoading) {
         body = Scaffold(
           body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: double.maxFinite),
              LoadingIndicator()
            ],
        ),
         );
      }
      return body;  
    },
  );
}