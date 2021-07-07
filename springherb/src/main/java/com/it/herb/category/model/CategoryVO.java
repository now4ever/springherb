package com.it.herb.category.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryVO {
	private int categoryNo;
    private String categoryName;
    private int categoryOrder;
}
