import 'package:r5/app/models/language.dart';

class Countries {
  List<Language> get all {
    return [
      const Language(
        code: 'EN',
        name: 'English',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/US.svg',
      ),
      const Language(
        code: 'ES',
        name: 'Spanish',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/ES.svg',
      ),
      const Language(
        code: 'PT',
        name: 'Portuguese',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/BR.svg',
      ),
      const Language(
        code: 'KR',
        name: 'Korean',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/KR.svg',
      ),
      const Language(
        code: 'CN',
        name: 'Chinesse',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/CN.svg',
      ),
      const Language(
        code: 'FR',
        name: 'French',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/FR.svg',
      ),
      const Language(
        code: 'IT',
        name: 'Italian',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/IT.svg',
      ),
      const Language(
        code: 'IN',
        name: 'Hindi',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/IN.svg',
      ),
      const Language(
        code: 'RU',
        name: 'Russian',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/RU.svg',
      ),
      const Language(
        code: 'PH',
        name: 'Tagalog',
        imageUrl: 'https://demo.verifik.co/assets/images/flags/PH.svg',
      ),
    ];
  }
}
