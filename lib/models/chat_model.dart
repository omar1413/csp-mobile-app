class ChatModel {
  List<String> _answers = [
    "هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر  هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر   هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر  ",
    "هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبالشاطهر  ",
    "هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر  هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر   هو ببساطه نص شكلى بع ودور النشر  ",
    "هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر  هو ببساطه نص شكلى بمعنى ان الغايه هي الشكل وليس المحتوى وبستخدم فى صناعات المطابع ودور النشر   هو ببساطه نص شكلى بمعنى ان الغايه هي شر  ",
  ];
  late Map<String, String> questions;
  String lastElement = "اخبار الطريق";

  ChatModel() {
    questions = {
      "ما هى سرعه الطريق الحالى ؟": _answers[0],
      "سعر رسوم عبور البوابه": _answers[1],
      "الطقس الحالى على الطريق": _answers[2],
      lastElement: _answers[3],
    };
  }
}
