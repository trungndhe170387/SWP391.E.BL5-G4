/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lam12
 */
public class QuestionL {

    private int question_id;
    private String content, option1, option2, option3, option4;
    private int answer;
    private int subject_id;
    private int quiz_id;
    private int level;

    public QuestionL() {
    }

    public QuestionL(int question_id, String content, String option1, String option2, String option3, String option4, int answer, int subject_id, int quiz_id, int level) {
        this.question_id = question_id;
        this.content = content;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.answer = answer;
        this.subject_id = subject_id;
        this.quiz_id = quiz_id;
        this.level = level;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "QuestionL{" + "question_id=" + question_id + ", content=" + content + ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", answer=" + answer + ", subject_id=" + subject_id + ", quiz_id=" + quiz_id + ", level=" + level + '}';
    }
    
    

}
