let currentValue = 1;
let clickBtn = document.querySelectorAll(".link");
let lt_Btn = document.querySelector('.lt');
let gt_Btn = document.querySelector('.gt');
let activeBtn = clickBtn[0];

for(btn of clickBtn) {
    btn.addEventListener("click", (e) => {
        activeBtn.classList.remove("active");
        e.target.classList.add("active");
        activeBtn = e.target;
        currentValue = activeBtn.innerHTML;
    });
}

lt_Btn.addEventListener('click', () => {
    if(currentValue > 1) {
        activeBtn.classList.remove("active");
        currentValue--;
        activeBtn = clickBtn[currentValue - 1];
        clickBtn[currentValue - 1].classList.add("active");
    }
})

gt_Btn.addEventListener('click', () => {
    if(currentValue < 5) {
        activeBtn.classList.remove("active");
        currentValue++;
        activeBtn = clickBtn[currentValue - 1];
        clickBtn[currentValue - 1].classList.add("active");
    }
})
