function fileread(filename)
{            
   var contents= fs.readFileSync(filename)
   return contents
}        
var fs =require("fs");  // file system        
var filename = "./schema/schema.py"
var file = fileread(filename)
var data = file.toString()
var header = "from sgqlc.types.relay import Connection, connection_args \n"

data = header + data

var startToken = `class Query(sgqlc.types.Type):`
var endToken = `class`
var startQueryIndex = data.indexOf(startToken)
var startDataFromQuery = data.substring(startQueryIndex + startToken.length, data.length)
var endQueryIndex = startDataFromQuery.indexOf(endToken)

if(endQueryIndex == -1){
    endQueryIndex = data.length + endToken.length
} else {
    endQueryIndex += startQueryIndex + startToken.length
}

var queryClass = data.substring(startQueryIndex + startToken.length, endQueryIndex - endToken.length)

var invalidToken = `, graphql_name=`
var validToken = `, args=connection_args(), graphql_name=`
queryConnectionClass = queryClass.replaceAll(invalidToken, validToken)
data = data.replaceAll(queryClass, queryConnectionClass)

fs.writeFile(filename, data, (err) => {
    if(err != null){
        console.log("Error: ", err)
    } else {
        console.log("Status: Complete")
    }
})