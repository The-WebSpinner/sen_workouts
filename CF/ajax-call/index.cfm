<title>Ajax Call</title>
<link rel="stylesheet" href="./assets/css/style.css">
<script src="./assets/js/jquery.min.js"></script>

<form>
    <div class="container p-3 mt-5 w-25 bg-primary text-center shadow-lg">
        <div class="p-2">
            <h3 class="text-light">Ajax Call</h3>
        </div>
        <div class="p-2 form-floating">
        	<input type = "text" id="name" class="form-control" placeholder = "Enter your name">
        	<label for="name" class="text-dark ">Enter Your Name</label>
        </div>
        <div class="p-2 form-floating">
            <input type = "text" id="mail" class="form-control" placeholder = "Enter your mailID">
            <label for="mail" class="text-dark ">Enter Your E-mail</label>
        </div>
        <div class="p-2">
            <button type = "button" id="check" class="button btn-md btn-warning form-control">Check-MailID</button>
        </div>
        <div class="p-2">
            <input type = "button" id="subscribe" class="button btn-md" name="submit" value="SUBSCRIBE" disabled = "true" >
        </div>
    </div>
     <div class="p-2 mx-auto text-center">
         <h3 id="display" class="text-primary" ></h3>
     </div>
</form>

<script>
    
	$('#check').on('click',function(){  
	if($('input[type="text"]').val() == ""){
		$('#display').text('enter name and mailid to proceed');
        return false;
        }else{
			$.ajax({
			type: "post",
			url: "tagcloud.cfc",
			data: {
				method: "getdata",
				name: $('#name').val(),
				email: $('#mail').val()
				},
			dataType: "json",
			success: function( objResponse ){
				if(objResponse == "1"){
					
					$('#display').text('This mail is already subscribed');
				}else{
					$("#subscribe").attr("disabled", false);
				}
		},
		error: function(error){}
	    });
        }
    })

    $('#subscribe').on('click',function(){
    	if($('input[type="text"]').val() == ""){
        $('#display').addClass('text-danger')
        $('#display').text('enter name and mailid to proceed');
        return false;
    	}else{
         $.ajax({
            type: "post",
            url: "tagcloud.cfc",
            data: {
                method: "insertdata",
                name: $('#name').val(),
                email: $('#mail').val()
                },
            dataType: "json",
            success: function( objResponse ){
                if(objResponse == "0"){
                  
                    $('#display').text('Succesfully Subscribed');
                    $('input[type=text]').val(' ');
            }else{}
        },
        error: function(error){     
            }
	    });
    }
    })
</script>
