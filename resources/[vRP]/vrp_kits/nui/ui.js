

$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
                if ( item.unimed == true ) {
                $('.kit-unimed').css('display','block');
            } else if ( item.unimed == false ) {
                $('.kit-unimed').css("display","none");
            } else if ( item.repair == true ) {
                $(".kit-repair").css("display", "block");
            } else if ( item.repair == false ) {
                $(".kit-repair").css("display", "none");
            } else if ( item.carteira == true ) {
                $(".cnh-area").css("display", "block");
            } else if ( item.carteira == false ) {
                $(".cnh-area").css("display", "none");
            } else if ( item.porte == true ) {
                $(".porte-area").css("display", "block");
            } else if ( item.porte == false ) {
                $(".porte-area").css("display", "none");
            }
       });
	
	$("#kit-unimed").click(function(){
        $.post('http://vrp_kits/kit-unimed', JSON.stringify({}));2
    });

    $("#kit-repair").click(function(){
        $.post('http://vrp_kits/kit-repair', JSON.stringify({}));2
    });
    $("#comprar-cnh").click(function(){
        $.post('http://vrp_kits/comprar-cnh', JSON.stringify({}));2
    });
    $("#comprar-porte").click(function(){
        $.post('http://vrp_kits/comprar-porte', JSON.stringify({}));2
    });

    $("#close").click(function(){
        $.post('http://vrp_kits/close', JSON.stringify({}));2
    });

    $(".closebtn").click(function(){
        $.post('http://vrp_kits/close', JSON.stringify({}));2
    });
   
   })