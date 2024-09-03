// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
//
// class DeviceInfoService {
//   Future<int> deviceVersion() async {
//     DeviceInfoPlugin plugin = DeviceInfoPlugin();
//     AndroidDeviceInfo deviceInfo = await plugin.androidInfo;
//     return int.parse(deviceInfo.version.release);
//   }
//
//   Future<String> createFolder(String folderName) async {
//     final folderDirectory = Directory("storage/emulated/0/Documents/$folderName");
//     if (!(await folderDirectory.exists())) {
//       folderDirectory.create();
//     }
//     return folderDirectory.path;
//   }
// }


import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService{
  Future<int> deviceVersion() async{
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo deviceInfo =  await plugin.androidInfo;
    return int.parse(deviceInfo.version.release);
  }


  Future<String> createFolder( String folderName) async{
    final folderDirectory = Directory("storage/emulated/0/Download/$folderName");
    if(!( await folderDirectory.exists())){
      folderDirectory.create();
    }
    return folderDirectory.path;
  }

}

///absolute path
///relative path
