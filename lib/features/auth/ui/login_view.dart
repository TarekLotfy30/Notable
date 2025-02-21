import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_colors.dart';
import '../../../core/utils/typography/app_text_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
            body: Column(
              children: [
                TabBar(
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.black,
                  labelStyle: AppTextStyles.textStyle16,
                  unselectedLabelStyle: AppTextStyles.textStyle16,
                   indicator: ,
                  tabs: const [
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
                    children: const [
                      Center(
                        child: Text('Login'),
                      ),
                      Center(
                        child: Text('Register'),
                      ),
                      Center(
                        child: Text('Forgot Password'),
                      ),
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
