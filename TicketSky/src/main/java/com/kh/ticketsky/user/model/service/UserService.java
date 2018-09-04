package com.kh.ticketsky.user.model.service;

import java.util.List;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserService {

	int insertConsumer(Member member);

	Member selectOne(String userId);

	int updateConsumer(Member m);

	int deleteConsumer(String userId);

	int insertSeller(Member member);

	List<Member> selectConsumerList(int cPage, int numPerPage);

	int selectConsumerTotalCount();

}
