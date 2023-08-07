<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, sans-serif;
}

.calendar {
  width: 300px;
  margin: 0 auto;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  margin-bottom: 10px;
}

.weekdays div {
  text-align: center;
  font-weight: bold;
}

.days {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
}

.days div {
  text-align: center;
  padding: 5px;
  border: 1px solid #ccc;
}

.days div:hover {
  background-color: #f2f2f2;
}

.today {
  background-color: #007bff;
  color: #fff;
}
</style>
</head>
<body>
<div class="calendar">
    <div class="header">
      <button id="prevBtn">이전</button>
      <h2 id="monthYear"></h2>
      <button id="nextBtn">다음</button>
    </div>
    <div class="weekdays">
      <div>일</div>
      <div>월</div>
      <div>화</div>
      <div>수</div>
      <div>목</div>
      <div>금</div>
      <div>토</div>
    </div>
    <div class="days" id="calendarDays">
    </div>
  </div>
</body>
<script type="text/javascript">
const monthYearElement = document.getElementById('monthYear');
const calendarDaysElement = document.getElementById('calendarDays');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

let currentDate = new Date();

function renderCalendar() {
  const firstDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
  const lastDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);

  monthYearElement.textContent = `${currentDate.toLocaleString('default', { month: 'long' })} ${currentDate.getFullYear()}`;

  let daysHtml = '';
  let dayOfWeek = firstDayOfMonth.getDay();
  let dayCounter = 1;

  while (dayCounter <= lastDayOfMonth.getDate()) {
    if (dayOfWeek === 0) daysHtml += '<div class="day sunday">';
    else if (dayOfWeek === 6) daysHtml += '<div class="day saturday">';
    else daysHtml += '<div class="day">';

    if (currentDate.getDate() === dayCounter && currentDate.getMonth() === firstDayOfMonth.getMonth()) {
      daysHtml += `<div class="today">${dayCounter}</div>`;
    } else {
      daysHtml += `${dayCounter}`;
    }
    
    daysHtml += '</div>';

    dayCounter++;
    dayOfWeek = (dayOfWeek + 1) % 7;
  }

  calendarDaysElement.innerHTML = daysHtml;
}

renderCalendar();

prevBtn.addEventListener('click', () => {
  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, currentDate.getDate());
  renderCalendar();
});

nextBtn.addEventListener('click', () => {
  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, currentDate.getDate());
  renderCalendar();
});
</script>
</html>