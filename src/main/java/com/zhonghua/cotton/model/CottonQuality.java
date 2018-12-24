package com.zhonghua.cotton.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class CottonQuality {

    private Integer id;

    private String barCode;

    private String batchNumber;

    private BigDecimal weight;

    private BigDecimal grossWeight;

    private BigDecimal netWeight;

    private BigDecimal tareWeight;

    private String colorLevel;

    private String strength;

    private String length;

    private String micronValue;

    private String longInteger;

    private String rollProcess;

    private String resurgence;

    private String reflectivity;

    private String yellowIndex;

    private String impurity;

    private String depository;

    private String processUnit;

    private Date inspectionDate;

    private Date createTime;


}
