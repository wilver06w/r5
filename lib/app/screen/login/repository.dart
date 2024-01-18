import 'package:r5/app/models/compare.dart';
import 'package:r5/app/models/document.dart';
import 'package:r5/app/models/liveness.dart';
import 'package:r5/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.verifikHttpClient,
  });

  final VerifikHttpClient verifikHttpClient;

  // final scanDemo = '/v2/ocr/scan-demo';

  // Future<DocumentDetails> getDetails(String image) async {
  //   final response = await verifikHttpClient.msDio.post(
  //     scanDemo,
  //     data: {
  //       'image': image,
  //     },
  //   );

  //   return DocumentDetails.fromJson(response.data);
  // }

}
