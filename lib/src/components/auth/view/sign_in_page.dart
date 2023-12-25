import 'package:ecommerce_app/src/components/auth/api/api_request/auth_api.dart';
import 'package:ecommerce_app/src/components/auth/models/sign_in_model.dart';
import 'package:ecommerce_app/src/components/auth/view/sign_up_page.dart';
import 'package:ecommerce_app/src/components/auth/widgets/have_or_not_account.dart';
import 'package:ecommerce_app/src/components/category/views/categories_page.dart';
import 'package:ecommerce_app/src/route/nav.dart';
import 'package:ecommerce_app/src/widgets/dialog_error.dart';
import 'package:ecommerce_app/src/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:reusables/reusables.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextField(
                  textEditingController: userNameController,
                  hintText: 'Username',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                AppPasswordField(
                  textEditingController: passwordController,
                  hint: 'Password',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Sign in'),
                ),
                HaveOrNotAccount(
                  onTap: () {
                    AppNavigation.push(context, const SignUpPage());
                  },
                  authText: "Sign-up",
                  haveText: "Don't have account? ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await Awaiter.process(
          future: _signIn(),
          context: context,
          arguments: 'Loading',
        );
        if (mounted) {
          await AppNavigation.pushReplacement(
            context,
            const CategoriesPage(),
          );
        }
      } catch (e) {
        showDioError(context, e);
      }
    }
  }

  Future _signIn() async {
    try {
      await AuthApi().signIn(
        SignInModel(
          username: userNameController.text,
          password: passwordController.text,
        ).transform(),
      );
    } catch (_) {
      rethrow;
    }
  }
}
