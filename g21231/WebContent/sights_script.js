/**
 * 
 */

/*var a = ["prdt1", "prdt2", "prdt3", 
"prdt4", "prdt5", "prdt6",
"prdt7", "prdt8", "prdt9"];
a.forEach(function(item){
    var obj = document.getElementById('dtl_scpt');
    var dtl = document.getElementById(item);

    dtl.addEventListener('click', function(){
        if(dtl.classList.contains('selected') == false ||
        obj.classList.contains('scpt_inactive')){
            a.forEach(function(itm){
                document.getElementById(itm).classList.remove('selected');
            })
        }

        if(obj.classList.contains('scpt_active')){
            obj.classList.remove('scpt_active');
            obj.classList.add('scpt_inactive');
        } 

        if (dtl.classList.contains('selected') == false) {
            obj.classList.remove('scpt_inactive');
            var h = document.getElementById('dtl_scpt');
            var str = this.id;
            var num = Math.ceil(parseInt(str.substr(4, str.length -4))/3)*3;
            var t = 'prdt' + num;
            var s = document.getElementById(t);

            s.insertAdjacentElement('afterend', h);
            obj.classList.add('scpt_active');

            dtl.classList.add('selected');
        }
        

            
})
})*/

var a = ["prdt1", "prdt2", "prdt3", 
"prdt4", "prdt5", "prdt6",
"prdt7", "prdt8", "prdt9"];
a.forEach(function(item){
	/*var tn = item.substr(4, str.length -4);*/
    var obj = document.getElementById('dtl_scpt_' + item);
    var dtl = document.getElementById(item);

    dtl.addEventListener('click', function(){
        if(dtl.classList.contains('selected') == false ||
        obj.classList.contains('scpt_inactive')){
            a.forEach(function(itm){
                document.getElementById(itm).classList.remove('selected');
            })
        }
		
		
		
        if(obj.classList.contains('scpt_active')){
            obj.classList.remove('scpt_active');
            obj.classList.add('scpt_inactive');
        } else {
	var q = document.querySelectorAll('.scrtpg');
		q.forEach(function(itm){
			itm.classList.remove('scpt_active');
			itm.classList.add('scpt_inactive');
		})
}

        if (dtl.classList.contains('selected') == false) {
            obj.classList.remove('scpt_inactive');
            /*var h = document.getElementById('dtl_scpt_'+item);*/
            var str = this.id;
            var num = Math.ceil(parseInt(str.substr(4, str.length -4))/3)*3;
            var t = 'prdt' + num;
            var s = document.getElementById(t);

            s.insertAdjacentElement('afterend', obj);
            obj.classList.add('scpt_active');

            dtl.classList.add('selected');
        }
        

            
})
})

//향토음식 스크립트
$(function(){
  
    $(".pf_wp").on("click",function(){
        var foodnum = $(this).index();

        $(".fd_cn").css("display","block");
        $(".fd_tt").css("display","none");
        $(".fd_tt").eq(foodnum).css("display","inline-block");

    });
    

});


