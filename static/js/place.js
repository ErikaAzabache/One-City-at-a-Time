//----------------Add comment to DB----------------//
function showReview(review){
  $('#div-all-comments').prepend("<div id='comment-" + review.comment_id + "' class='avatar-comment'><div class='avatar'><img src=" + review.avatar + "height='50' width='50'></div> <div class='panel panel-default panel-comment' style='display:inline-block'> <a href='/users/" + review.user_id + "'>" + review.user_name + "</a> <h6 style='display:inline-block'>said</h6> <h6>" + review.comment + "</h6> </div> </div>");
  $("#text-review").val('');
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