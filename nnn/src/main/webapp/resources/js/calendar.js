/**
 * 
 */

let date = new Date();
let currentMonthNumber;
const clickedDateInfo = document.getElementById('result');

const registerDateEventListeners = () => {
	console.log("registerDateEventListeners 실행됨");
	  const btnOpenPopups = document.querySelectorAll('.date');
	  btnOpenPopups.forEach(btnOpenPopup => {
	    btnOpenPopup.addEventListener('click', (event) => {
	    	console.log("클릭됨");
	      const body = document.querySelector('body');
	      const modal = document.querySelector('.modal');

	      // 클릭된 요소의 innerText를 통해 일자 정보 가져오기
	      const clickedDate = event.target.innerText;
	      console.log('클릭된 일자:', clickedDate);
	      
	      // 모달창에 일자 정보 표시
	      clickedDateInfo.textContent = currentMonthNumber + "월 " + clickedDate + "일";
	      
	      // 모달을 토글하거나 다른 작업 수행
	      modal.classList.toggle('show');
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	  });
	};
	

const renderCalender = () => {
	console.log("캘린더 실행");
	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();
  document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

  // Update the value of currentMonthNumber
  currentMonthNumber = viewMonth + 1;
  
  const prevLast = new Date(viewYear, viewMonth, 0);
  const thisLast = new Date(viewYear, viewMonth + 1, 0);

  const PLDate = prevLast.getDate();
  const PLDay = prevLast.getDay();

  const TLDate = thisLast.getDate();
  const TLDay = thisLast.getDay();

  const prevDates = [];
  const thisDates = [...Array(TLDate + 1).keys()].slice(1);
  const nextDates = [];

  if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift(PLDate - i);
    }
  }

  for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push(i);
  }

  const dates = prevDates.concat(thisDates, nextDates);
  const firstDateIndex = dates.indexOf(1);
  const lastDateIndex = dates.lastIndexOf(TLDate);

  dates.forEach((date, i) => {
    const condition = i >= firstDateIndex && i < lastDateIndex + 1
                      ? 'this'
                      : 'other';
    dates[i] = `<div class="date" style="cursor:pointer;"><span class=${condition}>${date}</span></div>`;
  });

  
//Update the event listeners whenever the calendar is re-rendered
  registerDateEventListeners();
  
  document.querySelector('.dates').innerHTML = dates.join('');
  //
 
  const today = new Date();
  if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
    for (let date of document.querySelectorAll('.this')) {
      if (+date.innerText === today.getDate()) {
        date.classList.add('today');
        break;
      }
    }
  }
  

  
};
renderCalender();


const prevMonth = () => {
  date.setDate(1);
  date.setMonth(date.getMonth() - 1);
  renderCalender();
};

const nextMonth = () => {
  date.setDate(1);
  date.setMonth(date.getMonth() + 1);
  renderCalender();
};

const goToday = () => {
  date = new Date();
  renderCalender();
};

function closePopup(){
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

