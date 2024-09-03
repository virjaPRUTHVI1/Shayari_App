import 'package:permission_handler/permission_handler.dart';

class UserPermissionService {
  Future<bool> requestForStoragePermission() async {
    var storagePermissionStatus = await Permission.storage.status;
    if (storagePermissionStatus.isDenied) {
      // no permission
      storagePermissionStatus = await Permission.storage.request();
    }
    return storagePermissionStatus == PermissionStatus.granted;
  }
}

// import 'package:permission_handler/permission_handler.dart';
//
// class UserPermissionService{
//   Future<bool> requestForStoragePermission() async{
//     var storagePermissionStatus =await Permission.storage.status;
//     if(storagePermissionStatus.isDenied){
//       storagePermissionStatus = await Permission.storage.request();
//     }
//     return storagePermissionStatus == storagePermissionStatus.isGranted;
//   }
// }/// if storagepermissionstatus is still denied??????