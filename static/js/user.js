//---- Change Profile picture to Imgur and save reference to database ----//
function requestUpload(evt){
    var file = $("#user-photo")[0].files[0];
    if (file) {
        var reader = new FileReader();
        reader.readAsDataURL(file);

        reader.onload = function(e) {
            $.ajax({
                  url: 'https://api.imgur.com/3/image',
                  type: 'POST',
                  headers: {
                    Authorization: "Client-ID 48dd480a9b5f4ef",
                    Accept: 'application/json'
                  },
                  data: {
                    image: e.target.result.split(',')[1],
                    type: 'base64',
                  },
                  success: function(result) {
                        console.log(result.data.type.slice(6));

                        var formInputs = {
                        "pic_id": result.data.id,
                        "extension": result.data.type.slice(6),
                        };

                        $.post('/save_picture.json',
                            formInputs, 
                            function(res){
                                console.log(res.pic_url);
                                $("#preview").attr("src", res.pic_url)
                            });                   
                  }
            });
        };
    }
}

$("#upload-pic").on('click', requestUpload);

// ---------------------- Make profile editable ----------------------//
function editDone(){
    if ($("#edit-profile").val()=='Edit'){
        $("#update-pic").removeAttr('hidden');
        $(".delete-action").removeAttr('hidden');
        $("#edit-description-button").removeAttr('hidden');
        $('#edit-profile').attr('value','Done');
    } else{
        $("#update-pic").prop('hidden','hidden');
        $(".delete-action").prop('hidden','hidden');
        $("#edit-description-button").prop('hidden','hidden');
        $('#edit-profile').attr('value','Edit');
    }
}

$("#edit-profile").on('click', editDone);
//----------------------- Remove actions -------------------------------//
function hideRemovedActions(result) {
    console.log(result);
    if (result.result_code == "undo"){
        var div = "div-" + result.action_type + "-" + result.place_id;
        $("#"+div).prop('hidden','hidden')  
    } 
}

function editActions() {
    console.log("action_type: " + this.id.slice(5,8));
    console.log("place_id: " + this.id.slice(9));

    var formInputs = {
        "action_type": this.id.slice(5,8),
        "place_id": this.id.slice(9)
    };

    $.post("/add-action.json", 
           formInputs,
           hideRemovedActions
           );
}

$(document).on('click', '.delete-action', editActions);

//-------------------Make description editable------------//
function showEditDescription(){
    $("#div-edit-description").removeAttr('hidden');
    $("#div-show-description").prop('hidden', 'hidden');
};

$("#edit-description-button").on('click', showEditDescription);


//------------------Submit edited profile---------------//
function showDescription(result){
    $("#div-edit-description").prop('hidden', 'hidden');
    $("#div-show-description").removeAttr('hidden');
    $("#text-description").val(result.description);
    $("#db-text-description").html(result.description);
}


function storeDescription(){

    console.log("description: "+ $("#text-description").val());
    console.log("User id: " + $("#hidden-userid").html())
    
    var formInputs = {
    "description": $("#text-description").val(),
    "user_id": $("#hidden-userid").html()
    };

    $.post("/edit_profile", 
           formInputs,
           showDescription
           );

};

$("#done-description-button").on('click', storeDescription);
