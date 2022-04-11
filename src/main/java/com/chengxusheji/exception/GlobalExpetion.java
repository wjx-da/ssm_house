package com.chengxusheji.exception;

/**
 * @Author 万家欣
 * @Date 2022/4/11 10:16
 * @Version 1.0
 */
import com.chengxusheji.utils.UserException;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ibm on 2019/3/3.
 */
@Component
public class GlobalExpetion implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        // 统一处理异常
        System.out.println(e.getMessage());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("error",e.getMessage());

       if(e instanceof MaxUploadSizeExceededException){

           modelAndView.setViewName("upload_error");
       }else if(e instanceof UserException){
               modelAndView.setViewName("user_error");
       }

        return modelAndView;
    }
}

