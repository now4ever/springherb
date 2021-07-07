package com.it.herb.manager.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManagerVO {
	private int no;
    private String userid;
    private String name;
    private String pwd;
    private String authCode;
    private Timestamp regdate;
    
}
