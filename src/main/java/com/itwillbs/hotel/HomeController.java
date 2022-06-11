package com.itwillbs.hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {

		return "main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String gotoIndex() {

		return "main";
	}


	@RequestMapping(value = "/sub/facilities", method = RequestMethod.GET)
	public String facilities() {

		return "sub/facilities";
	}

	// 부가시설 - 미팅
	@RequestMapping(value = "/sub/meeting", method = RequestMethod.GET)
	public String meeting() {
		return "sub/facilities_meeting";
	}

	// 부가시설 - 웨딩
	@RequestMapping(value = "/sub/wedding", method = RequestMethod.GET)
	public String wedding() {
		return "sub/facilities_wedding";
	}

	// 부가시설 - 플라워샵
	@RequestMapping(value = "/sub/flowerShop", method = RequestMethod.GET)
	public String flowerShop() {
		return "sub/facilities_flowerShop";
	}

	// 부가시설 - 비즈니스
	@RequestMapping(value = "/sub/business", method = RequestMethod.GET)
	public String business() {
		return "sub/facilities_business";
	}

	// 부가시설 - 바
	@RequestMapping(value = "/sub/bar", method = RequestMethod.GET)
	public String bar() {
		return "sub/facilities_bar";
	}

	// 부가시설 - 브런치카페
	@RequestMapping(value = "/sub/brunchCafe", method = RequestMethod.GET)
	public String brunchCafe() {
		return "sub/facilities_brunchCafe";
	}

//	@RequestMapping(value = "/sub/notice", method = RequestMethod.GET)
//	public String notice() {
//
//		return "sub/notice";
//	}
//
//	@RequestMapping(value = "/sub/faq", method = RequestMethod.GET)
//	public String faq() {
//
//		return "sub/faq";
//	}
//
//	@RequestMapping(value = "/sub/qna", method = RequestMethod.GET)
//	public String qna() {
//
//		return "sub/qna";
//	}

	@RequestMapping(value = "/sub/location", method = RequestMethod.GET)
	public String location() {

		return "sub/location";
	}

//	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
//	public String login() {
//		
//		return "member/login";
//	}

//	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
//	public String join() {
//		
//		return "member/join";
//	}

//	@RequestMapping(value = "/member/myReservation", method = RequestMethod.GET)
//	public String myReservation() {
//
//		return "member/myReservation";
//	}

//	@RequestMapping(value = "/admin/adminPage", method = RequestMethod.GET)
//	public String adminPage() {
//
//		return "admin/adminPage";
//	}

}
