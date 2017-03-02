//----------------Add comment to DB----------------//
function showReview(review){
  $('#div-all-comments').append("<li> <div id='div-comment-" + review.comment_id + "'> <a href='/users/" + review.user_id + "'>" + review.user_name + " said</a> <h6>" + review.comment + "</h6> </div></li>");

console.log("Comment_id" + review.comment_id) 
}

function storeReview(){
    console.log("Comment: "+ $("#text-review").val());
    
    var formInputs = {
    "reviewtext": $("#text-review").val(),
    "place_id": $("#hidden-placeid").html()
    };

    $.post("/post_comment.json", 
           formInputs,
           showReview
           );

};

$("#add-comment-button").on('click',storeReview)