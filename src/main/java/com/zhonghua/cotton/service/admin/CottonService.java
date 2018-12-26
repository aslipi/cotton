package com.zhonghua.cotton.service.admin;

import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CottonService {

    public List<CottonQuotation> selectCottonQuotationPage(Map<String, Object> params) throws Exception;

    public String importQuotation(String fileName, MultipartFile file) throws Exception;

    public int selectCottonQuotationCount(Map<String, Object> params);

    public String importQuality(String fileName, MultipartFile uploadExcel) throws Exception ;

    public void removeQuotation(String ids);

    public CottonQuotation getQuotation(String batchNumber);

    public List<HashMap> selectColorLevelRatio(String batchNumber);

    public List<HashMap> selectLengthRatio(String batchNumber);

    public List<HashMap> selectRollProcessRatio(String batchNumber);

    public List<HashMap> selectMicronValueRatio(String batchNumber);

    public HashMap selectLongIntegerMaxMin(String batchNumber);

    public HashMap selectStrengthMaxMin(String batchNumber);

    public List<CottonQuality> listQualityByBatchNumber(String batchNumber);

    public void updateQuotationState(String ids,int state);

    public int countQualityByBatchNumber(String batchNumber);

    public int countQuotationByBatchNumber(String batchNumber);

    public HashMap avgQualityByBatchNumber(String batchNumber);

    public String saveQuotation(CottonQuotation quotation);

    public String updateQuotation(CottonQuotation quotation);

    public CottonQuotation findQuotationById(Integer id);
}
