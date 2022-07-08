import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/data/datasources/auth_datasource.dart';
import 'package:boilerplate/data/dio/dio_service.dart';
import 'package:boilerplate/data/repositories/AuthRepositoryImpl.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:boilerplate/presentation/bloc/login/login_event.dart';
import 'package:boilerplate/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/bloc/login/login_bloc.dart';
import 'package:boilerplate/presentation/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginBloc _loginBloc;
  late AuthRepository repository;
  late UseCase useCase;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc(
        repository: AuthRepositoryImpl(
            dataSource: AuthDataSourceImpl(service: RestService())));

    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              switch (state.status) {
                case LoginStatus.initail:
                  break;
                case LoginStatus.loading:
                  showLoaderDialog(context);
                  break;
                case LoginStatus.loginSuccess:
                  TransitionUtil.replace(context, const MainScreen(), false);
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
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Form(
                          key: formKey,
                          child: Column(children: <Widget>[
                            emailField(),
                            passwordField(),
                          ]));
                    },
                  ),
                  _buildSubmitButton(),
                ],
              ),
            )),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'ypu@example.com',
            labelText: 'Email Address',
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.green)),
          ),
          validator: Validators.compose([
            Validators.required('email is required'),
            Validators.email('invalid email')
          ]),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(builder: (context, snapshot) {
      return TextFormField(
        obscureText: true,
        controller: _passwordController,
        decoration: const InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
        ),
        validator: Validators.compose([
          Validators.required('password is required'),
        ]),
      );
    });
  }

  Widget _buildSubmitButton() =>
      BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _loginBloc.add(LoginButtonPressed(
                      username: _usernameController.text,
                      password: _passwordController.text));
                }
              },
            ));
      });

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(children: [
      const CircularProgressIndicator(),
      Container(
          margin: const EdgeInsets.only(left: 7),
          child: const Text("Loading..."))
    ]));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => alert);
  }
}
