import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import '../../data/repo/login_repo_impl.dart';
import 'login_view.dart';
import 'register_view.dart';
import 'social_media_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            body: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(
                      text: 'Login',
                      icon: Icon(Icons.login),
                    ),
                    Tab(
                      text: 'Register',
                      icon: Icon(Icons.app_registration),
                    ),
                    Tab(
                      text: 'Social Media',
                      icon: Icon(Icons.people),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      BlocProvider(
                        create: (context) => LoginCubit(
                          loginRepository: getIt.get<LoginRepoImpl>(),
                        ),
                        child: const LoginView(),
                      ),
                      const RegisterView(),
                      const SocialMediaView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
