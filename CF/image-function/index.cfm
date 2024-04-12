<cfoutput>
<html>
   <head>
		<title>Upload Image</title>
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/jquery/jquery.min.js"></script>
         <style>
            body {
                background-image: linear-gradient(to right, ##ff1b6b , ##45caff);
            }
        </style>
    </head>
    
    <cfset imageOBJ= createObject("component","tagcloud")>

    <cfif NOT directoryExists(expandpath('./assets/uploaded'))>
		<cfset directoryCreate(expandpath('./assets/uploaded'))>
	</cfif>
    <cfif NOT directoryExists(expandpath('./assets/thumbimages'))>
		<cfset directoryCreate(expandpath('./assets/thumbimages'))>
	</cfif>
    
    <div class=" container-fluid mx-auto w-50 mt-5 p-3  bg-dark text-light text-center">
        <h4>Image Function and upload validation</h4>
    </div>
    <form name="imageForm" id="imgForm" method="post" enctype="multipart/form-data">
        <div class=" container-fluid mx-auto w-50  p-3 bg-light">
            <div class="row text-center">
                <div class="col-sm-6">
                    <label class="form-label text-dark">Image Name:</label>
                </div>
                <div class="col-sm-6">
                     <input type="text" placeholder="enter image name" class="form-control" name="imgName"id="imgName"/>
                </div>
            </div>
            <div class="row text-center mt-3">
                <div class="col-sm-6">
                    <label class="form-label text-dark">Description:</label>
                </div>
                <div class="col-sm-6">
                     <textarea class="form-control" name="description"id="desc"></textarea>
                </div>
            </div>
             <div class="row text-center mt-3">
                <div class="col-sm-3">
                    <input type="file" id="myfile" name="myfile">
                </div>
                 <div class="col-sm-3">
                    <a href="list.cfm" class="btn btn-warning mb-3 mt-2 text-center">List</a>
                </div>
                <div class="col-sm-3">
                    <input type="submit" value="submit" name="submit" class="btn-sm btn-success" >
                </div>
            </div>
        </div>   
    </form>
     <script>
        $("##imgForm").on("submit", function(){
        
        let imgname = $("##imgName").val();
        let descname=$("##desc").val();
        let myfile=$("##myfile").val();

    
        if(imgname==""){
            $("##display1").text("Image name cannot be Empty");
            return false;
        }else if(descname==""){
            $("##display1").text("Description Cannot be empty");
            return false;
        }else if(myfile==''){
            $("##display1").text("Upload any image");
             return false;
        } else if (myfile!=""){
           
            let fileSize = document.getElementById('myfile').files[0].size.toString();
            if(fileSize > 1000000) {
                 $("##display1").text("Uploading image size must be less than 1 mb");
             return false;
            }
        }else{}
        })
    </script>
    <H4 class="text-center text-light" id="display1"></H4>
    <cfif structkeyexists(form,"submit")>
        <cftry>
            <cffile 
                action="upload"  
                destination="#expandpath('./assets/uploaded')#" 
                nameconflict="MakeUnique" 
                accept="image/png, image/gif,image/jpg,image/jpeg" 
                allowedextensions=".png,.gif,.jpg,.jpeg" 
                result="uploadedimg"
            >
            <cfcatch type="any">
                <cfif cfcatch.message CONTAINS 'The MIME type or the Extension'>
                   <h5 class="text-center text-white"> #cfcatch.detail#"</h5>
                </cfif>
                <CFABORT>
            </cfcatch>
        </cftry>
        <cfset imageOBJ.insertData(imageName=form.imgName, Description=form.description,originalName=uploadedimg.SERVERFILE)>
        <cflocation url="list.cfm" addToken="false">
    </cfif>
</cfoutput>



