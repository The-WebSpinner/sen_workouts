
    <!DOCTYPE html>
    <html>
        <head>
            <link rel="styleSheet" href="./assets/css/form.css">
            <script src="./assets/js/jquery.minjs"></script>
            <title>Employee Form</title>
        </head>
        <body>
            <div class="header">
                <h5>CREATE ACCOUNT</h5>
            </div>
            <form  method="post" enctype="multipart/form-data" name="newform" onsubmit="return validateform()" class="form1">
                <div class="rowFlex ">
                    <div class="columnFlex ">
                        <label for="firstName" class="names"> First Name:*</label>
                        <input type="text" placeholder="enter your first name" class="boxtext" name="fName" >
                    </div>
                    <div class="columnFlex lastname">
                        <label for="lastName" class="names"> Last Name:</label>
                        <input type="text" placeholder="enter your lastname" class="boxtext" name="lName">
                    </div>
                </div>
                <div class="columnFlex boxtext">
                    <label for="mail" class="names"> Email:*</label>
                    <input type="text" placeholder="enter your email" class="boxLength" name="mailId">
                </div>
                <div class="rowFlex">
                    <div class="columnFlex">
                        <label for="pwd" class="names"> Password:*</label>
                        <input type="text" placeholder="enter your password" class="boxtext" name="Password">
                    </div>
                    <div class="columnFlex lastname">
                        <label for="Cpwd" class="names"> Confirm Password:*</label>
                        <input type="text" placeholder="enter your password again" class="boxtext" name="Cpassword">
                    </div>
                </div>
                <div class="rowFlex betweenSpace">
                    <div class="columnFlex">
                        <label for="gender" class="names"> Gender</label>
                        <div class="rowFlex">
                            <input type="radio" id="male" name="gender" value="male"/> <label for="gender" class="name"> Male</label>
                            <input type="radio" id="female" name="gender" value="Female"/> <label for="gender" class="name"> Female</label>
                        </div>
                    </div>
                    <div class="columnFlex margin">
                        <label for="hobbies" class="names"> Hobbies</label>
                        <div class="rowFlex">
                            <input type="checkbox" id="hobby1" name="hobby1" value="hobby1"/> <label for="Music" class="name"> Music</label>
                            <input type="checkbox" id="hobby2" name="hobby2" value="hobby2"/> <label for="Sports" class="name"> Sports</label>
                            <input type="checkbox" id="hobby3" name="hobby3" value="hobby3"/> <label for="Travel" class="name"> Travel</label>
                            <input type="checkbox" id="hobby4" name="hobby4" value="hobby4"/> <label for="Movies" class="name"> Movies</label>
                        </div>
                    </div>
                </div>
                <div class="rowFlex betweenSpace">
                    <div class="columnFlex">
                        <label for="income" class="names"> Source of Income</label>                       
                        <select name="S_income" id ="S_income">
                            <option value="Employed">Employeed</option>
                            <option value="UnEmployed">Unemployeed</option>
                        </select>
                    </div>
                    <div class="columnFlex marginnew">
                        <label for="incomeslider" class="names">Income</label>
                        <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
                    </div>
                    <div class="rangebutton">
                        <button type="button">20K</button>
                    </div>
                </div>
                <div class="rowFlex betweenSpace">
                    <div class="columnFlex">
                        <label for="profilePicture" class="names"> Upload your Profile picture</label>
                        <input type ="file" id="myfile">
                    </div>
                    <div class="columnFlex">
                        <label for="age" class="names"> Age</label>
                        <input type ="text" placeholder="18">
                    </div>
                </div>
                <div class="columnFlex">
                    <label for="bio" class="names"> Bio</label>
                    <textarea id ="bio" name="bioname" ></textarea>
                </div>
                <div class="footer">
                    <input type="submit" value="submit" name="submit" class="submit">
                </div>
            </form>
        </body>
    </html>

    <script>
        function validateform() {
            let fname=document.forms["newform"]["fName"].value;
            let lname=document.forms["newform"]["lName"].value;
            let email=document.forms["newform"]["mailId"].value;
            var mailExp = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            let password=document.forms["newform"]["Password"].value;
            let Cpassword=document.forms["newform"]["Cpassword"].value;
            var passcode=/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/;
                        

            if(fname == ""){
                alert("First name must be filled");
                return false;
            }

            if(lname == ""){
                alert("Last name must be filled");
                return false;
            }

            if(email == ""){
                alert("Email field must be filled");
                return false;
            }

            if(password == ""){
                alert("Fill password Field");
                return false;
            } 
            if(Cpassword == ""){
                alert("Enter password again");
                return false;
            }     
            
            if( mailExp.test(email)){
                return true; 
            } else {
                alert("Please enter valid email");
                return false;
            }

            if(password.match(passcode)){
            return true;
            } else {
                alert("password must contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
                return false; 
            } 
        }
        
    </script>
    
