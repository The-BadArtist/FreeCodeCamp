 let trailingResult = 0;
            let operationOptions = ['divide', 'add', 'subtract', 'multiply'];
            let workingOperation = "";

            function updateDisplay(input) {
                let display = document.getElementById("display");
                let secondaryDisplay = document.getElementById("secondary_display");

                if(display.innerHTML == "0" && operationOptions.indexOf(input) == -1){
                    if(input == "decimal") {
                        display.innerHTML = "0.";
                    } else if(input === 'negative-value'){
                        if(display.innerHTML.indexOf("-1") == -1) {
                        display.innerHTML = "-" + display.innerHTML;
                        } else if(display.innerHTML.indexOf("-1") > -1) {
                            display.innerHTML = display.innerHTML.slice(1, display.innerHTML.length);
                        }
                    } else {
                        display.innerHTML = input;
                    }
                } else if (operationOptions.indexOf(input) >= 0) {
                    //Dealing with operand being selected twice
                    if(trailingResult === display.innerHTML) {
                        workingOperation = input;
                    } else if(workingOperation ===  "") {
                        workingOperation = input;
                        trailingResult = display.innerHTML;
                        display.innerHTML = 0;
                    } else {
                        trailingResult = calculate(trailingResult, display.innerHTML, workingOperation);
                        secondaryDisplay.innerHTML = trailingResult;
                        display.innerHTML = 0;
                        workingOperation = input;
                    }
                } else if (input == 'equals') {
                    display.innerHTML = calculate(trailingResult, display.innerHTML, workingOperation);
                    trailingResult = 0;
                    workingOperation = "";
                } else if (input == 'decimal') {
                    if(display.innerHTML.indexOf('.') == -1){
                        display.innerHTML += "."
                    }
                } else if(input == 'negative-value'){
                    if(display.innerHTML.indexOf("-1") == -1) {
                        display.innerHTML = "-" + display.innerHTML
                    } else if(display.innerHTML.indexOf("-1") > -1) {
                        display.innerHTML = display.innerHTML.slice(1, display.innerHTML.length);
                    }
                } else {
                    display.innerHTML += input;
                }  

            }
            
            function clearDisplay() {
                display.innerHTML = 0;
                trailingResult = 0;
            }
            
            // function clearAll() {
            //     clearDisplay();
            //     console.log()
            //     secondaryDisplay.innerHTML = 0;
            //     trailingResult = 0;
            // }

            function calculate(firstNum, secondNum, operation) {
                let result;
                firstNum = parseFloat(firstNum);
                secondNum = parseFloat(secondNum);

                switch(operation){
                    case 'add':
                        result = firstNum + secondNum;
                        break;
                    case 'subtract':
                        result = firstNum - secondNum;
                        break;
                    case 'multiply':
                        result = firstNum * secondNum;
                        break;
                    case 'divide':
                        result = firstNum / secondNum;
                    default:
                        break;
                }
                
                return result.toString();
            }