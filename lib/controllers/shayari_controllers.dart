
import 'package:my_shayari_app/models/category_model.dart';
import 'package:my_shayari_app/storage/shayari_storage.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../services/device_info_service.dart';
import '../services/share_services.dart';
import '../services/user_permission_service.dart';
import '../services/widgets_to_image_service.dart';

class ShayariControllers{
  List fetchAllCategories(){
    return shayari.map((category) => Category.fromJson(category)).toList();
  }

  final _deviceService = DeviceInfoService();
  final _permissionService = UserPermissionService();
  final _shareService = ShareService();
  final _widgetsToImageService = WidgetsToImageService();
  final _widgetsToImageController = WidgetsToImageController();

  get widgetsToImageController => _widgetsToImageController;

  Future<void> shareImage() async {
    print('!!!!!!!!!!!!!: Share button clicked!');
    int version = await _deviceService.deviceVersion();

    if (version < 13) {
      bool status = await _permissionService.requestForStoragePermission();

      if (status) {
        // we can share image now
        _shareImage();
      } else {
        print('No Permission');
      }
      // can't
    } else {
      _shareImage();
    }
    // no need
  }


  Future<void> _shareImage() async {
    String folderPath = await _deviceService.createFolder('Shayari Image');

    DateTime now = DateTime.now();

    String imageName =
        'IMAGE${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}${now.millisecond}.jpg';

    String path = await _widgetsToImageService.makeImage(
        _widgetsToImageController,
        filePath: '$folderPath/$imageName');

    _shareService.shareFile(path);
  }
}