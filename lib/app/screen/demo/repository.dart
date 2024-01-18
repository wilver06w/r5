import 'package:r5/app/models/compare.dart';
import 'package:r5/app/models/document.dart';
import 'package:r5/app/models/liveness.dart';
import 'package:r5/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.verifikHttpClient,
  });

  final VerifikHttpClient verifikHttpClient;

  final scanDemo = '/v2/ocr/scan-demo';
  final compareRecognition = '/v2/face-recognition/compare/demo';
  final livenessDemo = '/v2/face-recognition/liveness/demo';

  Future<DocumentDetails> getDetails(String image) async {
    final response = await verifikHttpClient.msDio.post(
      scanDemo,
      data: {
        'image': image,
      },
    );

    return DocumentDetails.fromJson(response.data);
  }

  Future<Compare> getCompareRecognition({
    required String probe,
    required String gallery,
  }) async {
    final response = await verifikHttpClient.msDio.post(
      compareRecognition,
      data: {
        'probe': [probe],
        'gallery': [gallery],
        'search_mode': 'ACCURATE'
      },
    );

    return Compare.fromJson(response.data);
  }

  Future<Liveness> getLiveness({
    required String image,
  }) async {
    final response = await verifikHttpClient.msDio.post(
      livenessDemo,
      data: {
        'os': 'DESKTOP',
        'image': image,
      },
    );

    return Liveness.fromJson(response.data);
  }
}
