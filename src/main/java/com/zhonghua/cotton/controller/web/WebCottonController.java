package com.zhonghua.cotton.controller.web;

import com.alibaba.fastjson.JSON;
import com.zhonghua.cotton.common.MethodUtil;
import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import com.zhonghua.cotton.service.web.WebCottonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/web/cotton")
public class WebCottonController {

    @Autowired
    private WebCottonService webCottonService;

    @RequestMapping("/list")
    public String index(HttpServletRequest req, HttpServletResponse res){
        return "/web/cotton/list";
    }

    @RequestMapping("/loadList")
    @ResponseBody
    public String loadList(@RequestBody Map<String, Object> params, HttpServletRequest req, HttpServletResponse res){
        String currentPage = params.get("currentPage") == null?"0":params.get("currentPage").toString();
        if(currentPage == null||currentPage.equals("")|| !MethodUtil.isInteger(currentPage)){
            params.put("current", 0);
            params.put("currentPage",0);
        }else{
            params.put("current", Integer.valueOf(currentPage)*20);
            params.put("currentPage", currentPage);
        }
        params.put("pageSize",20);
        List<CottonQuotation> list = webCottonService.listQuotationPage(params);
        return JSON.toJSONString(list);
    }

    @RequestMapping("/desc")
    public String desc(HttpServletRequest req, HttpServletResponse res){
        String batchNumber = req.getParameter("num");
        CottonQuotation quotation = webCottonService.getQuotation(batchNumber);
        List<HashMap> cls = webCottonService.selectColorLevelRatio(batchNumber);
        List<HashMap> lengths = webCottonService.selectLengthRatio(batchNumber);
        List<HashMap> gqs = webCottonService.selectRollProcessRatio(batchNumber);
        List<HashMap> mvs = webCottonService.selectMicronValueRatio(batchNumber);
        HashMap limaxmin = webCottonService.selectLongIntegerMaxMin(batchNumber);
        HashMap stmaxmin = webCottonService.selectStrengthMaxMin(batchNumber);

        req.setAttribute("cls",cls);
        req.setAttribute("lengths",lengths);
        req.setAttribute("gqs",gqs);
        req.setAttribute("mvs",mvs);
        req.setAttribute("limaxmin",limaxmin);
        req.setAttribute("stmaxmin",stmaxmin);
        req.setAttribute("quotation",quotation);
        return "/web/cotton/desc";
    }

    @RequestMapping("/table")
    public String table(HttpServletRequest req, HttpServletResponse res){
        String batchNumber = req.getParameter("num");
        List<CottonQuality> list = webCottonService.listQualityByBatchNumber(batchNumber);

        req.setAttribute("batchNumber",batchNumber);
        req.setAttribute("list",list);
        return "/web/cotton/table";
    }


}
