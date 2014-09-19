#css
- normalize.css
use normalize.css to refix all browser default behaviour

##Techniques
####display vs visibility

The ```display``` tag will hide an element but take no space.

The ```visibility``` tag will hide element and take up space still.
  Hide even from screen readers.

If ```width:0px;height:0px``` it will be be remove from the flow of the page

```text-indent: -10000px;```
  moves content offscreen but can be reached from screen reader

```css
position: absolute !important;
clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
clip: rect(1px, 1px, 1px, 1px);
```
Is a modern technique to hide elements but show on screen readers

```css
.visuallyhidden {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
} 
```
This is how you should hide elements from screen but not screen readers.  
```width:1px; height:1px; overflow:hidden;``` tells the browser to fit everything in 1 x 1 pixel and don't show if everything doesn't fit in dimensions.

###clearfix
```css
.clearfix:before,
.clearfix:after {
    content: " "; 
    display: table; 
}

.clearfix:after {
    clear: both;
}
```
###```position:absolute```
Tells browser to remove element from page flow

###ios
#####native style momentum scrolling in ios5+
```css
overflow: scroll;
-webkit-overflow-scrolling: touch;
```
#####Disable phone number formatting
```<meta name="format-detection" content="telephone=no">```

###chrome
#####Disable translations on page prompt
``` <meta name="google" value="notranslate">```
add class ```class="notranslate"``` if you don't want a section to be translated.