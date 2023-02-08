package com.green.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.allfs.service.AllfsService;
import com.green.allfs.vo.AllfsVo;
import com.green.festival.service.FestivalService;
import com.green.festival.vo.FestivalVo;
import com.green.image.service.ImageService;
import com.green.image.vo.ImageVo;
import com.green.sight.service.SightService;
import com.green.sight.vo.Criteria;
import com.green.sight.vo.PageMaker;
import com.green.sight.vo.SightVo;
import com.green.user.service.UserService;
import com.green.user.service.WApiService;
import com.green.user.vo.UserVo;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService; 
	
	@Autowired
	private WApiService wapiService;
	
	@Autowired
	private SightService sightService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private FestivalService festivalService;
	@Autowired
	private AllfsService allfsService;


	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	
	@PostMapping("/loginProcess")
	public  String   loginProcess(
		HttpSession     session,
		@RequestParam HashMap<String, String> map,
		HttpServletRequest request,
		HttpServletResponse response) throws Exception{
		
		String returnURL = "";
		
		
		
		if( session.getAttribute("home") != null ) {
			// 기존 login 이란 session 에 값이 존재한다면

			session.removeAttribute("home");  // 기존값을 제거한다

		}
		//System.out.println("map = " + map);
		// 로그인을 성공하면 UserVo 객체를 반환함
		
		UserVo  vo  = userService.login( map );
		//됨	System.out.println("vo.getUser_id : " + vo.getUser_id());
		

	//	Object obj = session.getAttribute("thisid"); 
	//	String urname = (String) obj;  연습한다고 써봄
		
		
		if ( vo != null ) {
			session.setAttribute("home", vo);
			session.setAttribute("thisid", vo.getUser_id());   //~님 환영합니다 떄문에 
			returnURL = "redirect:/Main";        // 로그인 성공시
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디와 비밀번호를 확인해주세요.'); history.go(-1);</script>");
				out.flush();
				returnURL = "redirect:/";	 // 로그인 실패시		
			}
		return returnURL;
		
	}
	
	@PostMapping("/Write")
	public String write( UserVo user,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		

		String one = user.getUser_id();
		String two = user.getUser_name();
		String three = user.getUser_pw();
		
		if(one == "") {
			response.setContentType("text/html; charset=UTF-8");
			
			out.println("<script>alert('아이디를 입력해주세요'); history.go(-1);</script>");
			out.flush();
			return "redirect:/";
		}
		else if(two == "") {
			response.setContentType("text/html; charset=UTF-8");
			
			out.println("<script>alert('이름을 입력해주세요'); history.go(-1);</script>");
			out.flush();
			return "redirect:/";
		}
		else if(three == "") {
			response.setContentType("text/html; charset=UTF-8");
			
			out.println("<script>alert('비밀번호를 입력해주세요'); history.go(-1);</script>");
			out.flush();
			return "redirect:/";
			
		}else if((one != "") && (two != "") && (three != "" )) {

			userService.insertUser(user);
			return  "redirect:/";
			
			}else {
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script>alert('완전히 작성해주세요.'); history.go(-1);</script>");
				out.flush();
				return "redirect:/"; 
			}
	
	}	


	
	@RequestMapping("/logout") 
	public  String  logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";  // 로그아웃시 이동할 주소 -> /login
		}
	
	@RequestMapping("/Maps")
	public String maps(Model model) {
	
		return "maps";
	}
	
	@RequestMapping("/Guest")
	   public  String   guestprocess(HttpSession session, Model model) {
		
		System.out.println("넘어옴!!!");

	      if( session.getAttribute("home") != null ) {
	    	  
	    	  session.removeAttribute("home");        
	         }
	      
		  	List<SightVo> sightList = sightService.getSightList();
			List<ImageVo> imageList = imageService.getImageList();
			
			
			model.addAttribute("sightList",sightList);
			model.addAttribute("imageList",imageList);
	      
	      UserVo voforguest = new UserVo();

	      voforguest.setUser_id("guest");

	      session.setAttribute("thisid", voforguest.getUser_id());


	      return "main";
	   }


	
	@RequestMapping("Test32")
	@ResponseBody
	public List<SightVo> test32(String tloc_Lng) throws IOException {

		
		List<SightVo> sightView = sightService.getSightView(tloc_Lng);
		
		return sightView;
	}
	
	@RequestMapping("Test33")
	@ResponseBody
	public List<FestivalVo> test33(String sloc_Lng) throws IOException {
		
		List<FestivalVo> festivalView = festivalService.getFestivalView(sloc_Lng);

		
		return festivalView;
	}
	
	@RequestMapping("Test34")
	@ResponseBody
	public List<AllfsVo> test34(String totloc_Lng) throws IOException {

		
		List<AllfsVo> allfsView= allfsService.getAllfsView(totloc_Lng);
		System.out.println(allfsView);

		
		return allfsView;
	}
	
	
	
	
	@RequestMapping("/Recog")
	public  String  recommendation() {		
		return "recommendation";		
	}
	
	
	@RequestMapping("/Main")
	public ModelAndView list() {

		ModelAndView mv = new ModelAndView();
		
		//top 여행지 위한 명소리스트 조회		
		List<SightVo> sightList = sightService.getSightList(); //1~3
		List<SightVo> sightList2 = sightService.getSightList2(); //4~6

		//top 여행지 위한 이미지 조회		
		List<ImageVo> imageList = imageService.getImageList();
	
		
		mv.setViewName("main");
		mv.addObject("sightList",sightList);
		mv.addObject("sightList2",sightList2);
		mv.addObject("imageList",imageList);
		return mv;	
	}



	
	@RequestMapping("/service")
	@ResponseBody
	public  void  serviceData(String keyword, HttpServletResponse response) {
		try {
			String  json = wapiService.search(keyword, 7, 1 );
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out  = response.getWriter();
			out.print( json );
			System.out.println(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	



	
	@RequestMapping("/Randomdice")   //랜덤페이지 추천 
	   public String Rand(int s_code) throws Exception {   
		String obj = null;
	     if(s_code == 0) { obj = "culture/culture02"; return obj ;  }
	     if(s_code == 1) { obj = "culture/culture03"; return obj ;  }
	     if(s_code == 2) { obj = "culture/culture01"; return obj ;  }
	     if(s_code == 3) { obj = "history/history02"; return obj ;  }
	     if(s_code == 4) { obj = "history/history03"; return obj ;  }
	     if(s_code == 5) { obj = "history/history01"; return obj ;  }
	     if(s_code == 6) { obj = "nature/nature02";	 return obj ;  }
	     if(s_code == 7) { obj = "nature/nature03";  return obj ;  }
	     if(s_code == 8) { obj = "nature/nature01";	 return obj ;  }
	     if(s_code == 9) { obj = "park/park02";	 return obj ;  }
	     if(s_code == 10) { obj = "park/park03";	 return obj ;  }
	     if(s_code == 11) { obj = "park/park01";	 return obj ;  }



	      
	      
	      
		return obj; 
		}
	
	
	@RequestMapping("/Gohistory")
	public String goHistory() {

		return "history/history01";
	}
	
	@RequestMapping("/Gonature")
	public String goNature() {

		return "nature/nature01";
	}
	
	@RequestMapping("/Goculture")
	public String goCulture() {

		return "culture/culture01";
	}
	
	@RequestMapping("/Gopark")
	public String goPark() {
		return "park/park01";
	}
	
	
//	//명소전체보기
//		@RequestMapping("/Sight") 
//		public String sight(Model model) {
//			
//		List<SightVo> sightTable = sightService.getSightTable();
//		
//
//		model.addAttribute("sightTable",sightTable);
//	
//		System.out.println("sightTable"+model);
//		
//		
//		return "sight";
//			
//		}
	
	
	
	    //페이징 기능으로 목록을 보여주는 메서드
		@RequestMapping("/Sight")
		public String listPage(Criteria cri, Model model) throws Exception{
			
			System.out.println("cri");
			//현재 페이지에 해당하는 명소 조회해 옴
			List<SightVo> listPage = sightService.listPage(cri);
			//PageMaker 객체 생성
			PageMaker pageMaker = new PageMaker(cri);
			//전체 게시물 
			int getTotalCount = sightService.getTotalCount(cri);
			//pageMaker로 전달 ->pageMaker는 startPage,endPage,prev,next를 계산
			pageMaker.setTotalDataCount(getTotalCount);
		
			System.out.println("페이징한 결과1"+listPage);
			System.out.println("게시물 갯수"+getTotalCount);
			
			
		
			model.addAttribute("list",listPage);
			model.addAttribute("pageMaker",pageMaker);
			
			return "sight";
		}
		
		
		//페이징 기능으로 축제전체보기
		@RequestMapping("/Festival") 
		public String festival(Criteria cri, Model model)throws Exception {
			//현재 페이지에 해당하는 명소 조회해 옴
			List<FestivalVo> festivalTable = festivalService.getFestivalTable(cri);
			//PageMaker 객체 생성
			PageMaker pageMaker = new PageMaker(cri);
			//전체 게시물 
			int getTotalCount = festivalService.getTotalCount(cri);
			//pageMaker로 전달 ->pageMaker는 startPage,endPage,prev,next를 계산
			pageMaker.setTotalDataCount(getTotalCount);
		
			System.out.println("페이징한 결과1"+festivalTable);
			System.out.println("게시물 갯수"+getTotalCount);
			
			
			model.addAttribute("festivalTable",festivalTable);
			model.addAttribute("pageMaker",pageMaker);

			System.out.println(model);

			return "festival";
			
		}
//		//축제전체보기
//		@RequestMapping("/Festival") 
//		public String festival(Model model) {
//			List<FestivalVo> festivalTable = festivalService.getFestivalTable();
//			
//			model.addAttribute("festivalTable",festivalTable);
//			
//			return "festival";
//			
//		}
		
		// /Info?s_code=6014 //사이트상세보기 (조회수 증가 &데이터 불러오기)
		@RequestMapping("/Info")
		public  String   info(int s_code,Model model) {
			//조회수 증가
			sightService.sightReadCntUpdate(s_code);
			//데이터 불러오기
			SightVo  sightvo = sightService.getSightInfoList( s_code );
			model.addAttribute("scode", s_code);
			model.addAttribute("vo", sightvo);
			return "info";
		}
		
		
		@RequestMapping("/InfoFes")
		public  String   infofes(int f_code,Model model) {
			System.out.println("dkl;lakn;f;;vlkana");
			//데이터 불러오기
			FestivalVo  festivalvo = festivalService.getFestivalInfoList( f_code );
			model.addAttribute("fcode", f_code);
			model.addAttribute("vo", festivalvo);
			return "infofes";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//----------------------VisitBusan Redirect------------------------------------------------------------------------
	    // return string
	    @GetMapping("/ex_redirect1")
	    public String exRedirect1() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1313&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect2")
	    public String exRedirect2() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1309&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }         
	    @GetMapping("/ex_redirect3")
	    public String exRedirect3() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1200&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect4")
	    public String exRedirect4() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1196&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect5")
	    public String exRedirect5() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1061&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect6")
	    public String exRedirect6() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1025&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect7")
	    public String exRedirect7() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1020&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect8")
	    public String exRedirect8() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=997&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect9")
	    public String exRedirect9() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=321&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect10")
	    public String exRedirect10() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=320&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect11")
	    public String exRedirect11() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=322&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2a36ac8c1113cb52963680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect12")
	    public String exRedirect12() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1217&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2ab29f1e624c4755013680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect13")
	    public String exRedirect13() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=1211&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2ab29f1e624c4755013680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect14")
	    public String exRedirect14() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=391&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2ab29f1e624c4755013680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    @GetMapping("/ex_redirect15")
	    public String exRedirect15() {
	        return "redirect:https://visitbusan.net/index.do?menuCd=DOM_000000202012001000&uc_seq=392&lang_cd=ko&pagingParms=4ca15f3a76a21f554a6e515f5344f50c4f734814d27260977c0eb574b1e0019a33f5a8e2dd587a9efb82cc91cf112987488312a3bc08c3054da8c190c930f6592e7894a7ed3cf424f38839c4d67c42230aa608ee54ad79feb8b43e0becf2aedf306446a26175f37928b2e64d297ab48f8acfae3743ce2794ef15d99eb793341329c53a76d24a81ef72a11ca917970aac34400ec0365d93e364d7a859d58178e212648c28901350cb20330ec09b4e8c7ee5e2b8287a2a6536a889e832bf7d31f847bff6a467836ed9d75537b39410af39627c2b313731ee41b00d9fccef0048ec6242d2505ff463a634757c4ad1fb5316c17e3c6c881b1202936a9591f574a9b458fe7ada378c8e24a939d38009efceb2f1d2f3d9fb0a84335999d70d74a175a02229fcd269f25ecae09cba47d7fa5b4ca79471889a1020e6226a199377b97ead69d777bcce27c101be7225c1ffeb0036367494277c22e6ec9cff0114e7cadf3a2d867367262d1b5f6a717ace24b4cae0734d3410c3de7cbbe8e8e2de4a08c9f7f2d71419b760deedc85bfd092d20cf83296e62049d974032c50fee7f8aa0e20719104acb04653baae653f6241ef307d9e996ca01c0f8bd82711f4350a45a2e2ab29f1e624c4755013680de63b1ecd3527d5977f1be115b1d7625793d50b5c5826ff8b542602bf079c990e1d79101c00403fccdd8d0f971fdfaabfea64a12ae224bda45a84ac12ddec529db042b1af54b0e8d8fa690264dd7f528556d5991d238682cf605701f444b523f98263f27eb547d606cb13013f4684fb8e096d227c5175d8415beb6db12667590c88bf3612df221ded307eae24bddc823ef3f4706034fef77bd3f69379171";
	    }
	    
	    
	//----------------------VisitBusan Redirect--------------------------------------------------------------------- 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


	
}
