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
	
	let pointer = document.getElementById('pointer').value
	console.log("포인터: ",pointer)
	const keyData = document.getElementById('keyData').getAttribute('data-list').slice(1, -1).split(", ");
	//console.log(keyData)
	const dataLists= keyData.map(key => document.getElementById(key).getAttribute('data-list'));
	const modifiedLists = dataLists.map(i => i.slice(1, -1).split(", "))
	//console.log(modifiedLists)
	//console.log(modifiedLists[0].map(i => i.split("-")[2].split(" ")[0]))
	const data = modifiedLists[0].map( (date, i) => ({ date: date, index: i }) );
	
	const result = modifiedLists.map((list) => {
	  const data = modifiedLists[0].map((date, i) => ({ date: date, index: i }));
	  
	  return data.reduce((acc, cur) => {
	    const curDate = cur.date.split("-")[2].split(" ")[0];
	    
	    if (acc.length === 0) {
	      acc.push({ date: curDate, data: [list[cur.index]] });
	    } else {
	      const foundIndex = acc.findIndex(group => group.date === curDate);
	      
	      if (foundIndex === -1) {
	        acc.push({ date: curDate, data: [list[cur.index]] });
	      } else {
	        acc[foundIndex].data.push(list[cur.index]);
	      }
	    }
	    
	    return acc;
	  }, []).map(group => group.data);
	});
	console.log(result)
	

    //console.log("확인값: ", Number(dataList[0]['DATE'].substr(8, 2)))
    var data1_list= [123,150,200,300,500,400,800,210,700,800];
	var data2_list= [50,60,70,80,90,100,115,80,130,160,300,77];
	
	var buttons = document.getElementsByClassName('myButton');
	Array.from(buttons).forEach(function(button, idx){
	  button.addEventListener('click', function() {
	    $(this).toggleClass('btn-light');
	    bouData.datasets[idx].hidden = !bouData.datasets[idx].hidden;
	    BlogOverviewChart.update();
	  });
	});
	
    var bouCtx = document.getElementsByClassName('blog-overview-chart')[0];
    
    var bouData = {
      labels: Array.from(new Array(30), function (_, i) {
        return i === 0 ? 1 : i; 
      }),
	  datasets: [{
	      label: "12",
	      fill: 'start',
	      data: data1_list,
	      backgroundColor: 'rgba(0,123,255,0.1)',
	      borderColor: 'rgba(0,123,255,1)',
	      pointBackgroundColor: '#ffffff',
	      pointHoverBackgroundColor: 'rgb(0,123,255)',
	      borderWidth: 1.5,
	      pointRadius: 0,
	      pointHoverRadius: 3
	    }, {
	      label: "123",
	      fill: 'start',
	      data: data2_list,
	      backgroundColor: 'rgba(255,65,105,0.1)',
	      borderColor: 'rgba(255,65,105,1)',
	      pointBackgroundColor: '#ffffff',
	      pointHoverBackgroundColor: 'rgba(255,65,105,1)',
	      borderDash: [3, 3],	
	      borderWidth: 1,
	      pointRadius: 0,
	      pointHoverRadius: 2,
	      pointBorderColor: 'rgba(255,65,105,1)'
	    }]
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
        	  labelString: '날짜'
          },
          gridLines: false, // grid 가 필요할때 지우자
          ticks: {
            callback: function (tick, index) {
              return tick;  // index % 7 !== 0 ? '' : tick;
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