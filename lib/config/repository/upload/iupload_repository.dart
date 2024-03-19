import 'dart:io';

import 'package:order_food_app/config/model/sticker.dart';
import 'package:order_food_app/config/repository/ibase_repository.dart';

abstract class IUploadRepository extends IBaseRepository {
  Future<String> uploadImage(String path, File file, {String? fileName});
  Future<String> uploadVideo(String path, File file, {String? fileName});
  Future<bool> delete(String path);
  Future<List<Sticker>> getListStickers({int page = 1, int limit = 10});
}
