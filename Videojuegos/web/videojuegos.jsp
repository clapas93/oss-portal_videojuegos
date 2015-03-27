<%-- 
    Document   : main
    Created on : 13/03/2015, 01:48:01 AM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="public/js/jssor.js"></script>
<script type="text/javascript" src="public/js/jssor.slider.js"></script>
<script src="public/js/slider.js"></script>
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="slider1_container" style="position: relative; top: 50px; left: 0px; width: 100%;
        height: 550px; background: #191919; overflow: hidden;">

        <!-- Loading Screen -->
        <!-- <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(public/img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div> -->

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 700px; height: 450em; overflow: hidden;">
            <div>
                <img u="image" src="public/img/alila/01.jpg" />
                <img u="thumb" src="public/img/alila/thumb-01.jpg" />
                <h2>HOLA MUNDO</h2>
            </div>
            <div>
                <img u="image" src="public/img/alila/02.jpg" />
                <img u="thumb" src="public/img/alila/thumb-02.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/03.jpg" />
                <img u="thumb" src="public/img/alila/thumb-03.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/04.jpg" />
                <img u="thumb" src="public/img/alila/thumb-04.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/05.jpg" />
                <img u="thumb" src="public/img/alila/thumb-05.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/06.jpg" />
                <img u="thumb" src="public/img/alila/thumb-06.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/07.jpg" />/
                <img u="thumb" src="public/img/alila/thumb-07.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/08.jpg" />
                <img u="thumb" src="public/img/alila/thumb-08.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/09.jpg" />
                <img u="thumb" src="public/img/alila/thumb-09.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/10.jpg" />
                <img u="thumb" src="public/img/alila/thumb-10.jpg" />
            </div>
            
            <div>
                <img u="image" src="public/img/alila/11.jpg" />
                <img u="thumb" src="public/img/alila/thumb-11.jpg" />
            </div>
            <div>
                <img u="image" src="public/img/alila/12.jpg" />
                <img u="thumb" src="public/img/alila/thumb-12.jpg" />
            </div>
        </div>
        
        <!-- Arrow Navigator Skin Begin -->
        <style>
            /* jssor slider arrow navigator skin 05 css */
            /*
            .jssora05l              (normal)
            .jssora05r              (normal)
            .jssora05l:hover        (normal mouseover)
            .jssora05r:hover        (normal mouseover)
            .jssora05ldn            (mousedown)
            .jssora05rdn            (mousedown)
            */
            .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
            {
              position: absolute;
              cursor: pointer;
              display: block;
                background: url(public/img/a17.png) no-repeat;
                overflow:hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05ldn { background-position: -250px -40px; }
            .jssora05rdn { background-position: -310px -40px; }
        </style>
        <!-- Arrow Left -->
        <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 158px; left: 8px;">
        </span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 158px; right: 8px">
        </span>
        <!-- Arrow Navigator Skin End -->
        
        <!-- Thumbnail Navigator Skin Begin -->
        <div u="thumbnavigator" class="jssort01" style="position: absolute; width: 1370px; height: 100px; left:0px; bottom: 0px;">
            <!-- Thumbnail Item Skin Begin -->
            <style>
                /* jssor slider thumbnail navigator skin 01 css */
                /*
                .jssort01 .p           (normal)
                .jssort01 .p:hover     (normal mouseover)
                .jssort01 .pav           (active)
                .jssort01 .pav:hover     (active mouseover)
                .jssort01 .pdn           (mousedown)
                */
                .jssort01 .w {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 100%;
                    height: 100%;
                }

                .jssort01 .c {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 68px;
                    height: 68px;
                    /*border: #000 2px solid;*/
                }

                .jssort01 .p:hover .c, .jssort01 .pav:hover .c, .jssort01 .pav .c {
                    background: url(public/img/t01.png) center center;
                    border-width: 0px;
                    top: 2px;
                    left: 2px;
                    width: 68px;
                    height: 68px;
                }

                .jssort01 .p:hover .c, .jssort01 .pav:hover .c {
                    top: 0px;
                    left: 0px;
                    width: 70px;
                    height: 70px;
                    border: #fff 1px solid;
                }
            </style>
            <div u="slides" style="cursor: move;">
                <div u="prototype" class="p" style="position: absolute; width: 72px; height: 72px; top: 0; left: 0;">
                    <div class=w><div u="thumbnailtemplate" style=" width: 100%; height: 100%; border: none;position:absolute; top: 0; left: 0;"></div></div>
                    <div class=c>
                    </div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Thumbnail Navigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">jQuery Slider</a>
    </div>
