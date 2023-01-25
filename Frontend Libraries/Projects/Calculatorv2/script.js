class Calculator {
    constructor(previousOperandTextElement, currentOperandTextElement) {
        this.previousOperandTextElement = previousOperandTextElement;
        this.currentOperandTextElement = currentOperandTextElement;
    }

    clear() {
        this.currentOperand = '';
        this.previousOperand = '';
        this.operation = undefined;
    }

    delete(){
        this.currentOperand = this.currentOperand.toString().slice(0, -1);
    }
    appendNumber(number){
        // console.log(this.currentOperand == undefined);
        if(number == '.' && this.currentOperand.includes('.')) return
        this.currentOperand = (this.currentOperand == undefined) ? number.toString() : this.currentOperand.toString() + number.toString();
    }
    chooseOperation(operation){
        if(this.currentOperand === '') return
        if(this.previousOperand !== ''){
            this.compute();
        }
        this.operation = operation;
        this.previousOperand = this.currentOperand;
        this.currentOperand = '';
    }



    // ! Divide is broken in this calculator;

    
    compute(){
        let computation;
        const prev = parseFloat(this.previousOperand);
        const current = parseFloat(this.currentOperand);
        if(isNaN(prev) || isNaN(current)) return
        switch(this.operation){
            case 'add':
                computation = prev + current;
                break;
            case 'subtract':
                computation = prev - current;
                break;
            case 'multiply':
                computation = prev * current;
                break;
            case 'divide':
                computation = prev / current;
                break;
            default:
                return
        }
        this.currentOperand = computation;
        this.operation = undefined;
        this.previousOperand = '';
    }


    getDisplayNumber(number){
        const stringNumber =  number.toString();
        const integerDigits = parseFloat(stringNumber.split('.')[0]);
        const decimalDigits = parseFloat(stringNumber.split('.')[1]);

        let integerDisplay;
        
        if(isNaN(integerDigits)){
            integerDisplay = '';
        } else {
            integerDisplay = integerDigits.toLocaleString('en', { maximumFractionDigits: 0})
        }
        if(isNaN(decimalDigits)) {
            return integerDisplay
        } else {
            return `${integerDisplay}.${decimalDigits}`
        }
    }

    updateDisplay(){
        this.currentOperandTextElement.innerHTML = this.getDisplayNumber(this.currentOperand);
        if(this.operation != null) {
            this.previousOperandTextElement.innerHTML = `${this.previousOperand} ${document.getElementById(`${this.operation}`).innerHTML}`;
        } else {
            this.previousOperandTextElement.innerHTML = '';
        }
    }
}




const numberButtons = document.querySelectorAll('[data-number]');
const operationButtons = document.querySelectorAll('[data-operation]');
const equalsButton = document.querySelector('[data-equals]');
const deleteButton = document.querySelector('[data-delete]');
const allClearButton = document.querySelector('[data-all-clear]');
const previousOperandTextElement = document.querySelector('[data-previous-operand]');
const currentOperandTextElement = document.querySelector('[data-current-operand]');

const calculator = new Calculator(previousOperandTextElement, currentOperandTextElement);


numberButtons.forEach(button =>{
    button.addEventListener('click', () => {
        calculator.appendNumber(button.innerHTML)
        calculator.updateDisplay();
    })
});

operationButtons.forEach(button =>{
    button.addEventListener('click', () => {
        console.log(button.id);
        calculator.chooseOperation(button.id);
        calculator.updateDisplay();
    })
});

equalsButton.addEventListener('click', button => {
    calculator.compute();
    calculator.updateDisplay();
})

allClearButton.addEventListener('click', button => {
    calculator.clear();
    calculator.updateDisplay();
})

deleteButton.addEventListener('click', button => {
    calculator.delete();
    calculator.updateDisplay();
});

