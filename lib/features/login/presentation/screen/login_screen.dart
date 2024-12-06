import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = GetIt.instance<LoginProvider>();

    return Scaffold(
      backgroundColor: const Color(0xff051326),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff051326),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    onChanged: loginProvider.setEmail,
                    decoration: InputDecoration(
                      labelText: "Имя",
                      labelStyle: const TextStyle(
                        color: TextUtils.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.email, color: TextUtils.grey),
                      errorText: loginProvider.isValidEmail
                          ? null
                          : "Введите действительный адрес электронной почты",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Поле ввода пароля
                  TextField(
                    onChanged: loginProvider.setPassword,
                    obscureText: loginProvider.showPassword,
                    decoration: InputDecoration(
                      labelText: "Пароль",
                      labelStyle: const TextStyle(
                        color: TextUtils.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: loginProvider.isValidPassword ? null : "Неверный пароль",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Кнопка входа
                  CustomButton(
                    text: "Вход",
                    onPressed: () {
                      if (loginProvider.validateCredentials()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Вход в систему прошел успешно!')),
                        );
                        context.go('/event-rooms');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Неверные учетные данные!')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 40),

                  // Регистрация
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Нет аккаунта?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/login/sign-up'),
                          child: const Text(
                            " Регистрация",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
