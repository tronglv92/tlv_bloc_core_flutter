import 'package:tlv_bloc_core_flutter_master/blocs/app_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:tlv_bloc_core_flutter_master/screens/login/login_bloc.dart';
import 'package:tlv_bloc_core_flutter_master/screens/login/login_services.dart';

class AppProvider extends InheritedWidget {
  final AppBloc appBloc;

  AppProvider({
    Key key,
    LoginBloc appBloc,
    Widget child,
  })
      : appBloc = appBloc ?? AppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .appBloc;
}