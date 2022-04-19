package com.wanjiaxin.controller;


import com.wanjiaxin.po.*;
import com.wanjiaxin.service.HourseService;
import com.wanjiaxin.service.RentService;
import com.wanjiaxin.service.UserInfoService;
import com.wanjiaxin.service.WantHourseInfoService;
import com.wanjiaxin.utils.ExportExcelUtil;
import com.wanjiaxin.utils.UserException;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//PriceRange管理控制层
@Controller
@RequestMapping("/Rent")
public class RentController {
    /*业务层对象*/
    @Resource
    HourseService hourseService;
    @Resource
    WantHourseInfoService wantHourseInfoService;
    @Resource
    RentService rentService;

    /*客户端ajax方式提交添加楼盘信息信息*/
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@Validated int wantHourseId,HttpServletRequest request, HttpServletResponse response) throws Exception {
        WantHourseInfo wantHourseInfo = wantHourseInfoService.getWantHourseInfo(wantHourseId);
        UserInfo userInfo = wantHourseInfo.getUserObj();
        request.setAttribute("wantHourseInfo",wantHourseInfo);
        request.setAttribute("user_rent",userInfo);
        return "Rent/add";
    }
    /*客户端ajax方式提交添加楼盘信息信息*/
    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    public void deletes(int hourseId,HttpServletRequest request, HttpServletResponse response) throws Exception {
        Rent rent = rentService.queryRent(hourseId);
        rent.getHourseObj().setUserInfo(null);
        hourseService.updateHourse(rent.getHourseObj());
        boolean c = rentService.delete(rent.getId());
        String message = "";
        if(c){
            message = "记录删除成功";
        }else {
            message = "记录删除失败";
        }
        writeJsonResponse(response, c, message);
    }
    /*客户端ajax方式提交添加楼盘信息信息*/
    @RequestMapping(value = "/addRent", method = RequestMethod.POST)
    public String add(int wantHourseInfoId,String userName,String starttime,String endtime,String rentprice,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        Rent rent = new Rent();
        WantHourseInfo wantHourseInfo = wantHourseInfoService.getWantHourseInfo(wantHourseInfoId);
        Hourse hourse = hourseService.getHourse(wantHourseInfo.getHourseId());
        //hourse只有一间，因此先判断房间是否合格
        Rent q = rentService.queryRent(hourse.getHourseId());
        //不管是否插入成功，都将wantHourseInfo从数据库删除：
        wantHourseInfoService.deleteWantHourseInfo(wantHourseInfo.getWantHourseId());
        if(q != null && q.getStarttime() != null){
            throw new UserException("房子已经出租！");
        }
        UserInfo userInfo = wantHourseInfo.getUserObj();
        //填充rent对象
        rent.setHourseObj(hourse);;
        rent.setUserInfoObj(userInfo);
        rent.setStarttime(starttime);
        rent.setEndtime(endtime);
        rent.setRentprice(Float.parseFloat(rentprice));
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = sdf.format(d);
        rent.setNowtime(dateNowStr);
        hourse.setUserInfo(userInfo.getUser_name());
        System.out.println(hourse.toString());
        try{
            rentService.addRent(rent);
            hourseService.updateHourse(hourse);
        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new UserException("添加合同失败");
        }

        request.setAttribute("rent",rent);
        return "Rent/contract";
    }
    @RequestMapping(value = "/Check", method = RequestMethod.GET)
    public String Check(@Validated int hourseId,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(hourseId+"============");
        Hourse hourse = hourseService.getHourse(hourseId);
        Rent rent = rentService.queryRent(hourse.getHourseId());
        request.setAttribute("rent",rent);
        return "Rent/contract";
    }
    /*ajax方式按照查询条件分页查询租金范围信息*/
    @RequestMapping(value = { "/list" }, method = {RequestMethod.GET,RequestMethod.POST})
    public void list(Integer page, Integer rows, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (page==null || page == 0) {
            page = 1;
        }
        if(rows != 0) {
            rentService.setRows(rows);
        }
        List<Rent> priceRangeList = rentService.queryRent1(page);
        /*计算总的页数和总的记录数*/
        rentService.queryTotalPageAndRecordNumber();
        /*获取到总的页码数目*/
        int totalPage = rentService.getTotalPage();
        /*当前查询条件下总记录数*/
        int recordNumber = rentService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //将要被返回到客户端的对象
        JSONObject jsonObj=new JSONObject();
        jsonObj.accumulate("total", recordNumber);
        List<JSONObject> list = new ArrayList<>();
        for(Rent priceRange:priceRangeList) {
            JSONObject jsonPriceRange = priceRange.getJsonObject();
            list.add(jsonPriceRange);
        }
        jsonObj.accumulate("rows", list);
        out.println(jsonObj.toString());
        out.flush();
        out.close();
    }
    /*按照查询条件导出租金范围信息到Excel*/
    @RequestMapping(value = { "/OutToExcel" }, method = {RequestMethod.GET,RequestMethod.POST})
    public void OutToExcel( Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        List<Rent> priceRangeList = rentService.queryRentRange();
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "Rent信息记录";
        String[] headers = {"合同id","房屋id", "用户名","开始租房时间","结束租房时间","租金","合同签订时间"};
        List<String[]> dataset = new ArrayList<String[]>();
        for (int i = 0; i < priceRangeList.size(); i++) {
            Rent priceRange = priceRangeList.get(i);
            dataset.add(new String[]{priceRange.getId() + "", String.valueOf(priceRange.getHourseObj().getHourseId())
                    , priceRange.getUserInfoObj().getRealName(), priceRange.getStarttime(), priceRange.getEndtime(), priceRange.getRentprice() + "", priceRange.getNowtime()});
        }
        OutputStream out = null;//创建一个输出流对象
        try {
            out = response.getOutputStream();//
            response.setHeader("Content-disposition","attachment; filename="+"Rent.xls");//filename是下载的xls的名，建议最好用英文
            response.setContentType("application/msexcel;charset=UTF-8");//设置类型
            response.setHeader("Pragma","No-cache");//设置头
            response.setHeader("Cache-Control","no-cache");//设置头
            response.setDateHeader("Expires", 0);//设置日期头
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            ex.exportExcel(rootPath,_title,headers, dataset, out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try{
                if(out!=null){
                    out.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
    }
    public void writeJsonResponse(HttpServletResponse response,boolean success,String message)
            throws IOException, JSONException {
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //将要被返回到客户端的对象
        JSONObject json=new JSONObject();
        json.accumulate("success", success);
        json.accumulate("message", message);
        out.println(json.toString());
        out.flush();
        out.close();
    }
}
