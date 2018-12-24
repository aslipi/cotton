package com.zhonghua.cotton.service.web.impl;

import com.zhonghua.cotton.mapper.web.WebCottonMapper;
import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import com.zhonghua.cotton.service.web.WebCottonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(value = "webCottonService")
public class WebCottonServerImpl implements WebCottonService {

    @Resource
    private WebCottonMapper webCottonMapper;

    @Override
    public List<CottonQuotation> listQuotationPage(Map<String, Object> params) {
        List<CottonQuotation> list = webCottonMapper.listQuotationPage(params);
        return list;
    }

    @Override
    public CottonQuotation getQuotation(String batchNumber) {
        CottonQuotation quotation = webCottonMapper.getQuotation(batchNumber);
        return quotation;
    }

    @Override
    public List<HashMap> selectColorLevelRatio(String batchNumber) {
        List<HashMap> list = webCottonMapper.selectColorLevelRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectLengthRatio(String batchNumber) {
        List<HashMap> list = webCottonMapper.selectLengthRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectRollProcessRatio(String batchNumber) {
        List<HashMap> list = webCottonMapper.selectRollProcessRatio(batchNumber);
        return list;
    }

    @Override
    public List<HashMap> selectMicronValueRatio(String batchNumber) {
        List<HashMap> list = webCottonMapper.selectMicronValueRatio(batchNumber);
        return list;
    }

    @Override
    public HashMap selectLongIntegerMaxMin(String batchNumber) {
        HashMap map = webCottonMapper.selectLongIntegerMaxMin(batchNumber);
        return map;
    }

    @Override
    public HashMap selectStrengthMaxMin(String batchNumber) {
        HashMap map = webCottonMapper.selectStrengthMaxMin(batchNumber);
        return map;
    }

    @Override
    public List<CottonQuality> listQualityByBatchNumber(String batchNumber) {
        List<CottonQuality> list = webCottonMapper.listQualityByBatchNumber(batchNumber);
        return list;
    }
}
