package com.it.herb.common;

public interface ConstUtil {
	//페이징 처리 관련 상수
	int BLOCK_SIZE=10;  //블럭 크기
	int RECORD_COUNT=5; //한 페이지에 보여줄 레코드 개수
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="test";
	//String FILE_UPLOAD_TYPE="deploy";
	
	//자료실 - 파일 저장 경로
	String FILE_UPLOAD_PATH="pds_upload";
	String FILE_UPLOAD_PATH_TEST="D:\\lecture\\workspace_list\\spboot_ws\\springherb\\src\\main\\webapp\\pds_upload";
	
	//관리자 페이지-상품 등록시 상품 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="pd_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="D:\\lecture\\workspace_list\\spboot_ws\\springherb\\src\\main\\webapp\\pd_images";
	
}
