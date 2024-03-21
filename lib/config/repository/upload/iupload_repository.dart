import 'dart:io';

import 'package:order_food_app/config/repository/ibase_repository.dart';

abstract class IUploadRepository extends IBaseRepository {
  Future<String> uploadImage(String path, File file, {String? fileName});
  Future<String> uploadVideo(String path, File file, {String? fileName});
  Future<bool> delete(String path);
}
