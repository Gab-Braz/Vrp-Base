$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
           if ( item.showPlayerMenu == true ) {
       $('body').css('background-color','transparent');
   
   $('.container').css('display','block');
   } else if ( item.showPlayerMenu == false ) { // Hide the menu
   
   $('.container').css('display','none');
   $('body').css('background-color','transparent important!');
       $("body").css("background-image","none");
   
           }
       });
    
       


    //    Comidas
	$("#pao").click(function(){
        $.post('http://vrp_market/pao', JSON.stringify({}));2

    });
	
	$("#leite").click(function(){
        $.post('http://vrp_market/leite', JSON.stringify({}));2

    });
	
	$("#vodka").click(function(){
        $.post('http://vrp_market/vodka', JSON.stringify({}));2

    });

    $("#suco").click(function(){
        $.post('http://vrp_market/suco', JSON.stringify({}));2

    });

    $("#agua").click(function(){
        $.post('http://vrp_market/agua', JSON.stringify({}));2

    });

    $("#vinho").click(function(){
        $.post('http://vrp_market/vinho', JSON.stringify({}));2

    });

    $("#limonada").click(function(){
        $.post('http://vrp_market/limonada', JSON.stringify({}));2

    });

    $("#pipoca").click(function(){
        $.post('http://vrp_market/pipoca', JSON.stringify({}));2
    });

    $("#espaguete").click(function(){
        $.post('http://vrp_market/espaguete', JSON.stringify({}));2
    });

    $("#rosquinha").click(function(){
        $.post('http://vrp_market/rosquinha', JSON.stringify({}));2
    });

    $("#pizza").click(function(){
        $.post('http://vrp_market/pizza', JSON.stringify({}));2
    });

    $("#gps").click(function(){
        $.post('http://vrp_market/gps', JSON.stringify({}));2
    });



    $("#closebtn").click(function(){
        $.post('http://vrp_market/closeButton', JSON.stringify({}));2
    });
   
})