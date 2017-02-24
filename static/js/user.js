function requestUpload(evt){
    var file = $("#user-photo")[0].files[0];
    // var read = new FileReader();
    // if (file.size && file.type)

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













