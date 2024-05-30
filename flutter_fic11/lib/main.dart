import 'package:fic11_starter_pos/data/datasources/auth_local_datasource.dart';
import 'package:fic11_starter_pos/data/datasources/auth_remote_datasource.dart';
import 'package:fic11_starter_pos/presentations/auth/bloc/login/login_bloc.dart';
import 'package:fic11_starter_pos/presentations/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentations/auth/pages/login_page.dart';
import 'presentations/home/bloc/bloc/logout_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isAuth(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return const DashboardPage();
              } else {
                return const LoginPage();
              }
            }),
      ),
    );
  }
}
