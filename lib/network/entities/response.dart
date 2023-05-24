class NetworkResponse {
  final bool isSocketException;
  final bool isSuccessful;
  final dynamic data;
  final String? error;

  NetworkResponse({required this.isSuccessful, this.isSocketException = false, this.data, this.error});

  @override
  String toString() => "isSuccessful: $isSuccessful, isSocketException: $isSocketException, data: $data, error: $error";
}