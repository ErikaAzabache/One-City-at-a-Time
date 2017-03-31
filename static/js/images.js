// (function() {
//     window.images = {
//         findRelevantImage: function (location) {
//             console.log("Now looking for an image for " + location);

//             var params = {
//                 q: location,
//                 count: 1
//                 // Request parameters
//             };
          
//             $.ajax({
//                 url: "https://api.cognitive.microsoft.com/bing/v5.0/images/search?" + $.param(params),
//                 beforeSend: function (xhrObj){
//                     var key = "6ea6faa2413b41729448f4a93be11ca8";
//                     xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key", key);
//                 },
//                 type: "GET",
//                 // Request body
//                 // data: "{body}",
//             })
//             .done(function (data) {
//                 console.log("We got data back! Now adding image to page.");

//                 if (data && data.value && data.value.length > 0) {
//                     var searchResult = data.value[0];
//                     var contentUrl = searchResult.contentUrl;

//                     if (contentUrl) {
//                         $('#placeImage').attr("src", contentUrl);
//                     }
//                 }
//             })
//             .fail(function (data) {
//                 alert(data);
//             });
//         }
//     }
// }())


// (function() {
//     window.images = {
//         findRelevantImage: function (location) {
//             console.log("Now looking for an image for " + location);

//             var appendApiKeyHeader = function( xhr ) {
//                 xhr.setRequestHeader('Api-Key', 'mzny9juqjjsdufyjxa8m9mdq')
//             }

//             var searchRequest = { "phrase": location }
          
//             $.ajax({
//                 type: "GET",
//                 beforeSend: appendApiKeyHeader,
//                 url: "https://api.gettyimages.com/v3/search",
//                 data: searchRequest})
//             .success(function (data, textStatus, jqXHR) {
//                 console.log("We got data back! Now adding image to page.");

//                 if (data && data.images && data.images.length > 0) {
//                     var searchResult = data.images[0];
//                     var contentUrl = searchResult.display_sizes[0].uri;

//                     if (contentUrl) {
//                         $('#placeImage').attr("src", contentUrl);
//                     }
//                 }
//             })
//             .fail(function (data, err) {
//                 alert(data);
//                 console.log(err)
//             });
//         }
//     }
// }())
