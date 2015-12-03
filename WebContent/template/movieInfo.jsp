<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 	
<div class="wrap">
	<div class="background"></div>
	<div class="popup_box">
		<div class="btn_box">
			<button>예매하기</button>
		</div>
		<hr />
	 <div class="movieInfo_box">
        <div class="image_box">
            <img src="poster/sado_poster.jpg" alt="sado_poster"/>
        </div>
        <div class="info">

            <div id="title">

                <h3>사도</h3><span>The Throne, 2014</span>

            </div>
            //title

            <div id="text">
                <strong>감독</strong>: 이준익
                <br>
                <strong>개봉일</strong>: 2015.09.16
                <br>
                <strong>출연진</strong>: 송강호, 유아인, 문근영
                <br>
                <strong>장르</strong>: 사극
                <br>
                <pre><strong>줄거리</strong>: "잘하자. 자식이 잘 해야 애비가 산다!"<br>재위기간 내내 왕위계승 정통성 논란에 시달린 영조는<br>학문과 예법에 있어 완벽한 왕이 되기 위해 끊임없는 노력을 기울인다.<br>뒤늦게 얻은 귀한 아들 세자만은 모두에게 인정받는 왕이 되길 바랐지만<br>기대와 달리 어긋나는 세자에게 실망하게 된다.<a
                        href="">더보기</a></pre>
            </div>
            //text
        </div>
        <div class="grade_box">
            <div>
                <i class="fa fa-star fa-2x"></i>
                <i class="fa fa-star-o fa-2x"></i>
                <i class="fa fa-star-o fa-2x"></i>
                <i class="fa fa-star-o fa-2x"></i>
                <i class="fa fa-star-o fa-2x"></i>
            </div>
        </div>
    </div>
		<hr />
		<div class="chart_box">
			<div id="canvas-holder">
				<h3>성별 비교</h3>

				<div class="gender">
					<i class="fa fa-male male_icon"> 남자</i> <i
						class="fa fa-female female_icon"> 여자</i>
				</div>
				<canvas id="chart-area" />
			</div>
			<div id="canvas-line">
				<h3>예매율</h3>
				<canvas id="canvas2" />
			</div>
		</div>
		<hr />
		<div class="steelCut_box">
			<div class="steelCut_slider">
				<div class="steelCut_btn_box">
					<button class="left_btn">
						<i class="fa fa-chevron-left fa-3x"></i>
					</button>
					<button class="right_btn">
						<i class="fa fa-chevron-right fa-3x"></i>
					</button>
				</div>
				<div class="image_box">
					<img class="first" src="poster/sado_steelcut0.jpg" alt="사도 스틸컷0" />
					<img class="second" src="poster/sado_steelcut1.jpg" alt="사도 스틸컷1" />
					<img class="third" src="poster/sado_steelcut2.jpg" alt="사도 스틸컷2" />
				</div>
			</div>
		</div>
		<hr />
		<div class="trailer_box">
			<div class="trailer_slider">
				<div class="trailer_btn_box">
					<button class="left_btn">
						<i class="fa fa-chevron-left fa-3x"></i>
					</button>
					<button class="right_btn">
						<i class="fa fa-chevron-right fa-3x"></i>
					</button>
				</div>
				<div class="video_box">
					<div class="trailer_list01">trailer01</div>
					<div class="trailer_list02">trailer02</div>
					<div class="trailer_list03">trailer03</div>
					<div class="trailer_list04">trailer04</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="comments_box">
			<div class="comment_list">
				<div class="profile_box">
					<div class="profile_image">
						<img src="profile/profile_01.jpg" alt="프로필사진" />
					</div>
					<div class="profile_name">
						<div>카미</div>
					</div>
				</div>
				<div class="comment_box">
					<div class="comment_text_box">사도세자가 범인이다!</div>
					<div class="like_box">
						<button class="like">
							<i class="fa fa-thumbs-o-up"></i>
						</button>
						<button class="like">
							<i class="fa fa-thumbs-o-down"></i>
						</button>
					</div><!-- //like_box -->
				</div><!-- //comment_box -->
				
				<div class="comment_info">
					<div class="comment_grade">
						<div>
							<i class="fa fa-star fa-1x"></i> <i class="fa fa-star-o fa-1x"></i>
							<i class="fa fa-star-o fa-1x"></i> <i class="fa fa-star-o fa-1x"></i>
							<i class="fa fa-star-o fa-1x"></i>
						</div>
					</div><!-- //comment_grade -->
					
					<div class="comment_date">
						<div>2015.09.14</div>
					</div><!-- //comment_date -->
					
					<div class="comment_report">
						<button>스포일러 신고</button>
						<button>부적절한 표현신고</button>
					</div><!-- //comment_report -->
				</div><!-- //comment_info -->
			</div><!-- //comment_list -->
			
			
			<div class="comment_write_box">
				<div class="profile_box">
				
					<div class="profile_image">
						<img src="profile/profile_01.jpg" alt="프로필사진" />
					</div><!-- //profile_image -->
					
					<div class="profile_name">
						<div>카미</div>
					</div><!-- //profile_name -->
					
				</div><!-- //profile_box -->
				
				<div class="comment_box">
				
					<div class="input_text_box">
						<textarea placeholder="200자 이내" maxlength="200"></textarea>
					</div><!-- //input_text_box -->
					
					<div class="button_box">
						<button>등록</button>
					</div><!-- //button_box -->
					
				</div><!-- //comment_box -->
				
			</div><!-- //comment_write_box -->
			
		</div><!-- //comments_box -->
		
	</div><!-- //popup_box -->
	
</div><!-- //wrap -->
--%>

<div class="wrap">
</div><!-- //wrap -->

<script type="text/template" id="movieInfo">

	<div class="background"></div>
	<div class="popup_box">
		<div class="btn_box">
			<button class="bookingBtn">예매하기</button>
		</div>
		<hr />
		<div class="movieInfo_box">
        <div class="image_box">
            <img src="<@=movies.poster@>" alt=""/>
        </div>
        <div class="info">

            <div id="title">

                <h3><@=movies.title@></h3><span>The Throne, 2014</span>

            </div>
            <!-- //title -->

            <div id="text">
                <strong>감독</strong>: <@=movies.director@>
                <br>
                <strong>개봉일</strong>: <@=movies.releaseDate@>
                <br>
                <strong>출연진</strong>: <@=movies.actor@>
                <br>
                <strong>장르</strong>: <@=movies.genre@>
                <br>
                <pre><strong>줄거리</strong>: <@=movies.synopsis@>
            </div>
        </div>
        <div class="grade_box">
            <div>
				<@for(var j=0; j<5; j++){if(j<avgStar){@>
						<i class="fa fa-star fa-1x"></i> 
					<@}else{@>
						<i class="fa fa-star-o fa-1x"></i>
					<@}} @>
            </div>
        </div>
    </div> 
		<hr />
		<div class="chart_box">
			<div id="canvas-holder">
				<h3>성별 비교</h3>

				<div class="gender">
					<i class="fa fa-male male_icon"> 남자</i> <i
						class="fa fa-female female_icon"> 여자</i>
				</div>
				<canvas id="chart-area" />
			</div>
			<div id="canvas-line">
				<h3>예매율</h3>
				<canvas id="canvas2" />
			</div>
		</div>
		<hr />
		<div class="steelCut_box">
			<div class="steelCut_slider">
				<div class="steelCut_btn_box">
					<button class="left_btn">
						<i class="fa fa-chevron-left fa-3x"></i>
					</button>
					<button class="right_btn">
						<i class="fa fa-chevron-right fa-3x"></i>
					</button>
				</div>
				<div class="image_box" style="width:<@=800*images.length@>px" data-length="<@=images.length@>">
					<@var i = 0;if(images!=""){@>
						<@ $(images).each(function(){ @>
							<div class="steelCutImg">
								<img class="img<@=++i@>" src="<@=this.src@>" alt="<@=this.img_no@>" />
							</div>
						<@ }); @>
					<@}else{@>
							등록된 이미지가 없습니다.
					<@}@>
				</div>
			</div>
		</div>
		<hr />
		<div class="trailer_box">
			<div class="trailer_slider">
				<div class="trailer_btn_box">
					<button class="left_btn">
						<i class="fa fa-chevron-left fa-3x"></i>
					</button>
					<button class="right_btn">
						<i class="fa fa-chevron-right fa-3x"></i>
					</button>
				</div>
				<div class="video_box" >
					<@var i = 0;if(trailers!=""){@>
						<@ $(trailers).each(function(){ @>
							<div class="trailer_list0<@=++i@>">
							 	<a href="#" data-src='<@=this.src@>'>클릭해주세요<i class="fa fa-hand-pointer-o"></i></a>
							</div>
						<@ }); @>
					<@}else{@>
							등록된 트레일러가 없습니다.
					<@}@>
				</div>
			</div>
		</div>
		<hr />
		<div class="comments_box">
			<div class="comment_list">
			<@if(comments!=""){@>
			<@ $(comments).each(function(){ @>
				
				<div class="comment_wrap">
				<div class="profile_box">
					<div class="profile_image">
						<img src="<@=this.memberProfile@>" alt="프로필사진" />
					</div>
					<div class="profile_name"><@=this.memberName@></div>
				</div>
				<div class="comment_box">
					<div class="comment_text_box"><@=this.contents@></div>
					<div class="like_box">
						<button class="like">
							<@if(session!=null){@>
								<i class="fa fa-thumbs-o-up"></i><span data-commentNo="<@=this.commentNo@>" data-memberNo="<@=session.memberNo@>"><@=this.likes@></span>
							<@}else{@>
								<i class="fa fa-thumbs-o-up"></i><span data-commentNo="<@=this.commentNo@>" data-memberNo="null"><@=this.likes@></span>
							<@}@>
						</button>
						<button class="hate">
							<@if(session!=null){@>
								<i class="fa fa-thumbs-o-down"></i><span data-commentNo="<@=this.commentNo@>" data-memberNo="<@=session.memberNo@>"><@=this.hates@></span>
							<@}else{@>
								<i class="fa fa-thumbs-o-down"></i><span data-commentNo="<@=this.commentNo@>" data-memberNo="null"><@=this.hates@></span>
							<@}@>							
						</button>
					</div><!-- //like_box -->
				</div><!-- //comment_box -->
				
				<div class="comment_info">
					<div class="comment_grade">
						<div>
							<@for(var j=0; j<5; j++){if(j<this.star){@>
									<i class="fa fa-star fa-1x"></i> 
								<@}else{@>
									<i class="fa fa-star-o fa-1x"></i>
								<@}} @>
						</div>
					</div><!-- //comment_grade -->
					
					<div class="comment_date">
						<div><@=this.regdate@></div>
					</div><!-- //comment_date -->
					
					<div class="comment_report">
						<button>스포일러 신고</button>
						<button>부적절한 표현신고</button>
					</div><!-- //comment_report -->
				</div><!-- //comment_info -->
				</div><!-- //comment_info -->

			<@ }); @>

			<@}else{@>

				<div class="profile_box">
					<div class="profile_image">
					</div>
					<div class="profile_name">
					</div>
				</div>
				<div class="comment_box">
					<div class="comment_text_box">등록된 댓글이 없습니다.</div>
					<div class="like_box">
					</div><!-- //like_box -->
				</div><!-- //comment_box -->
				
				<div class="comment_info">
					<div class="comment_grade">
						<div>
						</div>
					</div><!-- //comment_grade -->
					
					<div class="comment_date">
					</div><!-- //comment_date -->
					
					<div class="comment_report">
					</div><!-- //comment_report -->
				</div><!-- //comment_info -->
			<@}@>
			</div><!-- //comment_list -->
			
			<@if(session!=null){@>
			<div class="comment_write_box">
				<div class="profile_box">
				
					<div class="profile_image">
						<img src="<@=session.profile@>" alt="프로필사진" />
					</div><!-- //profile_image -->
					
					<div class="profile_name">
						<div><@=session.name@></div>
					</div><!-- //profile_name -->
					
				</div><!-- //profile_box -->
				
				<div class="comment_box">
				
					<div class="input_text_box">
						<textarea placeholder="200자 이내(별점을 체크해주세요!)" maxlength="200"></textarea>
					</div><!-- //input_text_box -->
					
					<div class="button_box">
						<button>등록</button>
					</div><!-- //button_box -->
					
				</div><!-- //comment_box -->

				<div class="starDivFirst">
					<div class="starDivSecond"></div>
					<button data-contents="진짜 재미없었어요!!"></button>
					<button data-contents="별로였어요ㅠㅠ"></button>
					<button data-contents="그저그래요ㅠㅠ"></button>
					<button data-contents="재미있는 편이에요!"></button>
					<button data-contents="진짜 재미있어요!"></button>
				</div>
				
			</div><!-- //comment_write_box -->
			<@}else{@>
			<div class="comment_write_box">
				<div class="profile_box">
				
					<div class="profile_image">
					</div><!-- //profile_image -->
					
					<div class="profile_name">
					</div><!-- //profile_name -->
					
				</div><!-- //profile_box -->
				
				<div class="comment_box">
				
					<div class="input_text_box">
						<textarea placeholder="로그인을하셔야 이용할 수 있습니다." maxlength="200" readOnly></textarea>
					</div><!-- //input_text_box -->
					
					<div class="button_box">
						<button class="none">등록</button>
					</div><!-- //button_box -->
					
				</div><!-- //comment_box -->
				
			</div><!-- //comment_write_box -->

			<@}@>
			
		</div><!-- //comments_box -->
		
	</div><!-- //popup_box -->
	

</script>

<div class="playTrailers">
	<div class="nowTrailer">
		
	</div>
</div>


