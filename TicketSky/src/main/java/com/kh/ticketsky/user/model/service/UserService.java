package com.kh.ticketsky.user.model.service;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserService {

	int insertConsumer(Member member);

	Member selectOne(String userId);

	int updateConsumer(Member m);

}
