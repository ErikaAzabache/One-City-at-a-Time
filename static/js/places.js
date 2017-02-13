(function() {
    $(document).ready(function(){
        console.log("Yay! You are in your place page");
        var name = $("#name").text();

        if (name) {
            window.images.findRelevantImage(name);
        }
    })
}())

// alert("You are in places");

// function SearchNow(evt) {
//     alert("You submitted");
//     evt.preventDefault();
//     var name = $("#city-search").val();

//     console.log("Location: "+ name);

//     if (name) {
//         window.images.findRelevantImage(name);
//     }
// }

// $("#search-button").on('click', SearchNow);