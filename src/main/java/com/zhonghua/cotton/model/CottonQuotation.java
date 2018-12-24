package com.zhonghua.cotton.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class CottonQuotation {

    private Integer id;

    private String batchNumber;

    private String pick;

    private String type;

    private BigDecimal price;

    private Integer number;

    private BigDecimal weight;

    private BigDecimal grossWeight;

    private BigDecimal netWeight;

    private BigDecimal tareWeight;

    private String weightCer;

    private String qualityCer;

    private String colorLevel;

    private String length;

    private String strength;

    private String micronValue;

    private String longInteger;

    private String rollProcess;

    private String resurgence;

    private String reflectivity;

    private String yellowIndex;

    private String impurity;

    private String depository;

    private String processUnit;

    private String supplier;

    private String contacts;

    private String tel;

    private String address;

    private Date inspectionDate;

    private Date createTime;

    private Integer state;
}
