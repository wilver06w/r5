import 'package:r5/app/models/language.dart';

class Countries {
  List<Language> get all {
    return [

      const Language(
        code: 'ES',
        name: 'Spanish',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/ES.svg',
      ),
          ];
  }
}
