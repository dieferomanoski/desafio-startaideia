import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/login/login_screen_controller.dart';
import 'package:tokio_marine/services/firebase_service.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';
import 'package:tokio_marine/shared/utils/textstyles.model.dart';
import 'package:tokio_marine/shared/widgets/linear_gradient.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _controller = LoginScreenController();

@override
void initState() {}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: FirebaseService.initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  color: ColorsModel.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tokio Marine\nSEGURADORA",
                              style:
                                  TextStylesModel.title.copyWith(fontSize: 30),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Faça seu login",
                              textAlign: TextAlign.start,
                              style: TextStylesModel.subtitle,
                            ),
                          ],
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
                                  style: TextStylesModel.subtitle,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Digite alguma coisa";
                                    } else if (!value.contains("@")) {
                                      return "Email não é válido";
                                    }

                                    return null;
                                  },
                                  controller: _controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
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
                                  style: TextStylesModel.subtitle,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Digite alguma coisa";
                                    } else if (value.length < 6) {
                                      return "A senha deve ter pelo menos 6 caracteres";
                                    }

                                    return null;
                                  },
                                  controller: _controller.passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Senha",
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
                          height: 40,
                        ),
                        CustomGradient(
                          child: Container(
                              width: double.infinity,
                              child: RawMaterialButton(
                                // fillColor: ColorsModel.primaryColor,
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final result = await _controller
                                        .loginWithEmailAndPassword(
                                            context: context);

                                    if (result == null) {
                                      setState(() {
                                        errorMessage = "Credenciais inválidas";
                                      });
                                    }
                                  }
                                },
                                child: Text("Login",
                                    style: TextStylesModel.subtitle
                                        .copyWith(color: Colors.white)),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                            child: Text(
                          "OU",
                          style: TextStylesModel.subtitle,
                        )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            width: double.infinity,
                            child: RawMaterialButton(
                              // fillColor: ColorsModel.primaryColor,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              onPressed: () async {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Faça login com o Google",
                                      style: TextStylesModel.subtitle
                                          .copyWith(color: Colors.grey[700])),
                                  Icon(Icons.g_mobiledata)
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  @override
  void dispose() {
    _controller.emailController.dispose();
    _controller.passwordController.dispose();
    super.dispose();
  }
}
