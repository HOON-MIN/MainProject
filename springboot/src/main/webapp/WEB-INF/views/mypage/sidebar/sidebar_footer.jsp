<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 내용 끝 -->
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
							var sessionGrade = '${sessionHGRADE}'
							$('#hgrade')
									.click(
											function() {
												console.log('sessionGrade = '
														+ sessionGrade)
												if (sessionGrade == '베이직') {
													alert('프리미엄등급으로 등록을 해주세요!!')
												} else {
													location.href = '${mycontext }/hospitalP/dashboard'
												}
											})
						</script>