<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="Scripts/responsiveslides.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                maxwidth: 960,
                namespace: "centered-btns"
            });
        });
    </script>
    <section class="featured">
        <div class="rslides_container">
            <ul class="rslides" id="slider">
                <li>
                    <img src="images/slide1.png" /></li>
                <li>
                    <img src="images/slide2.png" /></li>
            </ul>
        </div>
    </section>

    <section id="content">
        <div class="zerogrid">
            <div class="main-content">
                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“礼”</a></h2>
                        </div>
                        <div class="content">
                            <img src="images/icon1.png" />
                            <p>&emsp;&emsp;礼者，不学“礼”无以立，《管子·牧民》所谓“仓廪实则知礼节，衣食足则知荣辱”，民间婚嫁、丧娶、入学、拜师、祭祀自古都有礼乐之官（司礼），孔子上代屡为司礼之官，孔子少即习礼，“为儿嬉戏，常陈俎豆，设礼容”（《史记·孔子世家》,在国家宗庙祭祀方面，古代官方常设太常寺、祠祭署等礼仪衙曹，设立读祝官、赞礼郎、祀丞等礼仪官。如唐代设立有郊社、太乐、鼓吹、太医、太卜、廪牺六个部门，明代则设置太常司，太常司设卿，少卿，丞，典簿、协律郎、博士，赞礼郎。现代官方则设立外交部礼宾司( Concierge)负责国家之大礼，主管国家对外礼仪事项。涉外酒店则专门设有首席礼宾司职位（Chief Concierge），负责酒店礼宾事务。正式的首席礼宾司职业资格由国际金钥匙组织认证。</p>
                        </div>
                    </section>
                </div>

                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“乐”</a></h2>
                        </div>
                        <div class="content">
                            <img src="images/icon2.png" />
                            <p>&emsp;&emsp;有“礼” 则必有庆贺燕飨之“乐”，有庆贺燕飨之乐则必有五音宫商角徵羽伴奏，古代政府设立掌管音乐的官吏,并负责负责宫中庆贺燕飨之乐。历史记载孔子主要有三位老师，相传曾“ 问礼于老聃，学乐于苌弘，学琴于师襄”。师襄, 春秋时期鲁国著名乐官, 孔子的老师之一，孔子曾向他学习弹琴。《史记》里说他“以击磬为官，然能于琴”。唐代的梨园则设立乐官，由梨园教坊使、梨园使、梨园判官、梨园供奉官、都都知与都知组成。 现代音乐则早已发展为一种文化产业。</p>
                        </div>
                    </section>
                </div>

                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“射”</a></h2>
                        </div>
                        <div class="content">
                            <img src="images/icon3.png" />
                            <p>&emsp;&emsp;射，“射”乃中国古代六艺之一，孔夫子在《论语》中说过：“君子无所争，必也射乎，揖躟而升，下而饮，其争也君子。”因此，“射”不但是杀敌卫国的技术，更是一种修身养性的体育活动。中国古代的“射艺”包含两个主要运动：射箭和弹弓，春秋时期还发明了弩。其中射箭由于在军事和狩猎活动中具有非常重要的作用，因此在历史上更受人们的重视。考古工作者在山西峙峪人文化遗址，曾经发现了一件距今两万八千年前的石箭头，这表明当时人类已经在开始使用弓箭了。唐代武则天设立了武举制度，在武举制度里规定了九项选拔和考核人才的标准，其中五项是射箭，包括长跺、马射、步射、平射还有筒射等等。如今的“射”艺，其实应该综容古今，包含现代的手枪、步枪、等实弹射击运动，也应该包括古代的射箭和弹弓，射弩。</p>
                        </div>
                    </section>
                </div>

                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“御”</a></h2>
                        </div>

                        <div class="content">
                            <img src="images/icon4.png" />
                            <p>&emsp;&emsp;御，“御”的范围就是驾驶，但是无论在现代和古代，都包含交通工具的“驾驶学”和政治、领导、和管理学领域的“驾驭学”。中国古代著名的案例包括“赵襄王学御于王子朝”和“田忌赛马”，这说明，驾驭之术不仅仅是一种斗勇，更是一种斗智，包含对某一问题在运筹学、驾驭学、领导学方面的综合最优化。</p>
                        </div>
                    </section>
                </div>

                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“书”</a></h2>
                        </div>
                        <div class="content">
                            <img src="images/icon5.png" />
                            <p>&emsp;&emsp;书，“书”顾名思义，书画艺术，把书画算作一种技艺就错了，中国的书画不仅是一种高雅技艺，更是一种修心养性的工具和法宝，很多官僚寄情于书画，不仅仅是锻炼技艺，醉翁之意不在酒，留给读者三思吧。</p>
                            <p>&emsp;&emsp;《汉书》首先谈到"六书"的具体名称：“古者八岁入小学，故周官保氏掌管国子，教之六书，象形、象事、象意、象声、转注、假借，造字之本也。”</p>
                        </div>
                    </section>
                </div>

                <div class="col-1-3">
                    <section>
                        <div class="heading">
                            <h2><a>何谓“数”</a></h2>
                        </div>
                        <div class="content">
                            <img src="images/icon6.png" />
                            <p>&emsp;&emsp;数，即数学之数，现代已经延伸为“数理化”之数。中国古代数学很早就已经很发达，中国古代数学体系的形成以汉代《九章算术》的出现为重要标志。古代数学家把数学的起源归于《周易》以及“河图洛书”，如宋朝时期著名大数学家秦九韶说：“周教六艺，数实成之。学士大夫，所从来尚矣。……爰自河图、洛书闿发秘奥，八卦、九畴错综精微，极而至于大衍、皇极之用，而人事之变无不该，鬼神之情莫能隐矣。”六艺中的“数”应指自然、人文变化即“变数”。</p>
                        </div>
                    </section>
                </div>

                <div class="col-2-3">
                    <article>
                        <div class="heading">
                            <h2><a href="blog.html">"新六艺"的转变</a></h2>
                        </div>
                        <div class="content">
                            <p>互联网发展至今，六艺也开始发生了转变，本网站重新定义了“六艺”</p>
                            <p>礼仪（礼）：校园礼仪课程、中国传统文化礼仪课程、现代人际交往基本礼仪课程</p>
                            <p>审美（乐）：书画视频教学课程、乐器视频教学课程、青少年服饰穿搭课程</p>
                            <p>运动（射）：篮球、足球、乒乓球、跳绳、射箭、游泳、跆拳道、武术、瑜伽、高尔夫等课程</p>
                            <p>驾驶（御）：小汽车驾驶教学视频、马术教学视频</p>
                            <p>表达（书）：应用文写作视频、诗词朗诵视频</p>
                            <p>思维（数）：奥数课程、少儿编程</p>
                        </div>
                    </article>
                </div>

                <div class="sidebar col-1-3">
                    <section class="">
                        <div class="heading">联系我们</div>
                        <div class="content">
                            <img src="images/img.jpg" />
                            <p>地址：xxx市xxx区xxx地方</p>
                            <p>邮箱：1603764752@qq.com</p>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
</asp:Content>


