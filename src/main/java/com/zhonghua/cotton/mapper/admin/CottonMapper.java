package com.zhonghua.cotton.mapper.admin;

import com.zhonghua.cotton.model.CottonQuality;
import com.zhonghua.cotton.model.CottonQuotation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface CottonMapper {

    //分页查询棉花数据
    public List<CottonQuotation> selectCottonQuotationPage(Map<String, Object> params);

    //根据批号查询棉花是否存在
    public int countQuotationByBatchNumber(String batchNumber);

    //添加棉花数据
    public void saveQuotation(CottonQuotation list);

    //更新棉花数据
    public void updateQuotation(CottonQuotation list);

    //条件查询棉花总记录数
    public int selectCottonQuotationCount(Map<String, Object> params);

    //根据条码查询棉包数据是否存在
    public int countQuatityByBarCode(String barCode);

    //添加棉包数据
    public void saveQuality(CottonQuality item);

    //更新棉包数据
    public void updateQuality(CottonQuality item);

    //删除棉花数据
    public void removeQuotation(@Param("ids") String ids);

    //查询棉花各种数值
    public HashMap avgQualityByBatchNumber(String batchNumber);

    //根据批号获取棉花
    public CottonQuotation getQuotation(String batchNumber);

    //查询颜色级比例
    public List<HashMap> selectColorLevelRatio(String batchNumber);

    //查询长度比例
    public List<HashMap> selectLengthRatio(String batchNumber);

    //查询轧工比例
    public List<HashMap> selectRollProcessRatio(String batchNumber);

    //查询马值比例
    public List<HashMap> selectMicronValueRatio(String batchNumber);

    //查询长整最值
    public HashMap selectLongIntegerMaxMin(String batchNumber);

    //查询强力最值
    public HashMap selectStrengthMaxMin(String batchNumber);

    //根据批号查询棉包
    public List<CottonQuality> listQualityByBatchNumber(String batchNumber);

    //更新棉花状态
    public void updateQuotationState(@Param("ids")String ids, @Param("state")int state);

    //根据批号查询棉包是否存在
    public int countQualityByBatchNumber(String batchNumber);

    //根据id查询棉花是否存在
    public CottonQuotation findQuotationById(Integer id);
}
