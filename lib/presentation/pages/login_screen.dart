import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/data/datasources/auth_datasource.dart';
import 'package:boilerplate/data/dio/dio_service.dart';
import 'package:boilerplate/data/repositories/AuthRepositoryImpl.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:boilerplate/presentation/bloc/login/login_event.dart';
import 'package:boilerplate/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/bloc/login/login_bloc.dart';
import 'package:boilerplate/presentation/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          child: Column(children: [
                            TextFormField(
                               decoration:
                                  const InputDecoration(labelText: 'username'),
                                  controller: _usernameController,
                             ),
                            TextFormField(
                               decoration:
                                  const InputDecoration(labelText: 'password'),
                                  controller: _passwordController,
                                  obscureText: true,
                             ),
                           ]
                          )
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

  Widget _buildSubmitButton() => BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              _loginBloc.add(LoginButtonPressed(
                  username: _usernameController.text,
                  password: _passwordController.text));
              },
          )
        );
      }
  );

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
