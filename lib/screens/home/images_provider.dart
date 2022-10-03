import 'package:riverpod/riverpod.dart';
import 'package:test_fluttercrew/api/images_api.dart';

final imagesProvider = FutureProvider((ref) async {
  return ImagesApi.getImages();
});
