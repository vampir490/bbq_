$(document).ready(function(){
    flatpickr('#flatpickr-input',
        { enableTime:      true,
            minDate:         "today",
            defaultHour:     20,
            defaultMinute:   30,
            dateFormat: "d-m-Y H:i",
            time_24hr: true
        });
});