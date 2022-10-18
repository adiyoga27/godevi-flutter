
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:godevi/app/core/utils/helpers.dart';
import 'package:godevi/app/core/values/app_config.dart';
import 'package:godevi/app/services/storage/storage.dart';
import 'package:mixins/mixins.dart';
import 'dart:io' show Platform;

class Error {
  static check(e, StackTrace s, {Map<String, dynamic>? request}) async {
    try {
      List frames = Trace.current().frames, terseFrames = Trace.from(s).terse.frames;

      if (frames.isEmpty) {
        return clog('-- ErrorHandler: No frames in stack trace.');
      }

      Frame frame = Trace.current().frames[frames.length > 1 ? 1 : 0];
      Frame trace = Trace.from(s).terse.frames[terseFrames.length > 1 ? 1 : 0];

      String errorLocation = '${frame.member}', errorLine = '${trace.line}';

      // print error on console
      List<String> failNetwork = ['SocketException', 'Failed host lookup', 'NetworkException'];

      if (failNetwork.any((n) => e.toString().contains(n))) {
        clog('-- NO INTERNET CONNECTION, $e');
        Error.show('Tidak ada koneksi internet, pastikan koneksi internet Anda stabil.');
      } else {
        clog('-- Catch error on $errorLocation (Line $errorLine), $e');

        // get error info
        String errorMessage = '$e'.removeHtmlTag;
        String errorMessageFirstLine = errorMessage.split('\n')[0]; // get first line of error message

        // get get method and line of error
        String errorAt = '$errorLocation (Line $errorLine)';

        // get device info
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        String? brand = Platform.isAndroid ? androidInfo.brand : 'iosInfo.name';
        String? model = Platform.isAndroid ? androidInfo.model : 'iosInfo.model';

        // get app info
        String appVersion = AppConfig.version, buildNumber = AppConfig.buildDate + AppConfig.build;

        // GET USER INFO ==========================================================
        // UserModel auth = await Auth.user();
        String name = '';
        // ========================================================================

        List<String> errorList = [
          '<b>Details</b>',
          errorAt,
          Platform.isAndroid
              ? '$brand ($model) - SDK: ${androidInfo.version.sdkInt}'
              : '$brand ($model) - ${'iosInfo.systemName'}, ${'iosInfo.systemVersion'}',
          '$name ($appVersion $buildNumber)'
        ];

        // check if error come from http request
        String? url = request?['url'], method = request?['method'];

        if (url != null) {
          // get time request
          dynamic time = await storage.read(url);
          String timeRequest = time == null ? '-' : '${time / 1000} ${time >= 1000 ? "s" : "ms"}';

          // change error message at first index
          errorList[1] = '[$method] $url - $timeRequest';
        }

        String details = errorList.join('\n');

        // send error with bot
        if (AppConfig.bot) {
          bool isErrNotSubtype = errorMessage.contains('is not a subtype of');

          if (isErrNotSubtype) {
            String pattern = r"(?<=\')(.*?)(?=\')";
            RegExp regExp = RegExp(pattern);

            Iterable<RegExpMatch> matches = regExp.allMatches(errorMessageFirstLine.replaceAll(' ', ''));
            List<String?> result = matches.map((e) => e.group(0)).toList();

            result.removeWhere((e) => e == 'isnotasubtypeoftype');
            errorMessageFirstLine += '. Lihat info error lebih detail, error.gscode.org?et=not-subtype';
          }

          String message = '$errorMessageFirstLine\n\n$details';
          bool isTimeOut = errorMessage.contains('connectTimeout');

          if (isTimeOut) {
            return Error.show('Opps! Terjadi kesalahan, periksa kembali koneksi internet Anda.');
          }

          Error.show('Terjadi kesalahan, tim kami akan segera memperbaikinya.');

          Map? c = storage.read('app_config');
          Map? bot = c?['bot'];

          bool active = bot?['active'] ?? AppConfig.bot;
          // String token = bot?['token'] ?? AppConfig.botToken;
          // String chatId = bot?['chat_id'] ?? AppConfig.chatId;

          if (active) {
            await Telebot.sendMessage(message);
          }
        }
      }
    } catch (e) {
      clog('-- ErrorHandler.check : $e');
    }
  }

  static void show(dynamic message, [int duration = 5]) =>
      EasyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));
}
