

$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
                if ( item.conce == true ) {
                $('.container').css('display','block');
            } else if ( item.conce == false ) {
                $('.container').css("display","none");
            }
       });

    $("#daftruck").click(function(){
        $.post('http://vrp_concecaminhao/daftruck', JSON.stringify({}));2
    });

    $("#kamaztrucker").click(function(){
        $.post('http://vrp_concecaminhao/kamaztrucker', JSON.stringify({}));2
    });

    $("#mantrucker").click(function(){
        $.post('http://vrp_concecaminhao/mantrucker', JSON.stringify({}));2
    });
	
	$("#mercedestrucker").click(function(){
        $.post('http://vrp_concecaminhao/mercedestrucker', JSON.stringify({}));2
    });
	
	$("#scaniatrucker").click(function(){
        $.post('http://vrp_concecaminhao/scaniatrucker', JSON.stringify({}));2
    });
	
	$("#volvotrucker").click(function(){
        $.post('http://vrp_concecaminhao/volvotrucker', JSON.stringify({}));2
    });

    $("#close").click(function(){
        $.post('http://vrp_concecaminhao/close', JSON.stringify({}));2
    });
   
   })