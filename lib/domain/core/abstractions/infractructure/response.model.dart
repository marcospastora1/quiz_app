class Response<T> {
  final int? statusCode;
  final T? payload;

  bool get success {
    return (statusCode ?? 500) <= 200;
  }

  const Response({required this.statusCode, required this.payload});

  @override
  String toString() {
    return '${statusCode ?? 0} - ${payload?.toString() ?? 'Sem resposta'}';
  }
}
