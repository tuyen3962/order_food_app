import 'dart:io';

import 'package:order_food_app/config/constant/app_constant_key.dart';
import 'package:order_food_app/config/model/sticker.dart';
import 'package:order_food_app/config/repository/upload/iupload_repository.dart';
import 'package:order_food_app/config/service/server_service.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadRepository extends IUploadRepository {
  final ServerService serverService;

  UploadRepository({required this.serverService});

  SupabaseStorageClient get storage => serverService.supabaseClient.storage;

  @override
  Future<bool> delete(String path) async {
    try {
      await storage.from(BUCKET_ID.IMAGE).remove([path]);
      return true;
    } catch (e) {
      handleError(e);
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(String path, File file, {String? fileName}) async {
    try {
      final name = fileName ?? basename(path);
      final response = await storage
          .from(BUCKET_ID.IMAGE)
          .upload(name, file, fileOptions: const FileOptions(upsert: true));
      return storage.from(BUCKET_ID.IMAGE).getPublicUrl(path);
    } catch (e) {
      handleError(e);
      rethrow;
    }
  }

  @override
  Future<String> uploadVideo(String path, File file, {String? fileName}) async {
    try {
      final name = fileName ?? basename(path);
      return storage.from(BUCKET_ID.IMAGE).upload(name, file);
    } catch (e) {
      handleError(e);
      rethrow;
    }
  }

  @override
  Future<List<Sticker>> getListStickers({int page = 1, int limit = 10}) {
    // TODO: implement getListStickers
    throw UnimplementedError();
  }
}
