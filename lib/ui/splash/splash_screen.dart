import 'package:airways/data/local/storagea_repository.dart';
import 'package:airways/data/network/api_provider.dart';
import 'package:airways/data/network/repositories/login_repo.dart';
import 'package:airways/ui/login/login_screen.dart';
import 'package:airways/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ApiProvider apiProvider = ApiProvider();
  _init()async{
    await Future.delayed(Duration(seconds: 3));
    String token=StorageRepository.getString("token");
    if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return token.isNotEmpty?TabBox(apiProvider: apiProvider):LoginScreen(loginRepo: LoginRepo(apiProvider: apiProvider));
      }));
    }
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
       body: Center(
          child: Icon(Icons.shop_sharp,size: 300,color: Colors.red,),
        )
    );
  }
}
