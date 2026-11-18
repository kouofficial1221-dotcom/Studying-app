package com.kokifujii.studyapp.user.repository;

import org.apache.ibatis.annotations.Mapper;

import com.kokifujii.studyapp.user.domain.model.MUser;

@Mapper
public interface UserMapper {
	/** ユーザー登録 */
	public int insert(MUser user);
}
