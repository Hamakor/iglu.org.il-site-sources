$(document).ready(function(){
    //1237652875123871201293-12470234019274-023-4182-4018-23490182-34018-2390
    $("#sidebar li>a ").hover(function(){

        $(this).stop().animate({marginLeft : "10px"},200,"swing");},
        function(){
        $(this).stop().animate({marginLeft : "0px"},200,"swing");}

    );

    $(".navigation>.alignleft a,.single_alignleft a").hover(function(){
        $(this).stop().animate({marginLeft : "10px"},200,"swing");},
        function(){
        $(this).stop().animate({marginLeft : "0px"},200,"swing");}

    );


    $(".navigation>.alignright a,.single_alignright a").hover(function(){
        $(this).stop().animate({marginRight : "10px"},200,"swing");},
        function(){
        $(this).stop().animate({marginRight : "0px"},200,"swing");}

    );


    $("#sidebar h2").toggle(function(){
        $(this).next().hide(300);
    },function(){
        $(this).next().show(300);
    });

     $("#comments").toggle(function(){
        $("ul.commentlist").hide(400);
    },function(){
        $("ul.commentlist").show(400);
    });

});
