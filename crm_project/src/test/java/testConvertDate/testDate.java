package testConvertDate;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import org.junit.Test;

import javax.lang.model.SourceVersion;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-11-下午 10:00
 * @since 2022/8/11 0011-下午 10:00
 */
public class testDate {
    @Test
    public void Test() throws ParseException {
        String a="2023-11-27 21:50:05";
        Date date = Convert.toDate(a);

        long time = date.getTime();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date parse = sdf.parse(a);
        long time1 = parse.getTime();
        System.out.println("time1 = " + time1);
        if (time1==time){
            System.out.println("时间相等");
        }
        else {
            System.out.println("时间不相等");
        }
        System.out.println("time = " + time);
    }

    @Test
    public void testDA(){
        String now = DateUtil.now();
        System.out.println("now = " + now);


    }

    @Test
    public void Test2(){

        for (int j = 0; j < 10; j++)
        {int i= (int) (Math.random()*(40-1)+1);

            System.out.println(i);
        }
    }
}
