let date = new Date();
let currentMonthNumber;
const clickedDateInfo = document.getElementById('result');


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

const onDateClick = (event) => {
	  const clickedDate = event.target.innerText;
	  const currentMonthNumber = date.getMonth() + 1;
	  clickedDateInfo.textContent = currentMonthNumber + '월 ' + clickedDate + '일';

	  const modal = document.querySelector('.modal');
	  modal.classList.toggle('show');

	  const body = document.querySelector('body');
	  body.style.overflow = modal.classList.contains('show') ? 'hidden' : 'auto';
	};



const renderCalender = () => {
  console.log('캘린더 실행');
  const viewYear = date.getFullYear();
  const viewMonth = date.getMonth();
  document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

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

  console.log('달력 렌더링...');
  document.querySelector('.dates').innerHTML = dateElements.join('');

  // Update the event listeners whenever the calendar is re-rendered
  registerDateEventListener();
  const today = new Date();
  if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
    for (let date of document.querySelectorAll('.this')) {
      if (+date.innerText === today.getDate()) {
        date.classList.add('today');
        break;
      }
    }
  }
  console.log("이벤트 수신기 등록 중...");
};

const registerDateEventListener = () => {
	  const datesContainer = document.querySelector('.dates');
	  datesContainer.removeEventListener('click', onDateClick);
	  datesContainer.addEventListener('click', onDateClick);
	};

	document.addEventListener('DOMContentLoaded', () => {
	  const todayBtn = document.querySelector('.go-today');
	  if (todayBtn) {
	    todayBtn.addEventListener('click', goToday);
	  }

	  const prevBtn = document.querySelector('.go-prev');
	  if (prevBtn) {
	    prevBtn.addEventListener('click', prevMonth);
	  }

	  const nextBtn = document.querySelector('.go-next');
	  if (nextBtn) {
	    nextBtn.addEventListener('click', nextMonth);
	  }

	  renderCalender();
	});

function closePopup() {
  const body = document.querySelector('body');
  const modal = document.querySelector('.modal');
  modal.classList.toggle('show');
  if (!modal.classList.contains('show')) {
    body.style.overflow = 'auto';
  }
}

