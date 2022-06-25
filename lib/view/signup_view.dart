import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/res/export_res_files.dart';
import 'package:mvm_solid_provider/utils/export_utils_files.dart';
import 'package:mvm_solid_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  //using provider to show password
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

// to go to another textform field after tapping done or correct mark, use this
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // this is done to clean the RAM of unwanted variables.
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (val) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  var show = _obsecurePassword.value;
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: show,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.key_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: show
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                  ))),
                  );
                }),
            SizedBox(height: ht * 0.1),
            //Login
            RoundButton(
              text: "Sign up with us",
              bgColor: Colors.deepOrange,
              isLoading: authViewModel.isLoadingSignUp,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Your EMAIL field is empty", context, null);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Your PASSWORD field is empty", context, null);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please enter 6 charactes password", context, null);
                } else {
                  Map data = {
                    // 'email': _emailController.text,
                    // 'password': _passwordController.text
                    'email': 'eve.holt@reqre.in',
                    'password': 'pisto',
                  };
                  authViewModel.signUpApi(data, context);

                  Navigator.pushNamed(context, RoutesName.home);
                }
              },
            ),
            //SignUp
            const SizedBox(height: 20),
            RoundButton(
              text: "Already have an account? Login",
              bgColor: Colors.transparent,
              txtColor: AppColors.blackColor,
              onPress: () {
                Navigator.popAndPushNamed(context, RoutesName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
