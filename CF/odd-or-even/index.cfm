<cfoutput>
    <html>
        <head>
            <title>CF Excercise</title>
            <link rel="icon" type="imageicon" href="./assets/images/task.png">
            <link rel="stylesheet" href="./assets/css/style.css">
            <script src="./assets/js/jquery.js"></script>
        </head>
        <body class = "bg-secondary bg-gradient">
            <form name="form_1" id="form1" method="post"> 
                <div class="container mx-auto w-25 bg-dark mt-5">
                    <h4 class="text-center">Printing ODD EVEN Numbers</h4>
                    <h5 class="text-light text-center">Enter any Number</h5>
                    <div class="row">
                        <div class="col-sm-9 mx-auto text-center">
                            <div>
                                <input type="text"class="inputBox border" id="box" name="input_box">
                            </div>
                            <div class="text-danger d-none" id="ErrorMessage"></div>
                        </div>
                    </div>
                    <div class="row">
                        <center>
                            <button class="btn btn-success mt-3 mb-3" id="button" name="button1">Submit</button>
                        </center>
                    </div>
                    <div class = "text-light Result">
                        <cfif structKeyExists(form,"button1")>
                            <cfset user_input = form.input_box>
                            <cfloop index="i" from="1" to="#user_input#">
                                <cfif i mod 2 eq 1 >
                                    <p class = "text-center text-primary"> #i# </p> 
                                <cfelseif i mod 2 eq 0>
                                    <p class = "text-center text-success" > #i# </p> 
                                </cfif>
                            </cfloop>
                        </cfif>
                    </div>
                </div>
            <form>
        </body>
    </html>
    
    <script>
        $("##box").focus();
        $("##button").click(function(){
            $(".Result").html("");
            $("##ErrorMessage").html("");
            var input_box = $("##box").val();
            if (input_box == "") {
                $("##ErrorMessage").html("Give any numbers to proceed");
            } else if (isNaN(input_box)) {
                $("##ErrorMessage").html("Numbers only allowed");
            };
            if($("##ErrorMessage").html()==''){
                $("##form1").submit();
            }
            else{
                $("##ErrorMessage").removeClass("d-none");
                $("##box").addClass("border-danger")
                return false;
            }
        })
    </script>
</cfoutput>

