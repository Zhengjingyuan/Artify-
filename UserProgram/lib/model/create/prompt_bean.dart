///Result«String»
class PromptResponse {
  int? code;
  String? data;
  String? msg;

  PromptResponse({
    this.code,
    this.data,
    this.msg,
  });

  factory PromptResponse.fromJson(Map<String, dynamic> json) {
    return PromptResponse(
      code: json['code'] as int?,
      data: json['data'] as String?,
      msg: json['msg'] as String?,
    );
  }

}