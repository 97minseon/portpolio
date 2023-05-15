package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.AttachFileDTO;

public interface FileMapper {
	
	public void fileInsert(AttachFileDTO dto);				// 등록
	public List<AttachFileDTO> fileFindById(long item_id);	// 조회
	public void delete(String uuid);						// 삭제(하나만)
	public void deleteAll(long item_id);					// 삭제(전체)
	
}
