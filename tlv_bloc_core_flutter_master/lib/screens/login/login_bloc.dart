import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:tlv_bloc_core_flutter_master/models/response/login.dart';
import 'package:tlv_bloc_core_flutter_master/screens/login/login_services.dart';
import 'package:tlv_bloc_core_flutter_master/models/request/login_request.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/error_response.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(Login login);

  void onLoginError(ErrorResponse error);
}


class LoginBloc{
  final BehaviorSubject<Login> _login=new BehaviorSubject<Login>();
  final StreamController<LoginRequest> _loginController=StreamController<LoginRequest>();
  LoginServices api=new LoginServices();
  LoginScreenContract _view;
  LoginBloc(){
    _loginController.stream.listen((loginRequest){

      api.login(loginRequest).then((Login login){
          if(_view!=null)
            {
              _view.onLoginSuccess(login);
            }


      }).catchError((Object error){
        if(_view!=null)
        {
          _view.onLoginError(error);
        }

      });
    });

  }


  set view(LoginScreenContract view) => _view=view;
  LoginScreenContract get view=>_view;



  Sink<LoginRequest> get login=>_loginController.sink;
  Stream<Login> get getLogin=>_login.stream;
  void dispose(){
    _login.close();
  }


}