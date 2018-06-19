import 'package:tlv_bloc_core_flutter_master/screens/login/login_bloc.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/explore/explore_bloc.dart';
class AppBloc {
  LoginBloc loginBloc=new LoginBloc();
  ExploreBloc exploreBloc=new ExploreBloc();
  AppBloc(){
    loginBloc=new LoginBloc();
    exploreBloc=new ExploreBloc();
  }

  void dispose()
  {
    loginBloc.dispose();
    exploreBloc.dispose();
  }
}