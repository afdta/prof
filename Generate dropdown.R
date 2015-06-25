library("metromonitor")
#freight profiles use old codes? see Los Angeles, Poughkeepsie
metros <- metropops()
metros$short <- nameshort(metros$CBSA_Title, type="Met")

top <- c(
  '<!DOCTYPE html>',
  '<html>',
  '<meta charset="UTF-8">',
  '<meta name="viewport" content="width=device-width, initial-scale=1">',
  paste0('<title>PDF Profiles ', round(runif(1,0,1)*100,0), '</title>'),
  '</html>',
  '<body>',
  '<style>',
    'p,a{font-family:arial,helvetica,sans;margin:3px 0px 1px 0px;}',
    'a{font-size:12px;color:rgb(5,55,105);text-transform:uppercase;font-family:arial,helvetica,sans;}',
  '</style>'
  )

bot <- c("</body></html>")
#style <- 'style="float:left;width:31%;margin:8px 0px 0px 2%;font-size:13px" '

#lines <- c('<p style="clear:both;">LINK DUMP OPTION</p>')
#for(i in 1:nrow(metros)){
#  lines <- c(lines, paste0('<p ', style,'><a href="./profiles/', metros[i,"CBSA_Code"], '.pdf">', metros[i,"CBSA_Title"], '</a></p>') )
#}
lines <- vector(mode="character")
lines <- c(lines, '<select id="freight-profiles-select" style="float:left;clear:left;">')

for(j in 1:nrow(metros)){
  lines <- c(lines, paste0('<option value="', metros[j,"CBSA_Code"], '_', metros[j,"short"], '">', metros[j,"CBSA_Title"], '</option>'))
}

lines <- c(lines,"</select>")
lines <- c(lines, '<p style="float:left;clear:right;margin-left:10px;"><a id="freight-profile-link">Link to profile</a></p>')

lines <- c(lines, "<script>\n(function(){\n  var sel = document.getElementById('freight-profiles-select'); var link = document.getElementById('freight-profile-link'); \n  sel.onchange=function(){link.href='./profiles/'+sel.value+'.pdf'} })() \n</script>")


writeLines(c(top,lines,bot), "~/Projects/DataViz/FreightProfilesDropdown/index.html")
