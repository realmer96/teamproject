package teamproject.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.dto.CartDB;
import teamproject.dto.OrderDB;
import teamproject.service.CartDBService;
import teamproject.service.OrderDBService;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderDBService orderdbService;
	
	@Resource
	private CartDBService cartdbService;
	
	@PostMapping("/")
	public String order(OrderDB order, HttpSession session, Model model) {
		CartDB cart = new CartDB();
		cart.setUserid((String)session.getAttribute("sessionUserid"));
		if(cart.getUserid()==null) {
			return "redirect:/order/noId";
		}
		cart.setCartcolor(order.getOrderColor());
		cart.setCartsize(order.getOrderSize());
		cart.setCartcount(order.getOrderCount());
		cart.setProductcode(order.getProductCode());
		cartdbService.addCart(cart);
		int cartcode = cart.getCartcode();
		List<CartDB> carts = new ArrayList<>();
		carts.add(cart);
		cartdbService.orderFromCarts(carts);
		return "redirect:/mypage/orderlist";
	}
	@PostMapping("/cart")
	public String orderCart(OrderDB order, HttpSession session, Model model) {
		CartDB cart = new CartDB();
		cart.setUserid((String)session.getAttribute("sessionUserid"));
		if(cart.getUserid()==null) {
			return "redirect:/order/noId";
		}
		cart.setCartcolor(order.getOrderColor());
		cart.setCartsize(order.getOrderSize());
		cart.setCartcount(order.getOrderCount());
		cart.setProductcode(order.getProductCode());
		cartdbService.addCart(cart);
		return "redirect:/cart";
	}
	@RequestMapping("/noId")
	public void noId(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('로그인을 확인해주세요.');" + "location.href='../login';</script>");
		pw.flush();
	}
}
