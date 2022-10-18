
import 'package:godevi/app/core/utils/error_handler.dart';
import 'package:godevi/app/services/storage/storage.dart';
import 'package:godevi/app/widgets/info_widget.dart';
import 'package:mixins/mixins.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FBApp {
  FBApp._();
  static final FBApp instance = FBApp._();

  final CollectionReference collection = FirebaseFirestore.instance.collection('config');

  Future<void> listenAppConfig() async {
    String mode = 'prod';

    try {
      collection.doc(mode).snapshots().listen((e) async {
        if (e.exists) {
          Map data = e.data() as Map;

          clog('LISTEN TO APP CONFIG : $data', limit: 1500);

          // save to local storage
          await storage.write('app_config', data);

          // check app locked
          // todo: if locked, show lock screen
          bool locked = await AppManager.checkAppStatus();

          if (!locked) {
            // check app version
            // todo: if current version is not equal to the version in firebase
            bool mustUpdate = await AppManager.checkUpdate();

            if (!mustUpdate) {
              // check app maintenance
              // todo: if maintenance, show maintenance screen
              AppManager.checkMaintenance();
            }
          }
        }
      });
    } catch (e, s) {
      Error.check(e, s);
    }
  }

  // generate data structure for firebase

  Future generate({bool update = false}) async {
    try {
      Map<String, dynamic> map = {
        'app': {
          'name': 'JCC App',
          'version': '1.0.0',
          'build': '1',
          'build_date': '22.12.1',
          'required_to_update': false,
        },
        'app_lock': {
          'lock': false,
          'message':
              'Mohon maaf untuk ketidaknyamanan Anda, berhubung Gedung Data Center mengalami insiden kebakaran, terjadi gangguan akses untuk sementara. Kami sedang berusaha memindahkan akses ke lokasi lain.',
          'title': 'MOHON PERHATIAN',
        },
        'app_maintenance': {
          'message':
              'Kami akan melakukan maintenance server pada tanggal 15 desember 2070 (pukul 13.00 - 16.00 WITA). Aplikasi tidak akan dapat diakses pada hari dan waktu tersebut, terimakasih.',
          'title': 'PENGUMUMAN',
          'show': false
        },
        'keys': {
          'kommunicate': '2d7d4cbad304090137e385bb770aa3753',
          'raja_ongkir': 'd8edd63ffc400ee2f2db662d3ff788ed',
        },
        'operational': {
          'op1': ['Senin - Jumat', '09.00 - 17.00 WITA'],
          'op2': ['Sabtu', '09.00 - 12.00 WITA'],
        },
        'contact': {
          'phone': {
            'cc': '0361 9008384',
            'cs': '0822 108 108 78',
          },
          'address': 'Jl. Gn. Andakasa No.38, Padangsambian, Kec. Denpasar Bar., Kota Denpasar, Bali 80118',
          'gps': {'lat': -8.639872, 'lng': -8.639872},
          'email': 'contact@jcc.co.id',
          'site': 'https://jcc-corp.co.id/',
        },
        'about': {
          'about_jcc':
              'PT. Jasmine Cahaya Cemerlang adalah perusahaan direct selling yang berbasis e-commerce yang didirikan tahun 2022 dengan tujuan utama yaitu melahirkan entrepreneur berkarakter spiritual tinggi sehingga mampu berkomitmen, mandiri dan inovatif dalam mengembangkan bisnis pemasaran di dukung oleh support sistem BBB yang handal, profesional, berteknologi modern sehingga bisa memberikan edukasi yang tepat, praktis, berkualitas. Bersama JCC dan support sistem BBB siapapun anda dengan latar belakang apapun berhak untuk menjadi pribadi sukses cemerlang.',
          'privacy_policy': 'https://jcc-corp.co.id/privacy-policy/',
          'term_of_use': 'https://jcc-corp.co.id/term-of-use/',
          'guide': 'https://jcc-corp.co.id/guide/',
          'ratings': {
            'playstore': 'https://play.google.com/store/apps/details?id=com.jcc.jcc',
            'appstore': 'https://apps.apple.com/us/app/jcc-corp/id1498420001',
          }
        },
        'bot': {'active': true, 'token': '1650513497:AAG5-o3fW_Fe45xOJfNMAxDxRDrLXPubdHM', 'chat_id': '-691521815'}
      };

      if (update) {
        await collection.doc('dev').update(map);
        await collection.doc('prod').update(map);
        return;
      }

      collection.doc('dev').set(map);
      collection.doc('prod').set(map);
    } catch (e, s) {
      Error.check(e, s);
    }
  }
}
