import 'package:my_shayari_app/services/user_permission_service.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:sir_share_image/services/user_permission_service.dart';
//
// class ShareService extends UserPermissionService {
//   Future<void> shareFile(String imagePath) async {
//     await Share.shareXFiles([XFile(imagePath)]);
//   }
// }
///[Xfile(imagePath)]  represent the list of files whatever u want to share even if ypu want to share only single file in this cases [Xfile]is necessary..........

class ShareService extends UserPermissionService{
  void shareFile(String imagePath) async{
    await Share.shareXFiles([XFile(imagePath)]);
  }
}