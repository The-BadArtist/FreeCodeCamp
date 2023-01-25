//Jquery
$(document).ready(function(){
    let beep = $('#beep')[0];
    let beepTwo = $('#beepTwo')[0];
    let beepThree = $('#beepThree')[0];
    let count = parseInt($("#break-length").html());
    let duration = parseInt($('#session-length').html());

    let startStop = "stop"
    let counter;
    let converted = false;
    let timerControl = 'session';
    let startBreak;
    
    $("#reset").hide();

    $('#start_stop').click(function() {
        beepThree.play();

        

        

        // * Converts the seconds into minutes
        if(!converted){
            duration *= 60;
            count *= 60;
            converted = true;
        }

        $('#session-increment, #session-decrement, #break-increment, #break-decrement, #session-label, #break-label, #break-length, #session-length').hide();


        if(timerControl == 'session'){
            if(startStop == "stop" && counter == undefined){
                startStop = "start";
                counter = setInterval(timer, 1000);
                $('#reset').hide();
            } else {
                startStop = "stop";
                counter = clearInterval(counter);
                $('#reset').show();
            }
        } else {
            if(startStop == "stop" && startBreak == undefined){
                startStop = "start";
                startBreak = setInterval(breakTimer, 1000);
                $('#reset').hide();
            } else {
                startStop = "stop";
                startBreak = clearInterval(startBreak);
                $('#reset').show();
            }
        }

        function timer(){
            
            duration -= 1;
            
            console.log(duration)
            if(duration == 0){
                beep.play();
                console.log('beep should play');
                timerControl= 'break';
                console.log(timerControl);
                clearInterval(counter);
                
                if(timerControl == "break"){
                    if(startStop == "start" && startBreak !== undefined){
                        startStop = "stop";
                        startBreak = clearInterval(startBreak);
                        
                    } 
                    // else if(startStop == "start" && startBreak == undefined){
                    //     startBreak = setInterval(breakTimer, 1000);
                    // } 
                    else {
                        startStop = "start";
                        startBreak = setInterval(breakTimer, 1000);
                    }
                }
                
            }
            if(Math.floor(duration/60) > 10) {
                if(duration % 60 >= 10) {
                    $('#time-left').html(`Session Time: ${Math.floor(duration/60)}:${duration%60}`);
                } else {
                    $('#time-left').html(`Session Time: ${Math.floor(duration/60)}:0${duration%60}`);
                }
            } else {
                if(duration % 60 >= 10) {
                    $('#time-left').html(`Session Time: 0${Math.floor(duration/60)}:${duration%60}`);
                } else {
                    $('#time-left').html(`Session Time: 0${Math.floor(duration/60)}:0${duration%60}`);
                }
            }

            
            
        }
        
        function breakTimer() {

            count -= 1;
            
            console.log(count)

            if(count == 0){
                beepTwo.play();
                console.log("beepTwo should play")
                clearInterval(startBreak);
                $("#reset").show();
            }
            if(Math.floor(count/60) > 10) {
                if(count % 60 >= 10) {
                    $('#time-left').html(`Break Time: ${Math.floor(count/60)}:${count%60}`);
                } else {
                    $('#time-left').html(`Break Time: ${Math.floor(count/60)}:0${count%60}`);
                }
            } else {
                if(count % 60 >= 10) {
                    $('#time-left').html(`Break Time: 0${Math.floor(count/60)}:${count%60}`);
                } else {
                    $('#time-left').html(`Break Time: 0${Math.floor(count/60)}:0${count%60}`);
                }
            }

        }
        
        
        
    });


    $('#reset').click(function() {
        beepThree.play();

        $("break-length").html(`${count = 5}`)
        $("session-length").html(`${duration = 25}`);
        startStop = "stop"
        counter = undefined;
        converted = false;
        timerControl = 'session';
        startBreak = undefined;
        $('#time-left').html("");
        $('#session-increment, #session-decrement, #break-increment, #break-decrement, #session-label, #break-label, #break-length, #session-length').show();
        ready();
    });

    
    


    $("#break-decrement").click(function() {
        if(count > 1){
            count -= 1;
            $('#break-length').html(count); 
        }
    });

    $("#break-increment").click(function() {
        if(count < duration){
            count += 1;
            $('#break-length').html(count); 
        }
    });

    $("#session-increment").click(function() {
        if( duration < 59) {
            duration += 1;
           $('#session-length').html(duration); 
            
        }
    });

    $("#session-decrement").click(function() {
        if(duration > count && duration > 1) {
            duration -= 1;
        $('#session-length').html(duration); 
        }
    });
});





