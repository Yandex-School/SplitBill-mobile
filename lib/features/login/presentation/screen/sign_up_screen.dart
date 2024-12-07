import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordMatch = true;

  @override
  void initState() {
    super.initState();
    fullNameController.text = 'Test User';
    confirmPasswordController.text = 'Password1!';
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff051326),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff051326),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Заголовок
                  Text(
                    "Создать учетную запись",
                    style: TextUtils.headingStyle.copyWith(fontSize: 27),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Поле полного имени
                  TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      labelText: "Полное имя",
                      labelStyle: TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: Icon(Icons.person, color: TextUtils.grey),
                      filled: true,
                      fillColor: Color(0xff051326),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Поле email
                  TextField(
                    onChanged: loginProvider.setEmail,
                    decoration: InputDecoration(
                      hintText: "user@example.com",
                      labelText: "Адрес электронной почты",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.email, color: TextUtils.grey),
                      errorText: loginProvider.state.isValidEmail
                          ? null
                          : "Введите действительный адрес электронной почты",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Поле пароля
                  TextField(
                    onChanged: (value) {
                      loginProvider.setPassword(value);
                      _validatePasswords(value, confirmPasswordController.text);
                    },
                    obscureText: loginProvider.state.showPassword,
                    decoration: InputDecoration(
                      hintText: "Password1!",
                      labelText: "Пароль",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.state.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: loginProvider.state.isValidPassword
                          ? null
                          : "Неверный пароль",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Поле подтверждения пароля
                  TextField(
                    controller: confirmPasswordController,
                    onChanged: (value) {
                      _validatePasswords(loginProvider.state.password, value);
                    },
                    obscureText: loginProvider.state.showPassword,
                    decoration: InputDecoration(
                      hintText: "Password1!",
                      labelText: "Подтвердите пароль",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.state.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: isPasswordMatch ? null : "Пароли не совпадают",
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
                        if (loginProvider.state.isValidEmail &&
                            loginProvider.state.isValidPassword &&
                            isPasswordMatch &&
                            fullNameController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Учетная запись успешно создана!'),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Неверные входные данные!'),
                            ),
                          );
                        }
                      },
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

  void _validatePasswords(String password, String confirmPassword) {
    setState(() {
      isPasswordMatch = password == confirmPassword;
    });
  }
}
