package com.kokifujii.studyapp.user.domain.model;

import lombok.Data;

@Data
public class MUser {
	private Long userId;
	private String userName;
	private String email;
	private String password;
}
