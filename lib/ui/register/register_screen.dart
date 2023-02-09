import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/base/base_state.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/ui/di.dart';
import 'package:ecommerce/ui/dialog/dialog_uitils.dart';
import 'package:ecommerce/ui/home/home_Screen.dart';
import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:ecommerce/ui/register/register_view_model.dart';
import 'package:ecommerce/ui/widgets/custom_from_fiald.dart';
import 'package:ecommerce/ui/widgets/form_subimt_button.dart';
import 'package:ecommerce/ui/widgets/from_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReigsterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<ReigsterScreen> createState() => _ReigsterScreenState();
}

class _ReigsterScreenState extends BaseState<
    ReigsterScreen,RegisterViewModel>
    implements RegisterNavigator {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel(injectAuthRepository(),getAppConfigProvider(context));
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
            children: [
              Image.asset('assets/images/route_long.png'),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Full Name'),
                        CustomFromField(
                          'Enter Your Full Name',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas enter Full Name';
                            }
                            return null;
                          },
                        ),
                        FormLabel('Email'),
                        CustomFromField(
                          'Enter Your Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas enter Email';
                            }
                          },
                        ),
                        FormLabel('Phone'),
                        CustomFromField(
                          'Enter Your Phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas enter Number Phone';
                            }
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
                        FormLabel('Password Confirmation'),
                        CustomFromField(
                          'Re-enter Your Password',
                          hideText: true,
                          controller: passwordConfirmationController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Pleas Re-enter Password';
                            }
                            if (passwordController.text != text) {
                              return "Password don't Match ";
                            }
                          },
                        ),
                        FormSubmitButton('Sign Up', () {
                          register();
                        })
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

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.register(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordConfirmationController.text,
        phoneController.text);
  }



  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context,HomeScreen.routeName);
  }
}
