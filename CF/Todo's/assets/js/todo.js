
$(document).ready(function(){

    clearComplete();       
    getdata("","");
    countStatus();
    $('#allBtn').css("color","#FF6347");

    $('#textbox').on('keypress',function(e) {
 
        if(e.which == 13) {
            if($('#textbox').val()== ''){
            return false;
        }else{
        var todo = $('#textbox').val();
            $.ajax({
                type: "post",
                url: "todo.cfc",
                data: {
                    method: "insertdata",
                    todo: todo,
                },
                dataType: "json",
                success: function( objResponse){
                    getdata(objResponse,"");
                    countStatus ();
                    navbarshow();
                },
                error: function(error){}
            });
        }}

        

 
    })

$(document).on('mouseenter', '.itemRow', function() {
    $(this).find('.hideBtn').css('display', 'block')
});
$(document).on('mouseleave', '.itemRow', function() {
    $(this).find('.hideBtn').css('display', 'none');
});

$(document).on('click', '.hideBtn', function() {
    var dataID = $(this).attr('data-id');
    var rowtoDel = $(this).closest('.checklistMain');
    delData( dataID, rowtoDel );     
    
    
    setTimeout(function(){
        clearComplete();   
    },100)
    
    
})

$(document).on('change', '.checkbox-round', function() {
    var updateData = $(this).parent().next().find('label').text();
    var checkedDeleteID = ( $(this).attr('data-id'));
    var isActive = $(this).attr('data-active'); 
    var elt= $(this);
   var hrefurl=$(location).attr("href");
   var last_part=hrefurl.substr(hrefurl.lastIndexOf('#') + 1)
    
   
    
    if($(this).prop('checked') == true) {
        if($(document).on ( 'click', '.nav-link',function() {
        ($(this).attr('href').split("#")[1]);
   }
        ))  
    $(this).parent().next().find('label').addClass('strike');
    
    }else if($(this).prop('checked') == false) {
        
        $(this).find('.strike').css('display', 'block');
        $(this).parent().next().find('label').removeClass('strike');
    }
        
     updatedata( checkedDeleteID,updateData , isActive , elt);
     clearComplete();
     
     setTimeout(function(){
         if(last_part=="completed"){
        showcompleted()
    }else if(last_part=="active"){
        showactive()
    }else{};


     },200)
   
});

$(document).on('click', '#clearBtn', function() {
    $('.checkbox-round:checked').each(function(index, value) {
        var checkedDeleteID = ( $(this).attr('data-id'));
        var rowtoDel = $(this).closest('.checklistMain');
        delData( checkedDeleteID, rowtoDel );    
        clearComplete();   
    });
     $('#textbox').focus();
        
} )


$(document).on('click', '#activeBtn', function() {
 
    showactive ()
 })

$(document).on('click', '#completedBtn', function() {
     
     showcompleted();

 })

 $(document).on('click', '#allBtn', function() {
     $('.checklistMain').show();
     countStatus ();
$('#textbox').focus();
 })


  $(document).on('click', '#complete', function() {

    var url = $(location).attr('href'),
    parts = url.split("#")[1]
     console.log(parts);
    $('#textbox').focus();


 })


function delData( id, elt ) {
    $.ajax({
        type: "post",
        url: "todo.cfc",
        data: {
            method: "deleteData",
            ID: id
        },
        success: function( objResponse ){
            elt.remove();
            countStatus();
        }
    });

}

function updatedata(id, todoText, isActive, elt) {

    isactive = ( isActive == 1 || isActive == true ) ? "0": "1";

    $.ajax({
        type: "post",
        url: "todo.cfc",
        data: {
            method: "updateData",
            ID: id,
            data:todoText ,
            state_check: isactive
        },
        success: function( objResponse ) {
            console.log(objResponse, 'objResponse');
            $(elt).attr('data-active', isactive) ;
            countStatus();
        }
        
    });
}


function getdata(id,state_check){
     $.ajax({
        type: "post",
        url: "todo.cfc",
        data: {
            method: "getdata",
            ID: id,
            state_check:state_check
            },
        dataType: "json",
        
        success: function( objResponse ){
            for(i=0; i<objResponse.DATA.length; i++){
                var todoitem =  objResponse.DATA[i][1];
                var ID =  objResponse.DATA[i][0];
                var status_check = objResponse.DATA[i][2];
                statusCheck = status_check == true ? '1' : '0';
                
            
            $('ol').append(`
                <li class="checklistMain">
                    <div class = "row itemRow" >
                        <div class = "col-2">
                            <input type="checkbox" class="checklist checkbox-round " data-id="${ID}" data-active = "${statusCheck}" >
                        </div>
                        <div class = "col-8 mx-auto p-2 text-center todoItemdisplay">
                            <label class="text-dark control-label display">${todoitem}</label> 
                            <input type="text"  class="edit form-control text-center" style = "display:none;" />
                            
                        </div>
                        <div class = "col-2 p-2 mx-auto  text-center">
                            <button type="button" class="btn-close close hideBtn" data-id="${ID}" aria-label="Close"></button>
                        </div>
                    </div>
                </li>
            `);
            $('#textbox').val('');

            $('input[type="checkbox"]').each(function() {
            if($(this).data('active') == 0) {
            $(this).attr('checked', true)
            $(this).parent().next().find('label').addClass('strike');
            countStatus();


    }
})     
            }
            
        },
        error: function(error){}
     });
}


function countStatus (){
    $.ajax({
        type: "post",
        url: "todo.cfc",
        data: {
            method:"countData",
        },
        success: function(objResponse){
            console.log(objResponse,"counstatus");
            $('#item').html(objResponse)
        
        }
    });
}

    $(document).on('dblclick', '.display', function() {  

        var label=$(this);
        $(this).next('.edit').css('display', 'block');
        $(this).next('.edit').val($(this).text());
        $(this).hide();
    $(this).next('.edit').focus();

        $(this).next('.edit').on('keypress focusout',function(e)   {
            console.log(e.which);

            if(e.which == 13||e.type == 'focusout') {
                if ($(this).val()== ""){
                return false;
                }else{
                var updateData = $(this).val();
                var elt= $(this).closest('.row').find('.checkbox-round');
                var checkedDeleteID =$(elt).attr('data-id');
                var isActive = $(elt).attr('data-active') == 1?0:1;

                updatedata( checkedDeleteID, updateData , isActive , elt);
                

                $(label).next('.edit').css('display', 'none');
                $(label).show();

                setTimeout(function(){
                    $.ajax({
                        type: "post",
                        url: "todo.cfc",
                        data: {
                            method: "getdata",
                            ID: checkedDeleteID,
                            },
                        dataType: "json",
                        
                        success: function( objResponse ){
                            console.log(objResponse, 'objResponse');
                            for(i=0; i<objResponse.DATA.length; i++){
                                var todoitem =  objResponse.DATA[i][1];
                                $(label).text(todoitem);
                            }
                            console.log(todoitem);
                            // location.reload(true);
                        
                        }
                    })
                }, 100)
            }}

        })
    
    })

    $('.nav-link').click(function(){

        $('.nav-link').removeClass("active");
        $(this).addClass("active"); 
        
        $('.nav-link').css("color","rgba(0, 0, 0, .55)");
        $(this).css("color","#FF6347");
    
        });




    function clearComplete() {
         setTimeout(function(){
        $('#clearBtn').css("display","none");
        if ($('input[type="checkbox"]:checked').length > 0) {
            $('#clearBtn').css("display","block");
        }
        
    },100)
    navbarshow()
    }



    function navbarshow(){
         setTimeout(function(){
        
        if($('ol li').length){
            $(".leftitem").show()
            $(".navbar").show()
        } else{
            $(".leftitem").hide()
            $(".navbar").hide()
        }
    },50)
    }

    function showactive (){
    $('.checklistMain').show();
    $('input[data-active="0"]').each(function(){

        $(this).closest('.checklistMain').hide();
    })
        countStatus ();
        $('#textbox').focus();
    }

    function showcompleted(){
        $('.checklistMain').show();
        $('input[data-active="1"]').each(function(){
        $(this).closest('.checklistMain').hide();
        })
            countStatus ();
        $('#textbox').focus();
    }


//  $(document).on('keyup', '#testBox', function() {
    
//     if( $("#testBox").val().length >= 3){

//             $.ajax({
//             type: "post",
//             url: "todo.cfc",
//             data: {
//                 method:"testdata",
//                 custname: $("#testBox").val()
//             },
//             dataType: 'json',
//             success: function(objResponse){
                    
//                  for(i=0; i<objResponse.DATA.length; i++){
//                         var testresponse=  objResponse.DATA[i][0];
//                      $("#display3").append(testresponse+"<br>")
//                  }
                
                
//             }
//     })


//     }


//  })




});
