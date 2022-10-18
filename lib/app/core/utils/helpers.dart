import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:godevi/app/core/utils/error_handler.dart';
import 'package:godevi/app/core/values/app_config.dart';
import 'package:godevi/app/services/storage/storage.dart';
import 'package:teledart/telegram.dart';

// class Notify {
//   Notify._();
//   static final Notify instance = Notify._();

//   // init FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // show notification once
//   // payload = data you send
//   // channelId = notif id that used to cancel notification

//   static Future<void> showNotification(String title, String body, {String? payload, String? channelId}) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(channelId ?? '', 'Your channel name', importance: Importance.max, priority: Priority.high, ticker: 'ticker');

//     NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

//     await Notify.instance.flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics, payload: payload);
//   }
// }


class Toast {
  info(dynamic message, {bool ok = true, int duration = 2}) => ok
      ? EasyLoading.showInfo(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration))
      : EasyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));

  error(dynamic message, [int duration = 2]) => EasyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));

  overlay(String message) => EasyLoading.show(maskType: EasyLoadingMaskType.black, status: message);

  dismiss() => EasyLoading.dismiss();
}

Toast toast = Toast();

class Telebot {
  static Future<bool> sendMessage(String message) async {
    bool isOk = false;
    Map? c = storage.read('app_config');
    Map? bot = c?['bot'];
    String token = bot?['token'] ?? AppConfig.botToken;
    String  chatId = bot?['chat_id'] ?? AppConfig.chatId;
    try {
      Telegram telegram = Telegram(token);
      bool ok = await telegram.sendMessage(chatId, message, parse_mode: 'HTML').then((res) => true).catchError((err) {
        return false;
      });

      isOk = ok;
    } catch (e, s) {
      Error.check(e, s);
    }

    return isOk;
  }
}
