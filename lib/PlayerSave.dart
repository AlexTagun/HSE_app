

class PlayerSave {
  int quizType;
  int correctAnswerCount;
  int currentQuestionId;
  List<int> questionIndexers;

  PlayerSave(
      {this.quizType,
        this.correctAnswerCount,
        this.currentQuestionId,
        this.questionIndexers});

  PlayerSave.fromJson(Map<String, dynamic> json) {
    quizType = json['quiz_type'];
    correctAnswerCount = json['correct_answer_count'];
    currentQuestionId = json['current_question_id'];
    questionIndexers = json['question_indexers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz_type'] = this.quizType;
    data['correct_answer_count'] = this.correctAnswerCount;
    data['current_question_id'] = this.currentQuestionId;
    data['question_indexers'] = this.questionIndexers;
    return data;
  }
}