package com.zhonghua.cotton.mapper.web;

import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface WebCottonMapper {

    public List<CottonQuotation> listQuotationPage(Map<String, Object> params);

    public CottonQuotation getQuotation(String batchNumber);

    public List<HashMap> selectColorLevelRatio(String batchNumber);

    public List<HashMap> selectLengthRatio(String batchNumber);

    public List<HashMap> selectRollProcessRatio(String batchNumber);

    public List<HashMap> selectMicronValueRatio(String batchNumber);

    public HashMap selectLongIntegerMaxMin(String batchNumber);

    public HashMap selectStrengthMaxMin(String batchNumber);

    public List<CottonQuality> listQualityByBatchNumber(String batchNumber);
}
