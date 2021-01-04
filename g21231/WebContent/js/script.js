/**
 * 
 */$(function(){

    $('.slideshow').each(function(){
        var $container = $(this),               //$(this)=$('.slideshow')
            $slideGroup = $container.find('.slideshow-slides'),
            $slides = $slideGroup.find('.slide'),
            $nav = $container.find('.slideshow-nav'),


            slideCount = 4,                      //이미지의 갯수
            currentIndex = 0,
            duration = 80,
            easing = 'easeInOutExpo'


        $slides.each(function(i){
            $(this).css({left:8.5 * i + '%'}); 
        });


        function goToslide(index) {
            $slideGroup.animate({left:-35 * index + '%'}, duration, easing);
            currentIndex = index;

            updateNav();
        }

        function updateNav(){
            var $navPrev = $nav.find('.prev'),
                $navNext = $nav.find('.next');

            if(currentIndex == 0){
                $navPrev.addClass('disabled');
            }else {
                $navPrev.removeClass('disabled');
            }

            if(currentIndex == slideCount - 1){
                $navNext.addClass('disabled');
            }else {
                $navNext.removeClass('disabled');
            }

        }

        $nav.on('click','a',function(event){
            event.preventDefault();
            if($(this).hasClass('prev')){
                goToslide(currentIndex - 1);
            }else {
                goToslide(currentIndex + 1);
            }
        });

        goToslide(currentIndex);

    });

});