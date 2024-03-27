class RemoteDataException implements Exception {
  String message;

  RemoteDataException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServiceException implements Exception {
  String message;

  ServiceException(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalDataException implements Exception {
  String message;

  LocalDataException(this.message);

  @override
  String toString() {
    return message;
  }
}

class InternalException implements Exception {
  String message;

  InternalException(this.message);

  @override
  String toString() {
    return message;
  }
}