package com.it.herb.zipcode.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ZipcodeServiceImpl implements ZipcodeService{
	private final ZipcodeDAO zipcodeDao;
		
	public List<ZipcodeVO> selectZipcode(String dong){
		return zipcodeDao.selectZipcode(dong);
	}
		
}
