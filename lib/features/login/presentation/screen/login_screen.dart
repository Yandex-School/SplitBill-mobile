import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/router/routes_name.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051326),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color(0xff051326),
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: const Offset(
                            0, -50), // Move the widget upwards by 50 pixels
                        child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Lottie.asset('assets/lottie/coin_lottie.json'),
                        ),
                      ),
                      const Text(
                        "Вход",
                        style: TextUtils.headingStyle,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Пожалуйста войдите чтобы продолжить работу",
                        style: TextUtils.subtitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        onChanged: (value) =>
                            loginProvider.setLoginState(nickname: value),
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "user",
                          labelText: "Никнейм",
                          labelStyle: TextStyle(
                            color: TextUtils.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.account_box_outlined,
                              color: TextUtils.grey),
                          filled: true,
                          fillColor: Color(0xff051326),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (value) =>
                            loginProvider.setLoginState(password: value),
                        obscureText: loginProvider.loginState.showPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Пароль",
                          labelStyle: const TextStyle(
                            color: TextUtils.grey,
                            fontSize: 14,
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: TextUtils.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginProvider.loginState.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: TextUtils.grey,
                            ),
                            onPressed: () => loginProvider.setLoginState(
                              showPassword:
                                  !loginProvider.loginState.showPassword,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xff051326),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        loading: loginProvider.loginState.loading,
                        text: "Вход",
                        onPressed: () {
                          if (!loginProvider.loginState.fieldsAreValid) {
                            _showError(context);
                            return;
                          }
                          loginProvider.loginUser().then((success) {
                            if (success) {
                              context.go(RoutesName.eventRoom);
                              return;
                            }
                            _showError(context);
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Нет аккаунта?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: " Регистрация",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => context.go(RoutesName.register),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showError(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Неверные учетные данные!')),
    );
  }
}
