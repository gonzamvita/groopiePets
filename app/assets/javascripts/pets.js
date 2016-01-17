$(document).ready(function(){
    $(".button-collapse").sideNav();
    $('.modal-trigger').leanModal();
    $('.materialboxed').materialbox();

    $(".js-get-detail").on('click', function (event) {
        event.preventDefault();
        var link = $(event.currentTarget);

        $.ajax({
          type: "GET",
          url: "/pets/" + link.data("pet-id"),
          dataType: 'JSON',
          success: function(data) {
            var pet_desc = data.name.concat(" is a ", data.breed, " and is ", data.age, " years old.")
            $(".js-pet-name").text(data.name);
            $(".js-pet-description").text(pet_desc);
            $("#js-pet-img").attr("src", data.photo_url);
            $("#petDetailModal").openModal();
          }
        })
    });
  });
