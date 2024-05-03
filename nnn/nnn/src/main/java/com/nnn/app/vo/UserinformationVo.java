package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserinformationVo {
/*

create table user_information (
	company_code varchar(255),
	userid varchar(255),
	username varchar(255),
	subname varchar(255),
	usercode varchar(255),
	useremail varchar(255),
	userrole varchar(255)
);

 */

	private String company_code;
	private String userid;
	private String username;
	private String subname;
	private String usercode;
	private String useremail;
	private String userrole;
	
}
