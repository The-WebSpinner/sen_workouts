<cfoutput>
    <head>
        <title>List Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <script src="./assets/jquery/jquery.min.js"></script>
    </head>
    <cfset imageOBJ= createObject("component","tagcloud")>
    <cfset imgInfo = imageOBJ.getData()> 
    <body>
     <a href="index.cfm" class="btn btn-warning mb-3 mt-2 text-center">Home</a>
    <table class="table table-dark table-hover
     w-auto table-fixed mx-auto text-center mt-5">
        <thead>
            <tr class="table-dark">
                <th>Image Name</th>
                <th>Thumbnail</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="#imgInfo#">
                <tr ></tr>
                    <td><a href="details.cfm?id=#imgInfo.ID#" class="text-info">#imgInfo.imagename#</a></td>
                    <td><cfimage action="resize" source="#expandPath('./assets/uploaded/#imgInfo.orgimgName#')#" height="20" width="20"destination="#expandPath('./assets/thumbimages/#imgInfo.orgimgName#')#" overwrite="true">
                    <img src="./assets/thumbimages/#imgInfo.orgimgName#">
                    </td>
                </tr>
            </cfloop>
        </tbody>
    </table>
    
    </body>
    <style>
    body {
             background-image: linear-gradient(to right, ##0061ff , ##60efff);
            }
    </style>
</cfoutput>