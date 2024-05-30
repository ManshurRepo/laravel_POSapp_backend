import 'package:fic11_starter_pos/data/datasources/auth_local_datasource.dart';
import 'package:fic11_starter_pos/presentations/auth/pages/login_page.dart';
import 'package:fic11_starter_pos/presentations/home/bloc/bloc/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Dashboard Page'),
        actions: [
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: () {
                    AuthLocalDatasource().removeAuthData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  });
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  icon: const Icon(Icons.logout));
            },
          )
        ],
      ),
      body: const Center(child: Text('Dashboard Page')),
    );
  }
}
