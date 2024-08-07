extension StringExtensions on String {
  String get simplify {
    if(contains('status code of 400')) return 'Bad Request: Request with wrong parameter';
    if(contains('status code of 404')) return 'Not Found: Unknown request';
    if(contains('status code of 500')) return 'Offline Server: Request Unsuccessful';
    return 'Generic Fail';
  }
}