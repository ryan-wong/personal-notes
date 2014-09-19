#html
##Meta
- add no-js class to html tag so easy css targeting
- make sure ```
 <meta charset="utf-8">``` is in first 1024 bytes of document
- ```
<meta http-equiv="X-UA-Compatible" content="IE=Edge">```
  tells the browser to use the latest IE compiler for the code. Also needed to be added before title
- ```
<meta name="viewport" content="width=device-width, initial-scale=1">``` 
  always add this meta tag
- all script tags should be loaded at bottom of the page.
  This allows the page to load even if script is loading slowly.
  modernizer needs to be loaded on top
- If your site needs flash, tell them to change back to desktop mode ```<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true">```  
- If you dont support IE < 8 do following:
  
  ```
  <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  ```
##Javascript  
- Should have fall back for jquery if it fails from cdn
```
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.1.min.js"><\/script>')</script>
```
##Indexing
- ```<link rel="sitemap" type="application/xml" title="Sitemap" href="/sitemap.xml">``` direct web spider to your sitemap
-```<meta name="robots" content="noindex">``` tell search engine not to index certain pages(contact us, complaints)
-While Development, turn off indexing ```<meta name="robots" content="noindex" />```

##URl
- Can tell search engine to use this url when indexing. Helps add query parameters for search engine ```<link rel="canonical" href="">```
- Tell search engine short links
- On desktop page, tell search engine mobile has different url ```<link rel="alternate" media="only screen and (max-width: 640px)" href="http://m.example.com/page.html" >```
- On Mobile page say ```<link rel="canonical" href="http://www.example.com/page.html">```

###iOS
- Make app less chrome like and more apple like
```
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
```
- Apple touch icon 
```
<link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.png">
```
