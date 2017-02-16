// -------------ACTIONS UPDATED IN DATABASE
function showConfirmation(result) {
    console.log(result);
    if (result.result_code == "login"){
        console.log(this.id);
        window.location.href = "/login";
    } else if (result.result_code == "added"){
        $(this.id).addClass("selected");
        console.log(this.id);
    } else{
        $(this.id).removeClass("selected");
        console.log(this.id);
    }
}

function updateActionTable(evt){
    evt.preventDefault();
    console.log(this.classList[0]+" button has been clicked.");

    var formInputs = {
        "action_type": this.classList[0],
        "place_id": this.id.slice(4)
    };

    console.log("type: "+this.classList[0]);
    console.log("placeid: "+this.id.slice(4));

    $.post("/add-action", 
           formInputs,
           showConfirmation
           );
}
$(document).on('click', '.sav', updateActionTable);
$(document).on('click', '.hbh', updateActionTable);
// $(".sav").on("click", updateActionTable);
//$(".hbh").on("click", updateActionTable);



// -------------SECONDARY SEARCH UPDATES SEARCH RESULTS

function showResults(res_list){
    
    // $("#hidden-span").html($("#city-search-alt").val());
    $("#place-results").remove();
    console.log("after removing the old results");
    $('#results-list').append("<ul id='place-results'> <div id='data_goes_here'> </div> </ul>");
    var i;
    var j;
    for (i = 0; i < res_list.length; i++) {
        $('#data_goes_here').append("<li> <a href='/places/"+ res_list[i].place_id + "'>" + res_list[i].name + "</a> <div id='tag-div-" + res_list[i].place_id + "'> Tag: </div> <div>Rating: " + res_list[i].rating + "</div> <form id='add-action-form'> <input type='button' id='sav-" + res_list[i].place_id + "' class='sav' value='Bookmark'> <input type='button' id='hbh-" + res_list[i].place_id + "' class='hbh' value='Been here'> </form> </li>");   
        console.log(res_list[i].tags)
        $('#tag-div-'+res_list[i].place_id).append(res_list[i].tags);
    }

    
}

function submitSearch(evt){
    evt.preventDefault();
    console.log("after prevent");

    var formInputs = {
        "sort_type": "sort-default",
        "city_search": $("#city-search-alt").val()
    };
    
    $("#hidden-span").html($("#city-search-alt").val());

    $.post('/search.json',
            formInputs,
            showResults);
}

$("#search-button-alt").on('click', submitSearch);


// -------------SORT BY BUTTONS UPDATE SEARCH RESULTS
// function showSomething(result){
//     console.log(result);
// }


function submitSortby(evt){
    evt.preventDefault();
    console.log("button has been clicked.");

    var formInputs = {
        "sort_type": this.id,
        "city_search": $("#hidden-span").html() 
    };

    console.log("type: "+ this.id);
    console.log("city: "+ $("#hidden-span").html());

    $.post("/search.json", 
           formInputs,
           showResults
           );
}

$("#sort-default").on('click', submitSortby);
$("#sort-least-pop").on('click', submitSortby);
$("#sort-name").on('click', submitSortby);


