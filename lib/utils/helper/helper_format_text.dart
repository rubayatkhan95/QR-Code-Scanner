String convertNumberEnglishToBangla(String eng) {
  String bengali = '';
  for (int i = 0; i < eng.toString().length; i++) {
    switch (eng.toString()[i]) {
      case '1':
        bengali = bengali + '১';
        break;
      case '2':
        bengali = bengali + '২';
        break;
      case '3':
        bengali = bengali + '৩';
        break;
      case '4':
        bengali = bengali + '৪';
        break;
      case '5':
        bengali = bengali + '৫';
        break;
      case '6':
        bengali = bengali + '৬';
        break;
      case '7':
        bengali = bengali + '৭';
        break;
      case '8':
        bengali = bengali + '৮';
        break;
      case '9':
        bengali = bengali + '৯';
        break;
      case '0':
        bengali = bengali + '০';
        break;
      default:
        bengali = bengali + '-';
    }
  }
  return bengali;
}
