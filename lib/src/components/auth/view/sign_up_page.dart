import 'package:ecommerce_app/src/components/auth/api/api_request/auth_api.dart';
import 'package:ecommerce_app/src/components/auth/models/name_model.dart';
import 'package:ecommerce_app/src/components/auth/models/sign_up_model.dart';
import 'package:ecommerce_app/src/components/auth/widgets/have_or_not_account.dart';
import 'package:ecommerce_app/src/helpers/route_names.dart';
import 'package:ecommerce_app/src/widgets/dialog_error.dart';
import 'package:ecommerce_app/src/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/utils/awaiter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ///Controllers for text-field
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
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
                  textEditingController: firstNameController,
                  hintText: 'First Name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  textEditingController: lastNameController,
                  hintText: 'Last Name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                ),
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
                AppTextField(
                  textEditingController: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Email is required';
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
                  onPressed: _onSubmit,
                  child: const Text('Sign up'),
                ),
                HaveOrNotAccount(
                  onTap: () {
                    context.goNamed(AppRoute.signIn);
                  },
                  authText: "Sign-in",
                  haveText: "Already have account? ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit() async {
    try {
      if (_formKey.currentState!.validate()) {
        await Awaiter.process(
          future: _signUp(),
          context: context,
          arguments: 'Loading',
        );
        if (mounted) {
          context.goNamed(AppRoute.category);
          // await AppNavigation.push(
          //   context,
          //   const CategoriesPage(),
          // );
        }
      }
    } catch (e) {
      if (mounted) {
        showDioError(context, e);
      }
    }
  }

  Future<void> _signUp() async {
    try {
      var v = await AuthApi().signUp(
        SignUpModel(
          name: NameModel(
              lastname: lastNameController.text,
              firstname: firstNameController.text),
          email: emailController.text,
          password: passwordController.text,
          username: userNameController.text,
        ).fromModelToDTO(),
      );
      debugPrint("id : $v");
    } catch (_) {
      rethrow;
    }
  }
}
