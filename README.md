## 1. 프로젝트 개요
- **프로젝트명:** 위드펫(WithPet)
- **진행 기간:** 2021.11.01 ~ 2021.12.06
- **기획 의도:** 반려동물을 키우는 인구가 늘어나는 것에 주목하여 종합적인 서비스를 제공하는 반려동물 플랫폼을 기획
- **개발 목표:** 반려동물 플랫폼 구축
- **개발 인원:** 5명
- **개발 환경:** OS - Window10  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; Language - Java, JSP, HTML, CSS, JavaScript, jQuery, Ajax  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; DBMS - Oracle, MyBatis  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; WAS & Build - Apache Tomcat 9.0, Maven  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; Framework & Library - Spring, Bootstrap  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; Hosting - Amazon EC2  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; SCM - Git, GitHub, Sourcetree  
&#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; Tools - Eclipse, IntelliJ, SQL Developer, Notion  
<br>

## 2. 프로젝트 일정
<img width="70%" src="https://user-images.githubusercontent.com/91939475/146005362-7956fdb3-d244-44cc-a510-446fd89d36aa.jpg"/>  
<br>

## 3. Workflow
<img width="70%" src="https://user-images.githubusercontent.com/91939475/146005605-5e8fa7fe-d2a7-49be-9ca4-5df99c231d43.png" />  
<br>

## 4. DB 설계
- **논리**  
<img width="70%" src="https://user-images.githubusercontent.com/91939475/146006081-2aa7490e-82ec-4353-9938-35349df932ca.png" />

- **물리**     
<img width="70%" src="https://user-images.githubusercontent.com/91939475/146006242-a9e245ee-61d6-4c38-8193-aae5d5380551.png" /> 
<br>

## 5. 주요 기능
### 5-1. 비동기식 처리
- **아이디 중복 검사**  

  ``` javascript
    //아이디 중복확인
    $.ajax({
        type: "POST",
        url: "idCheck",
        data: {"id": id},
        success: function (data) {

            if (data == 1) {	//중복 ID
                alert("중복 아이디입니다");
                var idText = '<font color="red">중복 아이디입니다.</font>';
                $("#id_check").text('').show().append(idText);
                $("#id").val('').focus();
                return false;

            } else {	//사용 가능한 ID
                alert("사용 가능한 아이디입니다");
                var idText = '<font color="blue">사용가능한 아이디입니다.</font>';
                $("#id_check").text('').show().append(idText);
                $("#pwd").focus();
            }
        }
        ,
        error: function (e) {
            alert("data error" + e);
        }
    });
  ```  

- **추천 기능**  
``` javascript  
    <!-- 추천 버튼 클릭 시 -->
    <script>
       function hosLikeButton() {
           if (${empty sessionScope.id}) {
                alert("로그인이 필요한 서비스입니다!");
                return false;

            } else if ("${sessionScope.id}" == "${hospital.hos_writer}") {
               alert("자신의 글은 추천할 수 없습니다!");
                 return false;

            } else {
               var hosLikeData = 'hos_no='+${hospital.hos_no}+'&id='+"${sessionScope.id}";
               $.post('${path}/hosLikeInsert', hosLikeData, function (message) {
                 alert(message);
               });
               return false;
            }
        }
     </script>
```   
``` java
  // 1. 추천 버튼 클릭 시(병원)
	@RequestMapping("/hosLikeInsert")
	public String likeInsert(Hoslike hoslike, Model model) {

		// 브라우저 출력을 통해 전달할 메세지
		String message = "";
		
		// 추천 버튼 클릭 시 전달 받은 hos_no(글 번호)와 id 값으로 추천 테이블에 데이터 존재 여부 확인
		Hoslike result = likesService.select(hoslike);
		
		if(result != null) {	// 이미 추천 이력이 존재하면
			message = "이미 추천하셨습니다!";
		}else {					// 추천 이력이 존재하지 않으면
			message = "추천했습니다!";
			likesService.insert(hoslike);
			
			// 병원 게시판 게시글 추천수 업데이트
			hospitalService.updateLike(hoslike.getHos_no());
		}
				
		model.addAttribute("message", message);
		return "likeResult";
	}
```  

### 5-2. API 활용
- 다음 주소 API   

- 카카오맵 API  

- CK Editor API 
  
- NHN KCP API  

### 5-3. 보안 처리
- **메일 계정**  

``` java

	// .properties 파일 읽어오기
        Properties properties = new Properties();
        try {
            Reader reader = Resources.getResourceAsReader("application.properties");
            properties.load(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // appKey 변수 선언
        String appKey = properties.getProperty("daumpost.appKey");
	
```

- **카카오맵 앱 키**  

``` java

	// .properties 파일 읽어오기
        Properties properties = new Properties();
        try {
            Reader reader = Resources.getResourceAsReader("application.properties");
            properties.load(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }


        // Mail Server 설정
        String charSet = "utf-8";
        String hostSmtp = "smtp.naver.com";
        String hostSmtpId = properties.getProperty("mail.hostSmtpId");
        String hostSmtpPwd = properties.getProperty("mail.hostSmtpPwd");
	    
```  
