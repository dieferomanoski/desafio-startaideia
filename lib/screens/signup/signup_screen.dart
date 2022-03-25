import "package:flutter/material.dart";
import 'package:tokio_marine/screens/signup/signup_screen_controller.dart';
import 'package:tokio_marine/shared/utils/assets.model.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';
import 'package:tokio_marine/shared/utils/textstyles.model.dart';
import 'package:tokio_marine/shared/widgets/linear_gradient.widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _controller = SignUpScreenController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsModel.backgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsModel.tokio_logo,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsModel.backgroundColorLight,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _controller.emailController,
                      style: TextStylesModel.subtitle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite alguma coisa";
                        } else if (!value.contains("@")) {
                          return "Email não é válido";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Digite seu email",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsModel.backgroundColorLight,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _controller.passwordController,
                      style: TextStylesModel.subtitle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite alguma coisa";
                        } else if (value.length < 6) {
                          return "A senha deve ter pelo menos 6 caracteres";
                        }

                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Digite sua senha",
                          fillColor: Colors.grey,
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                errorMessage,
                style: TextStylesModel.subtitle
                    .copyWith(color: Colors.red, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomGradient(
              child: Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    // fillColor: ColorsModel.primaryColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final result = await _controller
                            .createUserWithEmailAndPassword(context: context);

                        if (result == null) {
                          setState(() {
                            errorMessage = "Algum erro ocorreu";
                          });
                        }
                      }
                    },
                    child: Text("Criar conta",
                        style: TextStylesModel.subtitle
                            .copyWith(color: Colors.grey[300])),
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.emailController.dispose();
    _controller.passwordController.dispose();
    super.dispose();
  }
}
