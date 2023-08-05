package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.CalendarVO;
import org.namaranth.mapper.CalendarMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CalendarServiceImpl implements CalendarService {

	private CalendarMapper mapper;
	
	@Override
	public List<CalendarVO> getList() {
		return mapper.getList();
	}
	
//	@Override
//	public void register(CalendarVO cal) {
//		mapper.insert(cal);
//	}

	@Override
	public void registerCal(CalendarVO cal, List<Integer> userCalParti_no) {
		mapper.insertSelectKey(cal);
				
		if(userCalParti_no == null) {
			log.info("¾ø¾î¿ë");
		}else {
			for(int uNo : userCalParti_no) {
			mapper.insertCalParti(cal.getCal_no(), uNo);
			}
		}
				
		
	}

	
}
