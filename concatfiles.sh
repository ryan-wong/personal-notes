while read line; do cat $line; done < vendorlist.txt  > app/public/js/vendor2.js
