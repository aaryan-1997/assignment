class RawData {
  OperationResult? operationResult;
  dynamic data;
  RawData({this.data, this.operationResult});
}

enum OperationResult { success, fail }
