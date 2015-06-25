library("metromonitor")
#freight profiles use old codes? see Los Angeles, Poughkeepsie
metros <- metropops()

top <- c(
  '<!DOCTYPE html>',
  '<html>',
  '<meta charset="UTF-8">',
  '<meta name="viewport" content="width=device-width, initial-scale=1">',
  paste0('<title>PDF Profiles ', round(runif(1,0,1)*100,0), '</title>'),
  '</html>',
  '<body>',
  '<style>',
    'p,a{font-size:12px;text-decoration:none;color:rgb(5,55,105);text-transform:uppercase;font-family:arial,helvetica,sans;margin:3px 0px 1px 0px;}',
  '</style>'
  )

bot <- c("</body></html>")
style <- 'style="float:left;width:31%;margin:8px 0px 0px 2%;font-size:13px" '

lines <- vector(mode="character")
for(i in 1:nrow(metros)){
  lines <- c(lines, paste0('<p ', style,'><a href="./profiles/', metros[i,"CBSA_Code"], '.pdf">', metros[i,"CBSA_Title"], '</a></p>') )
}

writeLines(c(top,lines,bot), "~/Projects/DataViz/FreightProfilesDropdown/index.html")
