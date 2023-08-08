package org.namaranth.service;

import java.util.ArrayList;
import java.util.List;

import org.namaranth.domain.CalendarVO;
import org.namaranth.mapper.CalendarMapper;
import org.namaranth.mapper.ScheduleMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CalendarServiceImpl implements CalendarService {

	private CalendarMapper mapper;
	private ScheduleMapper sMapper;
	
//	@Override
//	public List<CalendarVO> getList(int user_no) {
//		return mapper.getList(user_no);
//		
//	}
	
	@Override
    public List<CalendarVO> getList(int user_no) {
        List<CalendarVO> calendars = mapper.getList(user_no);
        for (CalendarVO calendar : calendars) {
            int cal_no = calendar.getCal_no();
            int count = mapper.isSharedCal(cal_no);
            calendar.setSharedCalendar(count > 0);
        }
        return calendars;
    }
	
	
	@Override
	public CalendarVO get(int cal_no) {
		
		return mapper.read(cal_no);
	}
	
	@Override
	public List<CalendarVO> readUserFromCalParti(int cal_no) {

		return mapper.readUserFromCalParti(cal_no);
	}
	
	
//	@Override
//    public CalendarVO get(int cal_no, List<Integer> userCalParti_no) {
//        CalendarVO result = null;
//        
//        try {
//            result = mapper.read(cal_no);
//            // readUserFromCalParti 쿼리를 통해 userCalParti_no를 가져와서 CalendarVO 객체에 설정
//            List<Integer> calPartiUserNoList = mapper.readUserFromCalParti(cal_no);
//            // 가져온 userCalParti_no 리스트를 result 객체에 설정
//            result.setUserCalParti_no(calPartiUserNoList);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return result;
//    }
	
//	@Override
//	public void register(CalendarVO cal) {
//		mapper.insert(cal);
//	}

	@Override
	public void registerCal(CalendarVO cal, List<Integer> userCalParti_no) {
		mapper.insertSelectKey(cal);
		
		try {
			for(int uNo : userCalParti_no) {
				mapper.insertCalParti(cal.getCal_no(), uNo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
								
	}

	@Override
    public void deleteCal(int cal_no) {
		sMapper.deleteSchWithCal(cal_no);
		mapper.deleteCalParti(cal_no);
        mapper.deleteCal(cal_no);
        
    }
	
	@Override
    public void updateCal(CalendarVO cal, List<Integer> userCalParti_no) {
        
        // cal_parti 데이터 삭제 
		
		int cal_no = cal.getCal_no();
        mapper.deleteCalParti(cal_no);
		
                
        // 캘린더 정보 업데이트
        mapper.updateCal(cal);
        
        // cal_parti 데이터 추가
//        try {
//			for(int uNo : userCalParti_no) {
//				mapper.insertCalParti(cal.getCal_no(), uNo);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
        
        try {
            if (userCalParti_no != null) {
                for (Integer uNo : userCalParti_no) {
                    if (uNo != null) {
                        mapper.insertCalParti(cal.getCal_no(), uNo);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
		
	}

	
}
