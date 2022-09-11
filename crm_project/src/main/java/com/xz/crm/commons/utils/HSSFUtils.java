package com.xz.crm.commons.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-17-上午 11:37
 * @since 2022/8/17 0017-上午 11:37
 */
public class HSSFUtils {
    public static String getCellValueToStr(HSSFCell cell){


        String ret="";
        if (cell.getCellType()== HSSFCell.CELL_TYPE_STRING){
            ret=cell.getStringCellValue();
        }else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
            ret= cell.getBooleanCellValue()+"";
        }else if (cell.getCellType()==HSSFCell.CELL_TYPE_FORMULA){
            ret =cell.getCellFormula();
        }else  if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC) {
            ret = cell.getNumericCellValue()+"";
        }else {
            ret= "";
        }
        return ret;
    }
}
