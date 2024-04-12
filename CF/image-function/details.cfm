<cfoutput>
    <head>
        <title>Details Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <script src="./assets/jquery/jquery.min.js"></script>
    </head>
    <cfset imageOBJ= createObject("component","tagcloud")>
    <cfset imgInfo = imageOBJ.getData("#url.id#")> 
    <a href="index.cfm" class="btn btn-dark mb-3 mt-2 text-center">Home</a>
    <table class="table table-hover table-bordered w-auto table-fixed mx-auto text-center">
        <thead>
            <tr class="table-dark">
                <th>Image Name</th>
                <th>Description</th>
                <th>Original Image</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="#imgInfo#">
                <tr class="table-primary">
                    <td>#imgInfo.ImageName#</td>
                    <td>#imgInfo.Description#</td>
                    <td><img src="./assets/uploaded/#imgInfo.orgimgName#" height="150" width="150"></td>
                </tr>
            </cfloop>
        </tbody>
    </table>
     <style>
    body {
             background-image: linear-gradient(to right, ##40c9ff ,##e81cff);
            }
    </style>
</cfoutput>