package com.kh.ticketsky.user.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserService {

	int insertConsumer(Member member);

	Member selectOne(String userId);

	int updateConsumer(Member m);

	int deleteConsumer(String userId);

	int insertSeller(Member member);

	List<Member> selectConsumerList(int cPage, int numPerPage, Map<String, String> map);

	int selectConsumerTotalCount( Map<String, String> map);

	List<Map<String, String>> selectConsumerRating();

	int updateConsumerRating(Map<String, String> map);

	List<Member> selectSellerList(int cPage, int numPerPage, Map<String, String> map);

	int selectSellerTotalCount(Map<String, String> map);

}
