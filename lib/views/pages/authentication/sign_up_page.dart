import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiego/core/app_constants.dart';
import 'package:foodiego/core/app_text_styles.dart';
import 'package:foodiego/core/app_themes.dart';
import 'package:foodiego/core/app_validators.dart';
import 'package:foodiego/core/widgets/app_elevated_button.dart';
import 'package:foodiego/core/widgets/auth_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/o_auth_outlined_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Row(
                spacing: 10,
                children: [
                  Hero(
                      tag: 'ai',
                      child: SvgPicture.asset('lib/assets/svg/app-icon.svg')),
                  Expanded(
                    child: Text(
                      'Welcome to ${AppConstants.appName} food services',
                      style: AppTextStyles.heading2,
                    ),
                  ),
                ],
              ),
              Text(
                'Enter your Phone number or Email address for sign up. Enjoy your food :)',
                style: AppTextStyles.caption,
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCustomFormField(
                    textInputType: TextInputType.text,
                    textEditingController: userNameController,
                    lable: 'Username',
                    validator: AppValidators.validateRequired,
                    appCustomFormFieldBorderType:
                    AppCustomFormFieldBorderType.top,
                  ),AppCustomFormField(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    lable: 'Email',
                    validator: AppValidators.validateEmail,
                  ),
                  AppCustomFormField(
                    textInputType: TextInputType.visiblePassword,
                    textEditingController: passwordController,
                    lable: 'Password',
                    validator: AppValidators.validatePassword,
                    appCustomFormFieldBorderType:
                    AppCustomFormFieldBorderType.bottom,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              AppElevatedButton(
                  title: 'SIGN UP', voidCallback: () {}, isLoading: false),
              SizedBox(
                height: 1,
              ),
              GestureDetector(
                onTap: (){
                  context.pop();
                },
                child: Text(
                  'Login Instead',
                  style: AppTextStyles.caption
                      .copyWith(color: AppThemes.primaryColor),
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppThemes.secondaryColor,
                      thickness: 0.4,
                    ),
                  ),
                  Text('or'),
                  Expanded(
                    child: Divider(
                      color: AppThemes.secondaryColor,
                      thickness: 0.4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              OAuthOutlinedButton(
                title: 'Continue with Google',
                assetPath: 'lib/assets/svg/google.svg',
                onPressed: () async {
                  // userCredential.value = await signInWithGoogle();
                  // if (userCredential.value != null)
                  //   print(userCredential.value.user!.email);
                },
              ),
              OAuthOutlinedButton(
                title: 'Continue with Facebook',
                assetPath: 'lib/assets/svg/facebook.svg',
                onPressed: () async {
                  // userCredential.value = await signInWithGoogle();
                  // if (userCredential.value != null)
                  //   print(userCredential.value.user!.email);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
