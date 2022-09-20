package com.main.ateam.vo;

public class SearchPageVO {
		// 기존 Map에 넣었던 start
		private int start;
		// 기존 Map에 넣었던 end
		private int end;
		// 인자로 받아 와서 처리하던 cPage
		private String cPage;
		// 검색의 칼럼을 정해줄 key 값
		private String searchkey;
		// 검색을 할 값
		private String searchval;
		// 검색 버튼을 눌렀을때 페이지를 1페이지로 이동 시키기 위한 초기화값
		private String startsearch;
		
		private String searchid;
		
		// 기존의 인자로 받아 왔던 값을 RequestParam을 이용해서 defaultValue를  지정할수 있지만
		// dto를 통으로 가져올때는 사용할수 없기 때문에 생성자를 이용해서 초기화
		public SearchPageVO() {
			cPage = "1";
			searchkey = "";
			searchval = "";
			startsearch = "";
		}
		
		// 아래는 기존 setter 와  getter
		
		public String getStartsearch() {
			return startsearch;
		}

		public String getSearchid() {
			return searchid;
		}

		public void setSearchid(String searchid) {
			this.searchid = searchid;
		}

		public void setStartsearch(String startsearch) {
			this.startsearch = startsearch;
		}

		public String getSearchkey() {
			return searchkey;
		}
		public void setSearchkey(String searchkey) {
			this.searchkey = searchkey;
		}
		public String getSearchval() {
			return searchval;
		}
		public void setSearchval(String searchval) {
			this.searchval = searchval;
		}
		public String getcPage() {
			return cPage;
		}
		public void setcPage(String cPage) {
			this.cPage = cPage;
		}
		public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}
}
