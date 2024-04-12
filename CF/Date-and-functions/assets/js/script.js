 $(document).ready(function(){
        $('.textcolor').each(function() {
            if( $(this).text().includes("Sunday") ) {
              $(this).css("color","#ffff80");
            } else if( $(this).text().includes("Monday") ) {
              $(this).css("color","#ff9580");
            }else if( $(this).text().includes("Tuesday") ) {
              $(this).css("color","#9580ff");
            }else if( $(this).text().includes("Wednesday") ) {
              $(this).css("color","#ff80bf");
            }else if( $(this).text().includes("Thursday") ) {
              $(this).css("color","#8aff80");
            }else if( $(this).text().includes("Friday") ) {
              $(this).css("color","#80ffea");
            }else if( $(this).text().includes("Saturday") ) {
              $(this).css("color","#ffca80");
            }else{};
        });
     });