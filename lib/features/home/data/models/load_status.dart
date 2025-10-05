class LoadStatus {
  final int code;
  static const initial = LoadStatus(0);
  static const loading = LoadStatus(1);
  static const success = LoadStatus(2);
  static const error = LoadStatus(3);

  const LoadStatus(this.code);

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isError => this == error;

  bool contain(List<LoadStatus> statuses) => statuses.contains(this);

  @override
  String toString() {
    switch (code) {
      case 0:
        return "Initial";
      case 1:
        return "Loading";
      case 2:
        return "Success";
      case 3:
        return "Error";
      default:
        return "Unknown";
    }
  }
}
