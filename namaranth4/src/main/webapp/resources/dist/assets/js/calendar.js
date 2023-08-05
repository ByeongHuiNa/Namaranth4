//전체 일정
document.addEventListener('DOMContentLoaded', function() {

	$.ajax({
		url : "/calendar/getSchedule", 
		type : 'GET',
		dataType : 'json',
		success : function(data) {
			var events = [];
			
			data.forEach(function(item) {
				//console.log(item.sch_allday);	
				//console.log(item.calendar.cal_color);
				//console.log(item);
				if (item.sch_allday == 1) {
					events.push({
						title : item.sch_name,
						start : moment(item.sch_start).format("YYYY-MM-DD"),
						allday : true,
						color : item.calendar.cal_color
						
					});
				} else {
					events.push({
						title : item.sch_name,
						start : moment(item.sch_start).format("YYYY-MM-DDTHH:mm:ss"),
						end : moment(item.sch_end).format("YYYY-MM-DDTHH:mm:ss"),
						allday : false,
						color : item.calendar.cal_color
						
					});
				}
			}); //forEach 
			

			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', 
				headerToolbar : { 
					start : 'today,listWeek',
					center : 'prev title next',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 '
							+ (parseInt(date.date.month) + 1) + '월';
				},
				dayCellContent : function(e) {
					e.dayNumberText = e.dayNumberText.replace('일', '');
				},
				//initialDate:  
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator : true, // 현재 시간 마크
				locale : 'ko', // 한국어 설정
				height : 830,
				events : events

			}); //fullcalendar
			calendar.render();

		} //success	  
	});//ajax
	
});//document

//캘린더 전체 조회 버튼
$(function(){
	function showAllCalendar(){
		$.ajax({
			url: "/calendar/showAllCalendar",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				var events = [];
				
				data.forEach(function(item) {					
					if (item.sch_allday == 1) {
					events.push({
						title : item.sch_name,
						start : moment(item.sch_start).format("YYYY-MM-DD"),
						allday : true,
						color : item.calendar.cal_color
						
					});
					} else {
						events.push({
							title : item.sch_name,
							start : moment(item.sch_start).format("YYYY-MM-DDTHH:mm:ss"),
							end : moment(item.sch_end).format("YYYY-MM-DDTHH:mm:ss"),
							allday : false,
							color : item.calendar.cal_color
						
						});
					}
				}); //forEach 

				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth', 
					headerToolbar : { 
						start : 'today,listWeek',
						center : 'prev title next',
						end : 'dayGridMonth,dayGridWeek,dayGridDay'
					},
					titleFormat : function(date) {
						return date.date.year + '년 '
								+ (parseInt(date.date.month) + 1) + '월';
					},
					dayCellContent : function(e) {
						e.dayNumberText = e.dayNumberText.replace('일', '');
					},
					//initialDate:  
					selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,
					editable : true,
					nowIndicator : true, // 현재 시간 마크
					locale : 'ko', // 한국어 설정
					height : 830,
					events : events

				}); //fullcalendar
				calendar.render();
				}
			}); //ajax
		}
	$('#calendar-list-title').on('click', function(){			
		//console.log('click');
		showAllCalendar();								
	});
});

// 캘린더별 일정 조회
$(function(){
	function pickCalendar(cNum){
		$.ajax({
			url: "/calendar/pickCalendar",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				var events = [];
				
				data.forEach(function(item) {
					console.log(item);					
					if (cNum == item.calendar.cal_no) {
						if (item.sch_allday == 1) {
							events.push({
								title : item.sch_name,
								start : moment(item.sch_start).format("YYYY-MM-DD"),
								allday : true,
								color : item.calendar.cal_color
								
							});
						} else {
							events.push({
								title : item.sch_name,
								start : moment(item.sch_start).format("YYYY-MM-DDTHH:mm:ss"),
								end : moment(item.sch_end).format("YYYY-MM-DDTHH:mm:ss"),
								allday : false,
								color : item.calendar.cal_color
								
							});
						}
					} 
				}); //forEach 

				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',  
					headerToolbar : { 
						start : 'today,listWeek',
						center : 'prev title next',
						end : 'dayGridMonth,dayGridWeek,dayGridDay'
					},
					titleFormat : function(date) {
						return date.date.year + '년 '
								+ (parseInt(date.date.month) + 1) + '월';
					},
					dayCellContent : function(e) {
						e.dayNumberText = e.dayNumberText.replace('일', '');
					},
					//initialDate:  
					selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,
					editable : true,
					nowIndicator : true, // 현재 시간 마크
					locale : 'ko', // 한국어 설정
					height : 830,
					events : events

				}); //fullcalendar
				calendar.render();
				}
			}); //ajax
		}
	$('#calendar-list-table').on('click', 'tr', function(){		
		let cNum = $(this).find('input').val();
		//console.log(cNum);	
		pickCalendar(cNum);								
	});
});

//캘린더 등록 - 색상값 선택

$(function() {
  const inputEL = $(".color-input");
  const btnEls = $(".color-box");

  btnEls.on("click", function() {
  	btnEls.removeClass("selected"); 
    $(this).addClass("selected");   
  	
    inputEL.val($(this).val());
  });
  
  btnEls.removeClass("selected");
});

//캘린더 등록 - 공유자 모달창
var addUsers = [];
$(function(){
	$('#calPartiList-body').on('click', 'tr', function () {
        $(this).toggleClass('cParti-selected'); // 선택된 행에 selected 클래스를 추가/제거
    });
	
    
    $('#calParti-btn').click(function(){
    
    	$('#calPartiList-body').empty();
    	$('#calPartiList-body2').empty();
    	
        $.ajax({
            url: '/calendar/calPartiList',
            type: 'get',
            dataType: 'json',
            success: function(data){        
                $.each(data, function(index, item){
                    console.log(item);
                    let html = '<tr>';                  
                    html += '<td><input type="hidden" class="calListModal" value="' + item.user_no + '"></td>';
                    html += '<td>'+ item.dept.dept_name +'</td>';
                    html += '<td>'+ item.user_name +'</td>';
                    html += '<td>'+ item.user_position +'</td>';
                    html += '<td>'+ item.user_email +'</td>';
                    html += '</tr>';
                                            
                    $('#calPartiList-body').append(html);
                        
                });
            }
        });   
    }); 
    
    
     $('#plusCal').click(function () {
        
        $('#calPartiList-body tr.cParti-selected').each(function () {
            let userNoVal = $(this).find('.calListModal').val();

            // 이미 addUsers에 존재하는지 확인 후 없으면 추가
            if (!addUsers.includes(userNoVal)) {
                let newRow = '<tr>';
                newRow += '<td><input type="hidden" class="calListModal" value="' + userNoVal + '"></td>';
                newRow += '<td>' + $(this).find('td').eq(1).text() + '</td>';
                newRow += '<td>' + $(this).find('td').eq(2).text() + '</td>';
                newRow += '<td>' + $(this).find('td').eq(3).text() + '</td>';
                newRow += '<td>' + $(this).find('td').eq(4).text() + '</td>';
                newRow += '</tr>';

                $('#calPartiList-body2').append(newRow);

                addUsers.push(userNoVal);
                
                $(this).removeClass('cParti-selected');
            }
        });
    });   
});
//캘린더 수정

//캘린더 삭제

//일정 등록

//일정 수정

//일정 삭제
