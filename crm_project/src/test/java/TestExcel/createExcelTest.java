package TestExcel;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * @Description 测试将数据封装到excel文件中
 * @auther zhen
 * @create 2022-08-16-下午 03:54
 * @since 2022/8/16 0016-下午 03:54
 */
public class createExcelTest  {
    @Test
    public void Test() throws IOException {
        HSSFWorkbook wb= new HSSFWorkbook(); //一个excel对象

        HSSFSheet wbSheet = wb.createSheet("第一页工作簿");

        HSSFRow row = wbSheet.createRow(0);//工作簿中的一行对象，下标从0开始

        HSSFCell cell = row.createCell(0);//一行中的单元格对象 下表从0开始
            cell.setCellValue("编号");
            cell=row.createCell(1);
            cell.setCellValue("姓名");
            cell=row.createCell(2);
            cell.setCellValue("分数");

            for (int i =1;i<=10;i++){
                row=wbSheet.createRow(i);
                cell=row.createCell(0);
                cell.setCellValue("编号100"+i);
                cell=row.createCell(1);
                cell.setCellValue("姓名"+i);
                cell=row.createCell(2);
                cell.setCellValue("分数"+(int) (Math.random()*(100-1)+1));

            }

        OutputStream  os=new FileOutputStream("E:\\BaiduNetdiskDownload\\temp.xls");
            wb.write(os);

            os.flush();
        os.close();
        wb.close();
        System.out.println("输出完成");

    }
}
