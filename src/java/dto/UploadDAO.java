/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
public class UploadDAO {
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
    
    public List<Question> readExcel(String excelFilePath) throws IOException {
        List<Question> list = new ArrayList<>();
        InputStream inputStream = new FileInputStream(new File(excelFilePath));
        Workbook workbook = getWorkbook(inputStream, excelFilePath);
        Sheet sheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
                // Ignore header
                continue;
            }
            Iterator<Cell> cellIterator = nextRow.cellIterator();
            Question q = new Question();
            while(cellIterator.hasNext()){
                //Read cell
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if(cellValue == null || cellValue.toString().isEmpty()){
                    continue;
                }
                //set value for question object
                int columnIndex = cell.getColumnIndex();
                switch(columnIndex){
                    case 0:
                        q.setContent((String)getCellValue(cell));
                        break;
                    case 1:
                        q.setOption1((String)getCellValue(cell));
                        break;
                    default:
                        break;
                }
            }
            list.add(q);
        }
        workbook.close();
        inputStream.close();
        
        return list;
    }
    public static void main(String[] args) throws IOException {
        UploadDAO ud = new UploadDAO();
        final String excelFilePath = "G:/Study/FU_FPT/Test/UploadQuestion/question.xlsx";
        List<Question> list = ud.readExcel(excelFilePath);
        for(Question q : list){
            System.out.println(q);
        }
    }
    
    
}
