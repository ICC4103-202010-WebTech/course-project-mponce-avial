(() => {
    document.addEventListener("turbolinks:load", () => {
        const buttons = document.querySelectorAll(".reply_button");

        buttons.forEach((element) => {
            element.addEventListener("click",function(){
                var a = element.closest("div").offsetParent.firstElementChild.lastElementChild
                a.style.display = "block"
            });
        })
    })

})();