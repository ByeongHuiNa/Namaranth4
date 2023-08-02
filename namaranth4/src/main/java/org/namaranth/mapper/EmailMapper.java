package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailMapper {

	public List<EmailVO> getList();
	public EmailVO read(int main_no);
}
