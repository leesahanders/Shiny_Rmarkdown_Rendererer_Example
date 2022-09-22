## Using a Shiny app for passing in more dynamic parameters to render an rmarkdown document

View this app yourself at: [https://colorado.rstudio.com/rsc/Rmarkdown_Rendererer_Example/](https://colorado.rstudio.com/rsc/Rmarkdown_Rendererer_Example/)

### Reference

This project is using the code from: [https://www.r-bloggers.com/2021/06/shiny-inception-javascript-in-rendered-markdown/](https://www.r-bloggers.com/2021/06/shiny-inception-javascript-in-rendered-markdown/)

### Purpose

This simple example shows how to trigger rendering of a parameterized rmarkdown from inside a shiny app. This is useful because in some cases the user may not have access to the pre-loaded parameters to trigger rendering or the parameters themselves may need to be refreshed on demand. 

For more information on parameterized reports see: [https://docs.rstudio.com/connect/1.7.4/user/param-rmarkdown.html](https://docs.rstudio.com/connect/1.7.4/user/param-rmarkdown.html)
