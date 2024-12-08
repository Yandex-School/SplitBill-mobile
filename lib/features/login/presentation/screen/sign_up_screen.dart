import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/router/routes_name.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051326),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color(0xff051326),
      //   elevation: 0.0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
      //     onPressed: () => Navigator.pop(context),
      //   ),
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
                      // Заголовок
                      Text(
                        "Создать учетную запись",
                        style: TextUtils.headingStyle.copyWith(fontSize: 27),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // Поле полного имени
                      TextField(
                        onChanged: (value) =>
                            loginProvider.setRegisterState(nickname: value),
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Полное имя",
                          labelStyle:
                              TextStyle(color: TextUtils.grey, fontSize: 14),
                          prefixIcon: Icon(Icons.person, color: TextUtils.grey),
                          filled: true,
                          fillColor: Color(0xff051326),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Поле пароля
                      TextField(
                        onChanged: (value) =>
                            loginProvider.setRegisterState(password: value),
                        style: const TextStyle(color: Colors.white),
                        obscureText: loginProvider.loginState.showPassword,
                        decoration: InputDecoration(
                          hintText: "Password1!",
                          labelText: "Пароль",
                          labelStyle: const TextStyle(
                              color: TextUtils.grey, fontSize: 14),
                          prefixIcon:
                              const Icon(Icons.lock, color: TextUtils.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginProvider.loginState.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: TextUtils.grey,
                            ),
                            onPressed: () => loginProvider.setRegisterState(
                              showPassword:
                                  !loginProvider.loginState.showPassword,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xff051326),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Поле подтверждения пароля
                      TextField(
                        onChanged: (value) => loginProvider.setRegisterState(
                            confirmPassword: value),
                        style: const TextStyle(color: Colors.white),
                        obscureText: loginProvider.loginState.showPassword,
                        decoration: InputDecoration(
                          hintText: "Password1!",
                          labelText: "Подтвердите пароль",
                          labelStyle: const TextStyle(
                              color: TextUtils.grey, fontSize: 14),
                          prefixIcon:
                              const Icon(Icons.lock, color: TextUtils.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginProvider.loginState.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: TextUtils.grey,
                            ),
                            onPressed: () => loginProvider.setRegisterState(
                              showPassword:
                                  !loginProvider.loginState.showPassword,
                            ),
                          ),
                          errorText: loginProvider.registerState.isPasswordMatch
                              ? null
                              : "Пароли не совпадают",
                          filled: true,
                          fillColor: const Color(0xff051326),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Кнопка регистрации
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Зарегистрироваться",
                          onPressed: () {
                            if (!loginProvider.registerState.fieldsAreValid)
                              return;

                            loginProvider.registerUser().then((success) {
                              if (success) {
                                context.go(RoutesName.eventRoom);
                                return;
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Неверные входные данные!'),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Есть аккаунт?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: " Логин",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.pop(),
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
}
