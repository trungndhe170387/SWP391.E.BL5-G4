/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import model.Chapter;
import model.Course;
import model.Question;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author HoangAnh
 */
public class QuestionBankDAO extends DBContext {

    //get all question
    public List<Question> getAllQuestion(String sid) {
        List<Question> list = new ArrayList<>();
        String sql = "select * from Question where subject_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setContent(rs.getString("content"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setAnswer(rs.getInt("answer"));
                q.setLevel(rs.getInt("level"));
//                q.setQuiz_id(rs.getInt("quiz_id"));
//                q.setChapter_name(rs.getString("chapter_name"));
//                q.setCourse_name(rs.getString("course_name"));
                list.add(q);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    // get all question by subject id
    public List<Question> getQuestionBySubject(String id, String[] course, String[] chapter) {
        List<Question> list = new ArrayList<>();
        String sql = "select q.*, ch.chapter_name, co.course_name \n"
                + "from Question q \n"
                + "join Quiz quiz on quiz.quiz_id = q.quiz_id\n"
                + "join Chapter ch on ch.chapter_id = quiz.chapter_id\n"
                + "join Course co on co.course_id = ch.course_id\n"
                + "where q.subject_id = ? \n";
        if (course == null || course.length <= 0) {
            sql += "";
        } else {
            sql += "and co.course_id in (0";
            for (String co : course) {
                sql += ("," + co);
            }
            sql += ")";
        }
        if (chapter == null || chapter.length <= 0) {
            sql += "";
        } else {
            sql += ("and ch.chapter_id in (0");
            for (String c : chapter) {
                sql += ("," + c);
            }
            sql += ")\n";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestion_id(rs.getInt("question_id"));
                q.setContent(rs.getString("content"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setAnswer(rs.getInt("answer"));
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setChapter_name(rs.getString("chapter_name"));
                q.setCourse_name(rs.getString("course_name"));
                q.setLevel(rs.getInt("level"));
                list.add(q);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // get course by subject image
    public List<Course> getCourseBySubject(String id) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Course\n"
                + "where subject_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageData = rs.getBytes("image");
                String image = new String(Base64.getEncoder().encode(imageData));
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setCourse_no(rs.getInt("course_no"));
                c.setImage(image);
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // get chapter by subject
    public List<Chapter> getChapterBySubject(String id) {
        List<Chapter> list = new ArrayList<>();
        String sql = "select ch.*\n"
                + "from Chapter ch\n"
                + "join Course c on c.course_id = ch.course_id\n"
                + "join [Subject] s on s.subject_id = c.subject_id\n"
                + "where s.subject_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setChapter_no(rs.getInt("chapter_no"));
                c.setChapter_name(rs.getString("chapter_name"));
                c.setCourse_id(rs.getInt("course_id"));
                list.add(c);
            }

        } catch (SQLException e) {
        }

        return list;
    }

    // update question
    public void editQuestion(String id, String content, String option1, String option2, String option3, String option4, String answer, String level) {
        String sql = "update Question\n"
                + "set [content] = ?,\n"
                + "option1 = ?,\n"
                + "option2 = ?,\n"
                + "option3 = ?,\n"
                + "option4 = ?,\n"
                + "answer = ?,\n"
                + "level = ?\n"
                + "where question_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.setString(7, level);
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //===============================================================================================================================================
    //===================================================== UPLOAD QUESTION BY EXCEL ================================================================
    private static Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellType();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;
            case FORMULA:
                Workbook workbook = cell.getSheet().getWorkbook();
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                cellValue = evaluator.evaluate(cell).getNumberValue();
                break;
            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }
        return cellValue;
    }

    private Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        } else {
            throw new IllegalArgumentException("File is not Excel file");
        }
        return workbook;
    }

    // ------------- Read File Excel ---------------
    public List<Integer> importQuestion(String excelFilePath, String chapter, String subject) throws IOException {
        excelFilePath = "D:/FPTU/Sem5/SWP391/UploadQuestion/" + excelFilePath;
        List<Question> list = new ArrayList<>();
        InputStream inputStream = new FileInputStream(new File(excelFilePath));
        Workbook workbook = getWorkbook(inputStream, excelFilePath);
        Sheet sheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Question q = new Question();
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
                // Ignore header
                continue;
            }
            q.setRowNum(nextRow.getRowNum()+1);
            Iterator<Cell> cellIterator = nextRow.cellIterator();
            while (cellIterator.hasNext()) {
                //Read cell
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                //set value for question object
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case 0:
                        q.setContent((String) (getCellValue(cell) + ""));
                        break;
                    case 1:
                        q.setOption1((String) (getCellValue(cell) + "").split(".0")[0]);
                        break;
                    case 2:
                        q.setOption2((String) (getCellValue(cell) + "").split(".0")[0]);
                        break;
                    case 3:
                        q.setOption3((String) (getCellValue(cell) + "").split(".0")[0]);
                        break;
                    case 4:
                        q.setOption4((String) (getCellValue(cell) + "").split(".0")[0]);
                        break;
                    case 5:
                        q.setAnswer(new BigDecimal((double) cellValue).intValue());
                        break;
                    case 6:
                        q.setLevel(new BigDecimal((double) cellValue).intValue());
                        break;
                    default:
                        break;
                }
            }
            list.add(q);
        }
        workbook.close();
        inputStream.close();

        List<Integer> listError = new ArrayList<>();
        for (Question q : list) {
            if (!checkAdd(q)) {
                listError.add(q.getRowNum());
            }
        }
        if (listError.isEmpty()) {
            for (Question q : list) {
                    addQuestion(q, chapter, subject);
            }
        }
        return listError;
    }

    private static boolean checkAdd(Question q) {
        int count = 0;
        if (q.getOption1() != null && !q.getOption1().trim().isEmpty()) {
            count++;
        }
        if (q.getOption2() != null && !q.getOption2().trim().isEmpty()) {
            count++;
        }
        if (q.getOption3() != null && !q.getOption3().trim().isEmpty()) {
            count++;
        }
        if (q.getOption4() != null && !q.getOption4().trim().isEmpty()) {
            count++;
        }
        return q.getContent() != null && !q.getContent().trim().isEmpty() && count > 1 && q.getAnswer() != 0 && q.getLevel() != 0;
    }

    private static void addQuestion(Question q, String chapter, String subject) {
        String sql = "insert into Question(content, option1, option2, option3, option4, answer, subject_id, quiz_id, [level])\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            DBContext dbc = new DBContext();
            PreparedStatement ps = dbc.connection.prepareStatement(sql);
            int count = 0;
            if (q.getOption1() != null && !q.getOption1().trim().isEmpty()) {
                count++;
            }
            if (q.getOption2() != null && !q.getOption2().trim().isEmpty()) {
                count++;
            }
            if (q.getOption3() != null && !q.getOption3().trim().isEmpty()) {
                count++;
            }
            if (q.getOption4() != null && !q.getOption4().trim().isEmpty()) {
                count++;
            }
            if (q.getContent() != null && !q.getContent().trim().isEmpty() && count > 1 && q.getAnswer() != 0 && q.getLevel() != 0) {
                ps.setString(1, q.getContent());
                ps.setString(2, q.getOption1() == null ? "" : q.getOption1());
                ps.setString(3, q.getOption2() == null ? "" : q.getOption2());
                ps.setString(4, q.getOption3() == null ? "" : q.getOption3());
                ps.setString(5, q.getOption4() == null ? "" : q.getOption4());
                ps.setInt(6, q.getAnswer());
                ps.setString(7, subject);
                ps.setString(8, chapter);
                ps.setInt(9, q.getLevel());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }
    //===================================================== END IMPORT QUESTIONS BY EXCEL FILE ======================================================
    //===============================================================================================================================================

    // delete questions
    public void deleteQuestion(String[] questionId) {
        String sql = "delete from Question\n"
                + "where question_id = ?";
        try {
            for (String id : questionId) {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, id);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

    // add 1 question to chapter
    public void addOneQuestion(String content, String option1, String option2, String option3, String option4,
            String answer, String chapter, String subject, String level) {
        String sql = "insert into Question(content, option1, option2, option3, option4, answer, subject_id, quiz_id, [level])\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.setString(7, subject);
            ps.setString(8, chapter);
            ps.setString(9, level);
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    // MAIN TEST
    public static void main(String[] args) throws IOException {
        QuestionBankDAO q = new QuestionBankDAO();
        String id = "1";
        String course[] = {};
        String chapter[] = {"1", "2"};
//        q.importQuestion("test1.xlsx", "21", "3");
//        List<Question> list = q.readExcel("question.xlsx");
//        for (Question qe : list) {
//            System.out.println(qe);
//        }
    }
}
