class Environment {
  BuildVariant _buildVariant;
  static BuildVariant buildVariant;
  static const _pro = 'PRO';
  static const _dev = 'DEV';

  static String baseUrl = "";

  static const _baseUrlPro = 'https://reqres.in/api/';
  static const _baseUrlDev = 'https://reqres.in/api/';

  Environment(this._buildVariant){
    buildVariant = _buildVariant;
    switch (_buildVariant) {
      case BuildVariant.PRO:
          baseUrl = _baseUrlPro;
        break;
      case BuildVariant.DEV:
          baseUrl = _baseUrlDev;
        break;
      default:
    }
  }
}

enum BuildVariant {PRO,DEV}