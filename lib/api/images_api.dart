import 'package:test_fluttercrew/core/http_client.dart';
import 'package:test_fluttercrew/models/image_model.dart';

class ImagesApi {
  static Future<List<ImageModel>> getImages() async {
    final response = await HttpClient.api.get(
        'https://api.storyblok.com/v2/cdn/stories/marketfood?version=draft&token=YX1dC80Z9U5IupBCCIbiRgtt&cv=1664543171');

    final content = response.data['story']['content']['img'] as List;

    return content
        .map((image) => ImageModel.fromJson(image as Map<String, dynamic>))
        .toList();
  }
}
