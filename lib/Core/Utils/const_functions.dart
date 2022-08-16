
import 'package:flutter_architecture_api_app/Core/Utils/app_colors.dart';
import 'package:flutter_architecture_api_app/Core/Widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Extension For BuildContext
extension MainContext on BuildContext {
//  AppLocalization? get translate => AppLocalization.of(this);
  ThemeData get theme => Theme.of(this);
  ModalRoute<Object?>? get modal => ModalRoute.of(this);
  bool get keyBoard => MediaQuery.of(this).viewInsets.bottom == 0;
  Size get mainSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}


class AppGeneral {

   Locale switchLang(String lang){
    SharedPreferences.getInstance().then((value) async {
      await value.setString('lang', lang);
    });
    if(lang == 'english'){
      lang = 'en';
    } else if(lang == 'arabic'){
      lang = 'ar';
    } else if(lang == 'espanol') {
      lang = 'es';
    }
    return Locale(lang,'');
  }

   Center errorProvider(Object err){
    return Center(child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(text: err.toString())),);
  }

   Center loadingProvider(){
    return const Center(child: CircularProgressIndicator.adaptive(),);
  }

   Visibility loadingVisibilityProvider(){
    return const Visibility(
        visible: false,
        child: CircularProgressIndicator.adaptive());
  }

  Center notFoundData(String text){
    return Center(child: FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomText(
        text: text ,
        fontSize: 20.0,
        color: AppColor().lightMainColor,
      ),
    ),);
  }


  MaterialStateProperty<Color> materialStateColor(Color color){
    return MaterialStateProperty.all<Color>(color);
  }
}


// class ConstState {
//   static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   static final FirebaseStorage fireStorage = FirebaseStorage.instance;
//   static final String firebaseId = FirebaseAuth.instance.currentUser!.uid;
//   static final FirebaseFirestore fireStore = FirebaseFirestore.instance;
//   static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//
//
//   static final themeProv = ChangeNotifierProvider((ref)=>ThemeState());
//   static final langProv = ChangeNotifierProvider((ref)=>LangState());
//   static final myDataProv = StreamProvider((ref)=>AuthFunctions.getUserData());
//   static final fetchHomeProv = FutureProvider((ref)=>HomeFunctions.fetchHomeData());
//   static final fetchUsersProv = FutureProvider((ref)=>AuthFunctions.fetchAllUsers());
//   static final fetchFriendsProv = StreamProvider((ref)=>FriendsFunctions.fetchFriends());
//   static final fetchRequestsProv = StreamProvider((ref)=>RequestsFunction.fetchRequests());
//   static final fetchBlockProv = StreamProvider((ref)=>BlockFunctions.fetchBlock());
//   //static final fetchFriendsProv = ChangeNotifierProvider<ChatSate>((ref)=>ChatSate());
//   // static final fetchRequestsProv = ChangeNotifierProvider<ChatSate>((ref)=>ChatSate());
//
//
//
//   static StreamSubscription<RemoteMessage> onMessage(BuildContext context) {
//     return FirebaseMessaging.onMessage.listen((event) {
//       Flushbar(
//         flushbarPosition: FlushbarPosition.TOP,
//         shouldIconPulse: false,
//         margin: const EdgeInsets.all(10.0),
//         duration: const Duration(seconds: 100),
//         title: event.notification!.title,
//         messageText: CustomText(
//           text: event.notification!.body.toString(),
//           color: Colors.white,
//         ),
//         borderRadius: BorderRadius.circular(10.0),
//         // margin: const EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
//         mainButton: MaterialButton(onPressed: (){},child: const Text('Google'),),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         isDismissible: true,
//         dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//         icon: const CircleAvatar(child: Icon(Icons.person)),
//         onTap: (_){
//           print('Google');
//         },
//       ).show(context);
//     });
//   }
//
//   static StreamSubscription<RemoteMessage> onMessageOpenedApp(BuildContext context) {
//     return FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       Fluttertoast.showToast(msg: 'Message');
//       Navigator.of(context).pushNamedAndRemoveUntil(TabBarScreen.tabBar, (route) => false);
//     });
//   }
//
//
//   static Future<http.Response> sendMessage({
//     required String id , required String title ,
//     required String body , required String userToken}) async {
//     const String _token = 'AAAAcJ5noSQ:APA91bEfPtobjmIeMY2t64SMtyfl9zhfvJFgeh6T6U1WJ4M-nY-J3JFCIC-hPNIeCY3SZ422b1MOKLYxrLYlNMQjFRxxM0sKq7Wk7bgb4VHpbYd3sgaU-zurQvFyPXuNd1tBfU7gb8S5';
//     return await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: <String,String>{
//           'Content-Type':'application/json',
//           'Authorization': 'key=$_token'
//         },
//         body: jsonEncode(<String,dynamic>{
//           'notification': <String,String>{
//             'title': title.toString(),
//             'body': body.toString(),
//           } ,
//           'priority': 'high' ,
//           'data' : {
//             'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
//             'id': id.toString() ,
//           },
//           'to': userToken
//           // 'to': 'fTQQelA0RnWBfzdL76A-sk:APA91bH-6Lp9dHAnzJIjQP_25l9zWW2yQPCiYleMSMeiKUStmUJ39oThC_hkhzNH2V7-eAzzPqNUDl_Hz_26MrgMYtByN9kDvvThh9e3WbffiJ54hotJAAQSMH4nDjscod5B_GDZzyTA'
//           // 'to': 'f-__WICVTt-jE-gvJfsx88:APA91bHFysPzK-aBr5Q7DZZjASD6IyyCYGgiCQEKOWpADvOqvtwSvDv-feuVANQNkwNte6_BL-HyJkdJ58RUIl_rFpqgqVcrb5ruFYrmpW7OZk0Red-CBco0iSPSHS2VHlNR_je3b2G5'
//         })
//     );
//   }
//
// }




