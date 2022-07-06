

import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/data/datasources/auth_datasource.dart';
import 'package:boilerplate/data/dio/dio_service.dart';
import 'package:boilerplate/data/repositories/AuthRepositoryImpl.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:boilerplate/presentation/bloc/register/register.dart';
import 'package:boilerplate/presentation/pages/home_screen.dart';
import 'package:boilerplate/presentation/widgets/text/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();


  late RegisterBloc bloc;
  late AuthRepository repository;
  late UseCase useCase;
  late String code;

  @override
  void initState() {
    bloc = RegisterBloc(
        repository: AuthRepositoryImpl(
            dataSource: AuthDataSourceImpl(
                service: RestService()
            )
        )
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (_) => bloc,
        child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              switch (state.status) {
                case RegisterStatus.initial:
                  break;
                case RegisterStatus.loading:
                  showLoaderDialog(context);
                  break;
                case RegisterStatus.verifySuccess:
                  Navigator.pop(context);
                  code = state.otp!;
                  break;
                case RegisterStatus.registerSuccess:
                  TransitionUtil.replace(context, const HomeScreen(), false);
                  break;
                default:
                  break;
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(38.0, 100, 38.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: const [
                        Expanded(
                            child: Text(
                                'Register', textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ))
                        )
                      ],
                    ),
                  ),
                  
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return Column(
                        children: {
                          'email': [_emailController, RegisterStatus.initial],
                          'first-name': [_firstNameController, RegisterStatus.verifySuccess],
                          'last-name': [_lastNameController, RegisterStatus.verifySuccess],
                          'password': [_passwordController, RegisterStatus.verifySuccess],
                          'confirm-password': [_confirmPasswordController, RegisterStatus.verifySuccess],
                          'opt': [_otpController, RegisterStatus.verifySuccess],
                        }.entries.map((e) => e.value.asMap()[1] == state.status ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: AuthTextField(
                            key: Key(e.key),
                            controller: e.value.asMap()[0] as TextEditingController,
                            hint: e.key,
                            isRequiredField: true,
                            keyboardType: e.key == 'otp' ? TextInputType.number : TextInputType.text,
                            onChanged: null,
                          )
                        ) : const SizedBox()).toList(),
                      );
                    },
                  ),
                  _buildSubmitButton(),
                ],
              ),
            )

        ),

      ),
    );
  }

  Widget _buildSubmitButton() =>
      BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(state.status == RegisterStatus.verifySuccess
                    ? 'Sign Up'
                    : 'Continue'),
                disabledColor: Colors.blueAccent.withOpacity(0.6),
                color: Colors.blueAccent,
                onPressed: () =>
                state.status == RegisterStatus.verifySuccess ?
                bloc.add(OnRegisterPressed(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                  otp: _otpController.text
                )) :
                bloc.add(OnVerifyEmailPressed(email: _emailController.text)),
              ),
            );
          }
      );

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(
            children: [
              const CircularProgressIndicator(),
              Container(margin: const EdgeInsets.only(left: 7),
                  child: const Text("Loading..."))
            ]
        )
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => alert
    );
  }
}