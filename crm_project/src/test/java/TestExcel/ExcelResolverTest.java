package TestExcel;

import com.xz.crm.commons.utils.HSSFUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.InputStream;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-17-上午 10:38
 * @since 2022/8/17 0017-上午 10:38
 */
public class ExcelResolverTest {


    @Test
    public void ExcelResolver() throws Exception {

        InputStream is = new FileInputStream("E:\\BaiduNetdiskDownload\\temp.xls");
        HSSFWorkbook wb = new HSSFWorkbook(is);
        HSSFSheet sheet = wb.getSheetAt(0);//获取第一个工作簿
        HSSFRow row = null;
        HSSFCell cell = null;
//        获取一行
        for (int i = 0; i <= sheet.getLastRowNum(); i++){//sheet.getLastRowNum()最后一行的下表 例如有 5行数据，则最后一行的下表是4
            row = sheet.getRow(i);//行的下标 从0开始，依次增加
                 //获取当前行的  的列 下表从0开始，依次增加
            for (int j = 0; j < row.getLastCellNum(); j++) {//row.getLastCellNum():获取总列数（最后一列下标+1）
                cell = row.getCell(j);//列的下标 从0开始，依次增加
                System.out.print(HSSFUtils.getCellValueToStr(cell)+" ");
            }

        System.out.println();
        }
    }


}
