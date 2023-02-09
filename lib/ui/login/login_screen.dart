import 'package:ecommerce/base/base_state.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/ui/di.dart';
import 'package:ecommerce/ui/home/home_Screen.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/ui/dialog/dialog_uitils.dart';
import 'package:ecommerce/ui/login/login_navigator.dart';
import 'package:ecommerce/ui/login/login_view_model.dart';
import 'package:ecommerce/ui/widgets/custom_from_fiald.dart';
import 'package:ecommerce/ui/widgets/form_subimt_button.dart';
import 'package:ecommerce/ui/widgets/from_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  AppConfigProvider? configProvider;

  @override
  LoginViewModel initViewModel() {
    
    return LoginViewModel(injectAuthRepository(),getAppConfigProvider(context));
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/route_long.png'),
              const SizedBox(height: 64),
              const Text(
                'Welcome Back To Route',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Please sign in with your mail',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Email'),
                        CustomFromField(
                          'Enter Your Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas enter Email';
                            }
                            return null;
                          },
                        ),
                        FormLabel('Password'),
                        CustomFromField(
                          'Enter Your Password ',
                          hideText: true,
                          controller: passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas enter Password';
                            }
                          },
                        ),
                        const Text(
                          'Forgot password',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        FormSubmitButton('Login In', () {
                          login();
                        }),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ReigsterScreen.routeName);
                          },
                          child: const Text(
                            'Don’t have an account? Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
