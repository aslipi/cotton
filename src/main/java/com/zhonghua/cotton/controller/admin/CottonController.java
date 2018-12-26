package com.zhonghua.cotton.controller.admin;

import com.zhonghua.cotton.common.MethodUtil;
import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import com.zhonghua.cotton.service.admin.CottonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/admin/cotton")
public class CottonController {

    @Autowired
    private CottonService cottonService;

    @RequestMapping("/list")
    public String list(@RequestParam Map<String, Object> params,HttpServletRequest req, HttpServletResponse res) throws Exception {
        String currentPage = req.getParameter("currentPage");
        if(currentPage == null||currentPage.equals("")|| !MethodUtil.isInteger(currentPage)){
            params.put("current", 0);
            params.put("currentPage",0);
        }else{
            params.put("current", Integer.valueOf(currentPage)*20);
            params.put("currentPage", currentPage);
        }
        params.put("pageSize",20);

        List<CottonQuotation> list = cottonService.selectCottonQuotationPage(params);
        int count = cottonService.selectCottonQuotationCount(params);
        int pageCount = count/20 + 1;
        params.put("count",count);
        params.put("pageCount",pageCount);
        req.setAttribute("list",list);
        req.setAttribute("params",params);
        return "/admin/cotton/list";
    }

    @RequestMapping("/desc")
    public String desc(HttpServletRequest req, HttpServletResponse res){
        String batchNumber = req.getParameter("batchNumber");
        CottonQuotation quotation = cottonService.getQuotation(batchNumber);
        List<HashMap> cls = cottonService.selectColorLevelRatio(batchNumber);
        List<HashMap> lengths = cottonService.selectLengthRatio(batchNumber);
        List<HashMap> gqs = cottonService.selectRollProcessRatio(batchNumber);
        List<HashMap> mvs = cottonService.selectMicronValueRatio(batchNumber);
        HashMap limaxmin = cottonService.selectLongIntegerMaxMin(batchNumber);
        HashMap stmaxmin = cottonService.selectStrengthMaxMin(batchNumber);
        List<CottonQuality> list = cottonService.listQualityByBatchNumber(batchNumber);

        req.setAttribute("cls",cls);
        req.setAttribute("lengths",lengths);
        req.setAttribute("gqs",gqs);
        req.setAttribute("mvs",mvs);
        req.setAttribute("limaxmin",limaxmin);
        req.setAttribute("stmaxmin",stmaxmin);
        req.setAttribute("quotation",quotation);
        req.setAttribute("list",list);
        return "/admin/cotton/desc";
    }

    @RequestMapping("/goImportQuo")
    public String goImportQuo(HttpServletRequest req, HttpServletResponse res){
        return "/admin/cotton/importQuo";
    }

    @RequestMapping("/goImportQua")
    public String goImportQua(HttpServletRequest req, HttpServletResponse res){
        return "/admin/cotton/importQua";
    }

    @PostMapping("/importQuo")
    public String importQuo(@RequestParam("uploadExcel") MultipartFile uploadExcel, Model model) {
        String msg = "";
        String fileName = uploadExcel.getOriginalFilename();
        try {
            msg = cottonService.importQuotation(fileName, uploadExcel);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("msg",msg);
        return  "/admin/common/msg";
    }

    @PostMapping("/importQua")
    public String importQua(@RequestParam("uploadExcel") MultipartFile uploadExcel, Model model) {
        String msg = "";
        String fileName = uploadExcel.getOriginalFilename();
        try {
            msg = cottonService.importQuality(fileName, uploadExcel);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("msg",msg);
        return  "/admin/common/msg";
    }

    @RequestMapping("/addXzph")
    public String addXzph(HttpServletRequest req) {
        return  "/admin/cotton/add_xzph";
    }

    @RequestMapping("/xzph")
    @ResponseBody
    public String xzph(String batchNumber, HttpServletRequest req, HttpServletResponse res){
        int i = cottonService.countQualityByBatchNumber(batchNumber);
        int j = cottonService.countQuotationByBatchNumber(batchNumber);
        if(j>0){
            return "1";
        }else if(i>0){
            return "2";
        }else{
            return "0";
        }

    }

    @RequestMapping("/goAdd")
    public String addZlxq(String batchNumber , HttpServletRequest req) {
        HashMap map = cottonService.avgQualityByBatchNumber(batchNumber);
        req.setAttribute("item",map);
        req.setAttribute("batchNumber",batchNumber);
        req.setAttribute("msg","save");
        return  "/admin/cotton/edit";
    }

    @RequestMapping("/goUpdate")
    public String goUpdate(Integer id , HttpServletRequest req) {
        CottonQuotation quotation = cottonService.findQuotationById(id);
        HashMap map = cottonService.avgQualityByBatchNumber(quotation.getBatchNumber());

        req.setAttribute("item",map);
        req.setAttribute("quotation",quotation);
        req.setAttribute("batchNumber",quotation.getBatchNumber());
        req.setAttribute("msg","update");
        return  "/admin/cotton/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(CottonQuotation quotation, HttpServletRequest req, HttpServletResponse res){
        String s = cottonService.saveQuotation(quotation);
        return s;
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(CottonQuotation quotation, HttpServletRequest req, HttpServletResponse res){
        String s = cottonService.updateQuotation(quotation);
        return s;
    }

    @RequestMapping("/release")
    @ResponseBody
    public String release(String ids, HttpServletRequest req, HttpServletResponse res){
        cottonService.updateQuotationState(ids,1);
        return "1";
    }

    @RequestMapping("/unrelease")
    @ResponseBody
    public String unrelease(String ids, HttpServletRequest req, HttpServletResponse res){
        cottonService.updateQuotationState(ids,0);
        return "1";
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(String ids, HttpServletRequest req, HttpServletResponse res){
        cottonService.removeQuotation(ids);
        return "1";
    }

}
