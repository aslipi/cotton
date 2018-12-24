package com.zhonghua.cotton.service.admin.impl;

import com.zhonghua.cotton.common.MethodUtil;
import com.zhonghua.cotton.mapper.admin.CottonMapper;
import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import com.zhonghua.cotton.service.admin.CottonService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.*;

@Service(value = "cottonService")
public class CottonServiceImpl implements CottonService {

    @Resource
    private CottonMapper cottonMapper;

    @Override
    public List<CottonQuotation> selectCottonQuotationPage(Map<String, Object> params) throws Exception{
        List<CottonQuotation> list = cottonMapper.selectCottonQuotationPage(params);
        return list;
    }

    @Transactional(readOnly = false,rollbackFor = Exception.class)
    @Override
    public String importQuotation(String fileName, MultipartFile file) throws Exception {

        boolean notNull = false;
        String msg = "";
        List<CottonQuotation> quotationList = new ArrayList<CottonQuotation>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            msg = "上传文件格式不正确";
            throw new Exception("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        InputStream is = file.getInputStream();
        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        if(sheet!=null){
            notNull = true;
        }
        CottonQuotation quotation;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null){
                continue;
            }

            quotation = new CottonQuotation();

            row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
            String batchNumber = row.getCell(0).getStringCellValue();
            HashMap map = cottonMapper.avgQualityByBatchNumber(batchNumber);
            if(map == null){continue; }
            if(batchNumber == null || batchNumber.isEmpty()){
                msg = "导入失败(第\"+(r+1)+\"行,批号未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,批号未填写)");
            }

            Double price = row.getCell(1).getNumericCellValue();
            if(price==null){
                msg = "导入失败(第\"+(r+1)+\"行,价格未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,价格未填写)");
            }

            String weightCer = row.getCell(2).getStringCellValue();
            if(weightCer==null){
                msg = "导入失败(第\"+(r+1)+\"行,证书编号(重量)未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,证书编号(重量)未填写)");
            }

            String qualityCer = row.getCell(3).getStringCellValue();
            if(qualityCer==null){
                msg = "导入失败(第\"+(r+1)+\"行,证书编号(质量)未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,证书编号(质量)未填写)");
            }

            String depository = row.getCell(4).getStringCellValue();
            if(depository==null){
                msg = "导入失败(第\"+(r+1)+\"行,存放仓库未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,存放仓库未填写)");
            }

            String supplier = row.getCell(5).getStringCellValue();
            if(supplier==null){
                msg = "导入失败(第\"+(r+1)+\"行,供应商未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,供应商未填写)");
            }

            String processUnit = row.getCell(6).getStringCellValue();
            if(processUnit==null){
                msg = "导入失败(第\"+(r+1)+\"行,供应商未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,供应商未填写)");
            }

            String contacts = row.getCell(7).getStringCellValue();
            if(contacts==null){
                msg = "导入失败(第\"+(r+1)+\"行,联系人未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,联系人未填写)");
            }

            row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
            String tel = row.getCell(8).getStringCellValue();
            if(tel==null){
                msg = "导入失败(第\"+(r+1)+\"行,联系电话未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,联系电话未填写)");
            }

            String address = row.getCell(9).getStringCellValue();
            if(address==null){
                msg = "导入失败(第\"+(r+1)+\"行,联系地址未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,联系地址未填写)");
            }

            quotation.setBatchNumber(batchNumber);
            quotation.setPrice(new BigDecimal(price).setScale(2));
            quotation.setWeightCer(weightCer);
            quotation.setQualityCer(qualityCer);
            quotation.setDepository(depository);
            quotation.setSupplier(supplier);
            quotation.setProcessUnit(processUnit);
            quotation.setContacts(contacts);
            quotation.setTel(tel);
            quotation.setAddress(address);
            quotation.setCreateTime(new Date());
            quotation.setWeight(new BigDecimal(map.get("weight").toString()));
            quotation.setGrossWeight(new BigDecimal(map.get("gw").toString()));
            quotation.setNetWeight(new BigDecimal(map.get("nw").toString()));
            quotation.setTareWeight(new BigDecimal(map.get("tw").toString()));
            quotation.setPick(map.get("pick").toString());
            quotation.setType(map.get("type").toString());
            quotation.setColorLevel(map.get("cl").toString());
            quotation.setNumber(Integer.valueOf(map.get("num").toString()));
            quotation.setBatchNumber(map.get("batch_number").toString());
            quotation.setLength(map.get("len").toString());
            quotation.setStrength(map.get("stre").toString());
            quotation.setMicronValue(map.get("mv").toString());
            quotation.setLongInteger(map.get("li").toString());
            quotation.setImpurity(map.get("imp").toString());
            quotation.setReflectivity(map.get("ref").toString());
            quotation.setResurgence(map.get("res").toString());
            quotation.setRollProcess(map.get("rp").toString());
            quotation.setYellowIndex(map.get("yi").toString());
            quotation.setState(0);
            quotationList.add(quotation);
        }
        for (CottonQuotation item : quotationList) {
            String number = item.getBatchNumber();
            int cnt = cottonMapper.selectByBatchNumber(number);
            if (cnt == 0) {
                cottonMapper.saveQuotation(item);
                System.out.println(" 插入 "+item);
            }
        }
        msg = "发布成功";
        return msg;
    }

    @Override
    public int selectCottonQuotationCount(Map<String, Object> params) {
        int count = cottonMapper.selectCottonQuotationCount(params);
        return count;
    }

    @Transactional(readOnly = false,rollbackFor = Exception.class)
    @Override
    public String importQuality(String fileName, MultipartFile file)  throws Exception {

        boolean notNull = false;
        String msg = "";
        List<CottonQuality> qualityList = new ArrayList<CottonQuality>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            msg = "上传文件格式不正确";
            throw new Exception("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        InputStream is = file.getInputStream();
        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        if(sheet!=null){
            notNull = true;
        }
        List<String> batchNumberList = new ArrayList<String>();
        CottonQuality quality;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null){
                continue;
            }

            quality = new CottonQuality();

            row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
            String barCode = row.getCell(0).getStringCellValue();
            if(barCode == null || barCode.isEmpty()){
                msg = "导入失败(第\"+(r+1)+\"行,条码未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,条码未填写)");
            }

            row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
            String batchNumber = row.getCell(1).getStringCellValue();
            if(batchNumber == null || batchNumber.isEmpty()){
                msg = "导入失败(第\"+(r+1)+\"行,批号未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,批号未填写)");
            }

            Double netWeight = row.getCell(2).getNumericCellValue();
            if(netWeight==null){
                msg = "导入失败(第\"+(r+1)+\"行,净重未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,净重未填写)");
            }

            Double grossWeight = row.getCell(3).getNumericCellValue();
            if(grossWeight==null){
                msg = "导入失败(第\"+(r+1)+\"行,毛重未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,毛重未填写)");
            }

            Double tareWeight = row.getCell(4).getNumericCellValue();
            if(tareWeight==null){
                msg = "导入失败(第\"+(r+1)+\"行,皮重未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,皮重未填写)");
            }

            Double weight = row.getCell(5).getNumericCellValue();
            if(weight==null){
                msg = "导入失败(第\"+(r+1)+\"行,公重未填写)";
                throw new Exception("导入失败(第"+(r+1)+"行,公重未填写)");
            }

            row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
            String colorLevel = row.getCell(6).getStringCellValue();

            row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
            String length = row.getCell(7).getStringCellValue();

            row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
            String strength = row.getCell(8).getStringCellValue();

            row.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
            String micronValue = row.getCell(9).getStringCellValue();

            row.getCell(10).setCellType(Cell.CELL_TYPE_STRING);
            String longInteger = row.getCell(10).getStringCellValue();

            row.getCell(11).setCellType(Cell.CELL_TYPE_STRING);
            String rollProcess = row.getCell(11).getStringCellValue();

            row.getCell(12).setCellType(Cell.CELL_TYPE_STRING);
            String resurgence = row.getCell(12).getStringCellValue();

            row.getCell(13).setCellType(Cell.CELL_TYPE_STRING);
            String reflectivity = row.getCell(13).getStringCellValue();

            row.getCell(14).setCellType(Cell.CELL_TYPE_STRING);
            String yellowIndex = row.getCell(14).getStringCellValue();

            row.getCell(15).setCellType(Cell.CELL_TYPE_STRING);
            String impurity = row.getCell(15).getStringCellValue();

            row.getCell(16).setCellType(Cell.CELL_TYPE_STRING);
            String inspectionDate = row.getCell(16).getStringCellValue();

            quality.setBarCode(barCode);
            quality.setBatchNumber(batchNumber);
            quality.setWeight(new BigDecimal(weight));
            quality.setGrossWeight(new BigDecimal(grossWeight));
            quality.setNetWeight(new BigDecimal(netWeight));
            quality.setTareWeight(new BigDecimal(tareWeight));
            quality.setColorLevel(colorLevel);
            quality.setStrength(strength);
            quality.setMicronValue(micronValue);
            quality.setLongInteger(longInteger);
            quality.setRollProcess(rollProcess);
            quality.setImpurity(impurity);
            quality.setReflectivity(reflectivity);
            quality.setResurgence(resurgence);
            quality.setYellowIndex(yellowIndex);
            quality.setLength(length);
            quality.setInspectionDate(MethodUtil.strToDate(inspectionDate));
            quality.setCreateTime(new Date());

            if (!batchNumberList.contains(batchNumber)) {
                batchNumberList.add(batchNumber);
            }

            qualityList.add(quality);
        }
        for (CottonQuality item : qualityList) {
            String code = item.getBarCode();
            int cnt = cottonMapper.selectByBarCode(code);
            if (cnt == 0) {
                cottonMapper.saveQuality(item);
            } else {
                cottonMapper.updateQuality(item);
            }
        }
        msg = "发布成功";
        return msg;
    }

    @Override
    public void removeQuotation(String ids) {
        cottonMapper.removeQuotation(ids);
    }

    @Override
    public CottonQuotation getQuotation(String batchNumber) {
        CottonQuotation quotation = cottonMapper.getQuotation(batchNumber);
        return quotation;
    }

    @Override
    public List<HashMap> selectColorLevelRatio(String batchNumber) {
        List<HashMap> list = cottonMapper.selectColorLevelRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectLengthRatio(String batchNumber) {
        List<HashMap> list = cottonMapper.selectLengthRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectRollProcessRatio(String batchNumber) {
        List<HashMap> list = cottonMapper.selectRollProcessRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectMicronValueRatio(String batchNumber) {
        List<HashMap> list = cottonMapper.selectMicronValueRatio(batchNumber);
        return list;
    }

    @Override
    public HashMap selectLongIntegerMaxMin(String batchNumber) {
        HashMap map = cottonMapper.selectLongIntegerMaxMin(batchNumber);
        return map;
    }

    @Override
    public HashMap selectStrengthMaxMin(String batchNumber) {
        HashMap map = cottonMapper.selectStrengthMaxMin(batchNumber);
        return map;
    }

    @Override
    public List<CottonQuality> listQualityByBatchNumber(String batchNumber) {
        List<CottonQuality> list = cottonMapper.listQualityByBatchNumber(batchNumber);
        return list;
    }

    @Override
    public void updateQuotationState(String ids, int state) {
        cottonMapper.updateQuotationState(ids,state);
    }
}