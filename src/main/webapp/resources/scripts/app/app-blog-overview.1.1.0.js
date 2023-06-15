/*
 |--------------------------------------------------------------------------
 | Shards Dashboards: Blog Overview Template
 |--------------------------------------------------------------------------
 */

'use strict';

(function ($) {
  $(document).ready(function () {

    //
    // Blog Overview Users
    //
	
	let ranColor = ['rgba(45,124,233,0.1)','rgba(255,65,105,0.1)','rgba(118,67,151,0.1)','rgba(238,60,70,0.1)'
					,'rgba(14,112,98,0.1)','rgba(88,224,255,0.1)','rgba(253,208,43,0.1)','rgba(163,44,158,0.1)'
					,'rgba(255,90,67,0.1)','rgba(197,225,165,0.1)']
	let ranColor2 = ['rgba(45,124,233,1)','rgba(255,65,105,1)','rgba(118,67,151,1)','rgba(238,60,70,1)'
					,'rgba(14,112,98,1)','rgba(88,224,255,1)','rgba(253,208,43,1)','rgba(163,44,158,1)'
					,'rgba(255,90,67,1)','rgba(197,225,165,1)']
	
	// data-list 에서 키 추출 => 각각의 키 를 가지고 data-list 추출
	const keyData = document.getElementById('keyData').getAttribute('data-list').slice(1, -1).split(", ");
	console.log("keyData:",keyData)
	const dataLists= keyData.map(key => document.getElementById(key).getAttribute('data-list'));
	
	// 추출된 데이터를 JSON 형태로 변환
	var updatedArr = dataLists.map(function(item) {
	  try {
	    return JSON.parse(item);
	  } catch (error) {
	    return item.slice(1,-1).split(", ");
	  }
	});
	
	// 추출한 데이터를 객체화 (전체데이터)
	var list_obj={}
	$.each(updatedArr,function(idx,data){
		list_obj[keyData[idx]]=data;
	});
	//console.log("전체: ", list_obj)

	
	var list_obj_date = {}; // 날짜 배열만 저장
	var list_obj_num = {};  // 모든 배열 저장
	
	// 날짜데이터 중 연-월-일 에 해당하는 데이터만 추출하여 키값으로 활용 (월별데이터)
	$.each(list_obj.DATE, function(idx, data){
	  var key = data.trim().substring(0, 10);
	  list_obj_date[key] = [];
	  list_obj_date[key].push(data.trim());
	});
	
	
	// 전체데이터를 월별로 분산 (월별데이터)
	$.each(list_obj, function(key, value){
	  //if (key === "DATE") return;	// 여기 실행시 DATE는 포함하지 않게됨
	  list_obj_num[key] = {};
	  $.each(list_obj[key], function(idx, data){
	    var obj_key = list_obj.DATE[idx].trim().substring(0, 10);
	    if (!(obj_key in list_obj_num[key])){
	      list_obj_num[key][obj_key] = [];
	    }
	    list_obj_num[key][obj_key].push(data);
	  });
	});
	//console.log("월별:" ,list_obj_num)
	
	// 월별데이터 각각의 날짜 중 시간 구하기
	let timeData = {};
	$.each(list_obj_num.DATE, function(idx,data){
		if (!(idx in timeData)){
			timeData[idx] = [];
		}
		timeData[idx] = data.map(i=>i.split(" ")[1])
	})
	//console.log("시간: ", timeData)
	
	// 월별데이터 각각의 길이 구하기 (월별데이터와 구조가 동일)
	let lenData = {};
	$.each(list_obj_num, function(key, value){
		lenData[key] = {}; 
		$.each(list_obj_num[key], function(idx, data){
			lenData[key][idx] = data.length;
		})
	})
	//console.log("길이: ", lenData)
	
	
	// 날짜 목록 생성 (차트에서 키값으로 사용)
	let dateData = Object.keys(list_obj_date)
	
	
	// 차트 설정
	var bouCtx = document.getElementsByClassName('blog-overview-chart')[0]; // 차트띄울 Canvas 위치
	let bouData = { labels: [], datasets: [] };
	for (let i = 0; i < keyData.length; i++) {
	  bouData.labels = Array.from(new Array(lenData[keyData[i]][dateData[0]]), (_, idx) => timeData[dateData[0]][idx]);
	  bouData.datasets.push({
	    label: keyData[i%10],
	    fill: 'start',
	    backgroundColor: ranColor[i%10],
	    borderColor: ranColor2[i%10],
	    pointBackgroundColor: '#ffffff',
	    pointHoverBackgroundColor: ranColor2[i%10],
	    borderWidth: 1.5,
	    pointRadius: 0,
	    pointHoverRadius: 3,
	    data: list_obj_num[keyData[i]][dateData[0]]
	  });
	}
	
    var bouOptions = {
      responsive: true,
      legend: {
        position: 'top'
      },
      elements: {
        line: {
          tension: 0.3
        },
        point: {
          radius: 0
        }
      },
      scales: {
        xAxes: [{
          scaleLabel: {
        	  display: true,
        	  labelString: '시간'
          },
          gridLines: false, // grid 가 필요할때 지우자
          ticks: {
            callback: function (tick, index) {
              return index % 2 !== 0 ? '' : tick;
            }
          }
        }],
        yAxes: [{
       	  scaleLabel: {
         	  display: true,
         	  labelString: '값'
          },
          gridLines: false, // grid 가 필요할때 지우자
          ticks: {
            suggestedMax: 45,
            callback: function (tick, index, ticks) {
              if (tick === 0) {
                return tick;
              }
              return tick > 999 ? (tick/ 1000).toFixed(1) + 'K' : tick;
            }
          }
        }]
      },
      hover: {
        mode: 'nearest',
        intersect: false
      },
      tooltips: {
        custom: false,
        mode: 'nearest',
        intersect: false
      }
    };
	
    window.BlogOverviewChart = new Chart(bouCtx, {
      type: 'LineWithLine',
      data: bouData,
      options: bouOptions
    });

    var aocMeta = BlogOverviewChart.getDatasetMeta(0);
    aocMeta.data[0]._model.radius = 0;
    aocMeta.data[bouData.datasets[0].data.length - 1]._model.radius = 0;

    window.BlogOverviewChart.render();
	    
	
	
	
	let date = document.getElementById('blog-overview-date-range-1')
	//date.setAttribute("placeholder", dateData[0])
	
	$(date).change(function(){
		const dateObj = new Date(date.value);
		const newDate = moment(dateObj).format('YYYY-MM-DD');
		//console.log("변경날짜: ", newDate)
		
		//차트 재설정
		bouData = { labels: [], datasets: [] };
		for (let i = 0; i < keyData.length; i++) {
		  bouData.labels = Array.from(new Array(lenData[keyData[i]][newDate]), (_, idx) => timeData[newDate][idx]);
		  bouData.datasets.push({
		    label: keyData[i%10],
		    fill: 'start',
		    backgroundColor: ranColor[i%10],
		    borderColor: ranColor2[i%10],
		    pointBackgroundColor: '#ffffff',
		    pointHoverBackgroundColor: ranColor2[i%10],
		    borderWidth: 1.5,
		    pointRadius: 0,
		    pointHoverRadius: 3,
		    data: list_obj_num[keyData[i]][newDate]
		  });
		};
		
	    var bouOptions = {
	      responsive: true,
	      legend: {
	        position: 'top'
	      },
	      elements: {
	        line: {
	          tension: 0.3
	        },
	        point: {
	          radius: 0
	        }
	      },
	      scales: {
	        xAxes: [{
	          scaleLabel: {
	        	  display: true,
	        	  labelString: '시간'
	          },
	          gridLines: false, // grid 가 필요할때 지우자
	          ticks: {
	            callback: function (tick, index) {
	              return index % 2 !== 0 ? '' : tick;
	            }
	          }
	        }],
	        yAxes: [{
	       	  scaleLabel: {
	         	  display: true,
	         	  labelString: '값'
	          },
	          gridLines: false, // grid 가 필요할때 지우자
	          ticks: {
	            suggestedMax: 45,
	            callback: function (tick, index, ticks) {
	              if (tick === 0) {
	                return tick;
	              }
	              return tick > 999 ? (tick/ 1000).toFixed(1) + 'K' : tick;
	            }
	          }
	        }]
	      },
	      hover: {
	        mode: 'nearest',
	        intersect: false
	      },
	      tooltips: {
	        custom: false,
	        mode: 'nearest',
	        intersect: false
	      }
	    };
		
	    window.BlogOverviewChart = new Chart(bouCtx, {
	      type: 'LineWithLine',
	      data: bouData,
	      options: bouOptions
	    });
	
	    var aocMeta = BlogOverviewChart.getDatasetMeta(0);
	    aocMeta.data[0]._model.radius = 0;
	    aocMeta.data[bouData.datasets[0].data.length - 1]._model.radius = 0;
	
	    window.BlogOverviewChart.render();
	});
  });
})(jQuery);

	 
/*
	'rgba(118,67,151,0.1)'  보라색 
	'rgba(238,60,70,0.1)'   빨간색 
	'rgba(14,112,98,0.1)'   청록색 
	'rgba(88,224,255,0.1)'  하늘색 
	'rgba(253,208,43,0.1)'  노란색 
	'rgba(163,44,158,0.1)'  보라색 
	'rgba(255,90,67,0.1)'   주황색
	'rgba(197,225,165,0.1)' 연두색 
	'rgba(45,124,233,0.1)'  파란색 
	'rgba(255,65,105,0.1)'  분홍색 
*/