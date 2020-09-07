package ptithcm.controller;

import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.Cart;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import ptithcm.entity.ChiTietDatHang;
import ptithcm.entity.DatHang;
import ptithcm.entity.HangHoa;
import ptithcm.entity.LoaiHang;
import ptithcm.entity.ThongTinUser;
import ptithcm.entity.UserID;

@Transactional
@Controller
@RequestMapping("/user/")
public class OrderController {
	@Autowired
	SessionFactory factory;

	@Autowired
	JavaMailSender mailer;

	/*
	 * @Autowired Mailer mailer;
	 */

	Date date = new Date();

	// lấy danh sách sản phẩm
	@SuppressWarnings("unchecked")
	public List<HangHoa> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HangHoa";
		Query query = session.createQuery(hql);
		List<HangHoa> list = query.list();
		return list;
	}

	// load danh sách hãng xe ra combobox
	@ModelAttribute("brand")
	public List<LoaiHang> getBrands() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiHang";
		Query query = session.createQuery(hql);
		List<LoaiHang> list = query.list();
		return list;
	}

	// @RequestMapping(value = "buynow/{id}", method = RequestMethod.GET)
	// public String buyNow(ModelMap model, @PathVariable("id") Integer id,
	// HttpServletRequest req) {
	// HttpSession user_session = req.getSession();
	// user_session.getAttribute("user");
	// if (user_session.getAttribute("user") == null) {
	// return "redirect:/user/login.htm";
	// }
	// Session session = factory.getCurrentSession();
	// HangHoa product = (HangHoa) session.get(HangHoa.class, id);
	//
	// model.addAttribute("product", product);
	//// model.addAttribute("order", new DatHang());
	// return "user/order";
	// }

	@RequestMapping(value = "buynow", method = RequestMethod.GET)
	public String buyNow(ModelMap model, HttpSession session, HttpServletRequest request) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("cart");

		HttpSession user_session = request.getSession();
		// UserID user = (UserID) user_session.getAttribute("user");
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLsogin", true);
		}
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.isEmpty()) {
			model.addAttribute("message", "Không có sản phẩm nào trong giỏ hàng của bạn");
		} else {
			session.setAttribute("totalprice", totalPrice(cartItems));
			session.setAttribute("cart", cartItems);

		}
		for (Entry<Integer, Cart> entry1 : cartItems.entrySet()) {
			if (entry1.getValue().getQuantity() > entry1.getValue().getProduct().getIn_stock()) {
				model.addAttribute("message", "Sản phẩm ' " + entry1.getValue().getProduct().getName() + " ' "
						+ " không đủ số lượng để đặt!");
				return "user/buynow";
			}
		}
		model.addAttribute("order", new DatHang());
		return "user/buynow";
	}

	@RequestMapping(value = "buynow", method = RequestMethod.POST)
	public String buyNow(ModelMap model, HttpSession session, @ModelAttribute("order") DatHang order,
			HttpServletRequest request, ChiTietDatHang detail_order) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("cart");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}

//		boolean check = false;
		String payment = request.getParameter("payment");
		String message = request.getParameter("message");
//		System.out.println(payment);
		// kiểm tra session user
		HttpSession user_session = request.getSession();
		UserID user = (UserID) user_session.getAttribute("user");

		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLsogin", true);
		}
		// Thông tin gửi mail
		String from = "n16dccn055@student.ptithcm.edu.vn";
		String subject = "ĐƠN ĐẶT HÀNG CỦA BẠN!";
		String body = "";
		String to = user.getThongtinuser().getEmail();
		MimeMessage mail = mailer.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail);

		// kiểm tra số lượng số lượng khách đặt so với số lượng tồn
		for (Entry<Integer, Cart> entry1 : cartItems.entrySet()) {
			if (entry1.getValue().getQuantity() > entry1.getValue().getProduct().getIn_stock()) {
				model.addAttribute("message", "Sản phẩm ' " + entry1.getValue().getProduct().getName() + " ' "
						+ " không đủ số lượng để đặt!");
				return "user/buynow";
			}
		}
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		order.setStatus_payment(false);
		order.setStatus_delivery(1);
		order.setCreated(new Date());
		order.setMessage(message);
		order.setAmount(totalPrice(cartItems));
		order.setUserid(user);
		if (payment.equals("offline")) {
			order.setPayment("1");
		} else {
			order.setPayment("2");
		}
		try {
			session1.save(order);
			// Lưu thông tin từng sản phẩm
			for (Entry<Integer, Cart> entry : cartItems.entrySet()) {
				body += "Chi tiết đơn hàng của bạn " + "\n" + "Tên sản phẩm: " + entry.getValue().getProduct().getName()
						+ "\n" + "Số lượng: " + entry.getValue().getQuantity() + " || " + "Giá: "
						+ entry.getValue().getProduct().getPrice() * (100 - entry.getValue().getProduct().getDiscount())
								/ 100
						+ "VNĐ" + "\n";

				detail_order = new ChiTietDatHang();
				detail_order.setDathangs(order);
				detail_order.setHanghoas(entry.getValue().getProduct());
				detail_order.setQty(entry.getValue().getQuantity());
				session1.save(detail_order);

				// update số lượng bán và trừ số lượng tồn
				String hql = "UPDATE HangHoa SET count_buy = count_buy + (:countbuy), "
						+ "in_stock= in_stock-(:countbuy) WHERE id = :id";
				Query query = session1.createQuery(hql);
				query.setParameter("countbuy", entry.getValue().getQuantity());
				query.setParameter("id", entry.getValue().getProduct().getId());
				int result = query.executeUpdate();
				System.out.println(result);
			}

			// gửi mail
			body += "Tổng tiền: " + order.getAmount() + " VNĐ " + "\n" + "Ngày đặt: " + order.getCreated() + "\n"
					+ "Hình thức thanh toán: " + order.getPayment() + "\n " + "Tên khách hàng: "
					+ user.getThongtinuser().getFullname() + " || " + "Số điện thoại: "
					+ user.getThongtinuser().getSdt() + " || " + "Địa chỉ giao hàng: "
					+ user.getThongtinuser().getAddress() + "\n" + "Ghi chú: " + order.getMessage() + "\n"
					+ "SHOWROOM Nội Thất & Thiết Bị Vệ Sinh TATA xin cảm ơn !";
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body);
			mailer.send(mail);
			// model.addAttribute("message", "Đặt hàng thành công !");
			t.commit();
			// xóa sản phẩm khỏi giỏ hàng
			cartItems = new HashMap<>();
			session.setAttribute("cart", cartItems);
			session.setAttribute("totalprice", 0);
			return "redirect:/user/success.htm";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Đặt hàng thất bại !");
		} finally {
			session1.close();
		}

		return "user/buynow";

	}

	// =======XÁC NHẬN THÔNG TIN GIAO HÀNG========
	@RequestMapping("confirmInfo/{id}")
	public String confirmInfo(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		HttpSession user_session = request.getSession();
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/index.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}

		Session session1 = factory.getCurrentSession();
		ThongTinUser infouser = (ThongTinUser) session1.get(ThongTinUser.class, id);

		if (infouser.getSdt().equals("") || infouser.getAddress().equals("") || infouser.getEmail().equals("")
				|| infouser.getFullname().equals("")) {

			model.addAttribute("message", "Vui lòng cập nhật đủ thông tin trước khi đặt hàng");

		}

		model.addAttribute("infouser", infouser);
		return "user/confirmInfo";
	}

	// // =======XÁC NHẬN THÔNG TIN GIAO HÀNG========
	// @RequestMapping("confirmInfo/{id}")
	// public String confirmInfoGet(ModelMap model, @PathVariable("id") Integer
	// id, HttpServletRequest request,
	// HttpServletResponse response, HttpSession session) {
	//
	// HttpSession user_session = request.getSession();
	// user_session.getAttribute("user");
	// if (user_session.getAttribute("user") == null) {
	// return "redirect:/user/index.htm";
	// }
	// if (user_session.getAttribute("user") == null) {
	// model.addAttribute("isLogin", false);
	// }
	// if (user_session.getAttribute("user") != null) {
	// model.addAttribute("isLogin", true);
	// }
	//
	// Session session1 = factory.getCurrentSession();
	// ThongTinUser infouser = (ThongTinUser) session1.get(ThongTinUser.class,
	// id);
	//
	// if (infouser.getSdt().equals("") || infouser.getAddress().equals("") ||
	// infouser.getEmail().equals("")
	// || infouser.getFullname().equals("")) {
	//
	// model.addAttribute("message", "Vui lòng cập nhật đủ thông tin trước khi
	// đặt hàng");
	//
	// }
	//
	// model.addAttribute("infouser", infouser);
	// return "user/confirmInfo";
	// }

	// @RequestMapping(value= "confirmInfo/{id}", method= RequestMethod.POST)
	// public String confirmInfo(ModelMap model, @PathVariable("id") Integer id,
	// HttpServletRequest request, HttpServletResponse response, HttpSession
	// session) {
	// HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)
	// session.getAttribute("cart");
	//
	// if (cartItems == null) {
	// cartItems = new HashMap<>();
	// }
	//
	// for(Entry<Integer, Cart> entry : cartItems.entrySet()){
	// String number = request.getParameter("number");
	// int number_product = Integer.valueOf(number);
	// String id_product = request.getParameter("id");
	// int id_sp = Integer.valueOf(id_product);
	//// System.out.println(number_product);
	//// System.out.println(id_sp);
	//
	// HangHoa product = getHH(id_sp);
	// if (cartItems.containsKey(id_sp)) {
	// Cart item = cartItems.get(id_sp);
	// item.setProduct(product);
	// item.setQuantity(number_product);
	// item.setTotalPrice((product.getPrice() * (100 - product.getDiscount()) /
	// 100) * number_product);
	// cartItems.put(id_sp, item);
	// }
	// }
	//
	// HttpSession user_session = request.getSession();
	// user_session.getAttribute("user");
	// if(user_session.getAttribute("user") == null) {
	// return "redirect:/user/index.htm";
	// }
	// if(user_session.getAttribute("user") == null) {
	// model.addAttribute("isLogin", false);
	// }
	// if(user_session.getAttribute("user") != null) {
	// model.addAttribute("isLogin", true);
	// }
	//
	// Session session1 = factory.getCurrentSession();
	// ThongTinUser infouser = (ThongTinUser) session1.get(ThongTinUser.class,
	// id);
	//
	// if(infouser.getSdt().equals("") || infouser.getAddress().equals("")
	// || infouser.getEmail().equals("") || infouser.getFullname().equals("")){
	// model.addAttribute("message", "Vui lòng cập nhật đủ thông tin trước khi
	// đặt hàng");
	// }
	// session.setAttribute("totalprice", totalPrice(cartItems));
	// session.setAttribute("cart", cartItems);
	// model.addAttribute("infouser", infouser);
	// return "user/confirmInfo";
	// }

	// =========QUẢN LÝ ĐƠN HÀNG============
	@RequestMapping(value = "mycart")
	public String viewMyCart(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession user_session = request.getSession();
		UserID userid = (UserID) user_session.getAttribute("user");
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}

		model.put("order", getListNav(0, 5, userid.getUsername()));
		model.put("totalitem", totalItem(userid.getUsername()) / 5);

		return "user/mycart";
	}

	@RequestMapping(value = "mycart/{page}", method = RequestMethod.GET)
	public String viewMyCartListByPage(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("page") int page) {
		HttpSession user_session = request.getSession();
		UserID userid = (UserID) user_session.getAttribute("user");
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}

		model.put("order", getListNav((page - 1) * 5, 5, userid.getUsername()));
		model.put("totalitem", totalItem(userid.getUsername()) / 5);

		return "user/mycart";
	}

	@RequestMapping(value = "detailMycart/{id}")
	public String detailMyCart(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request) {

		HttpSession user_session = request.getSession();
		UserID userid = (UserID) user_session.getAttribute("user");
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}
		Session session = factory.getCurrentSession();
		 DatHang order = (DatHang) session.get(DatHang.class, id);
		 List<ChiTietDatHang> list = (List<ChiTietDatHang>) order.getDetail_order();
//		 System.out.println(order.getDetail_order().toString());
//		String hql = "FROM ChiTietDatHang WHERE dathang_id = :id";
//		Query query = session.createQuery(hql);
//		query.setParameter("id", id);
		// System.out.println(id);
		// System.out.println(hql);
//		List<ChiTietDatHang> list = query.list();
		model.addAttribute("detail_order", list);
		return "user/detailMycart";
	}

	// ======HỦY ĐƠN HÀNG======
	// Xóa sản phẩm
	@RequestMapping("delete/{id}")
	public String cancelOrder(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest req,
			HttpServletResponse response) {

		HttpSession user_session = req.getSession();
		user_session.getAttribute("user");
		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}

		Session session = factory.openSession();
		DatHang order = (DatHang) session.get(DatHang.class, id);
		List<ChiTietDatHang> list = (List<ChiTietDatHang>) order.getDetail_order();
		date = order.getCreated();
		Transaction t = session.beginTransaction();

		Session session1 = factory.getCurrentSession();
//		String hql = "FROM ChiTietDatHang WHERE dathang_id = :id";
//		Query query = session1.createQuery(hql);
//		query.setParameter("id", order.getId());
//		List<ChiTietDatHang> list = query.list();
		for (int i = 0; i < list.size(); i++) {
			String hql1 = "UPDATE HangHoa SET count_buy = count_buy - (:countbuy), in_stock= in_stock +(:countbuy) WHERE id = :id";
			Query query1 = session1.createQuery(hql1);
			query1.setParameter("countbuy", list.get(i).getQty());
			query1.setParameter("id", list.get(i).getHanghoas().getId());
			int result = query1.executeUpdate();
		}
		// System.out.println(id);
		order.setStatus_delivery(5);
		order.setCreated(date);
		try {
			session.update(order);
			t.commit();
			// model.addAttribute("message", "Hủy đơn thành công !");
			// showAlert("Hủy đơn thành công");
			return "redirect:/user/mycart.htm";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Hủy đơn thất bại !");
		} finally {
			session.close();
		}

		model.addAttribute("order", order);
		return "user/detailMycart";
	}

	// @RequestMapping(value = "delete", method = RequestMethod.POST)
	// public String cancelOrder(ModelMap model, HttpServletRequest req,
	// @ModelAttribute("order") DatHang order) {
	// HttpSession user_session = req.getSession();
	// user_session.getAttribute("user");
	// if (user_session.getAttribute("user") == null) {
	// return "redirect:/user/login.htm";
	// }
	// if (user_session.getAttribute("user") == null) {
	// model.addAttribute("isLogin", false);
	// }
	// if (user_session.getAttribute("user") != null) {
	// model.addAttribute("isLogin", true);
	// }
	// Session session1 = factory.getCurrentSession();
	// String hql = "FROM ChiTietDatHang WHERE dathang_id = :id";
	// Query query = session1.createQuery(hql);
	// query.setParameter("id", order.getId());
	// List<ChiTietDatHang> list = query.list();
	// for (int i = 0; i < list.size(); i++) {
	// String hql1 = "UPDATE HangHoa SET count_buy = count_buy - (:countbuy),
	// in_stock= in_stock +(:countbuy) WHERE id = :id";
	// Query query1 = session1.createQuery(hql1);
	// query1.setParameter("countbuy", list.get(i).getQty());
	// query1.setParameter("id", list.get(i).getHanghoas().getId());
	// int result = query1.executeUpdate();
	// }
	//
	// order.setStatus_delivery(5);
	// order.setCreated(date);
	// Session session = factory.openSession();
	// Transaction t = session.beginTransaction();
	// try {
	// session.update(order);
	// t.commit();
	// // JOptionPane.showMessageDialog(null, "Hủy đơn thành công");
	// model.addAttribute("message", "Hủy đơn thành công !");
	// // showAlert("Hủy đơn thành công");
	// return "redirect:/user/mycart.htm";
	// } catch (Exception e) {
	// t.rollback();
	// model.addAttribute("message", "Hủy đơn thất bại !");
	// } finally {
	// session.close();
	// }
	// return "user/delete";
	// }

	public long totalPrice(HashMap<Integer, Cart> cartItems) {
		int count = 0;
		for (Entry<Integer, Cart> list : cartItems.entrySet()) {
			count += (list.getValue().getProduct().getPrice() * (100 - list.getValue().getProduct().getDiscount())
					/ 100) * list.getValue().getQuantity();
		}
		return count;
	}

	@RequestMapping("success")
	public String successOrder(ModelMap model, HttpServletRequest request) {
		HttpSession user_session = request.getSession();

		if (user_session.getAttribute("user") == null) {
			return "redirect:/user/index.htm";
		}
		if (user_session.getAttribute("user") == null) {
			model.addAttribute("isLogin", false);
		}
		if (user_session.getAttribute("user") != null) {
			model.addAttribute("isLogin", true);
		}

		return "user/success";
	}

	public int totalItem(String id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM DatHang WHERE id_khachhang = :idKH");
			query.setParameter("idKH", id);
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	public List<DatHang> getListNav(int start, int limit, String id) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM DatHang WHERE id_khachhang = :idKH ORDER BY id DESC");
			query.setParameter("idKH", id);
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<DatHang> list = query.list();
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public HangHoa getHH(int productId) {
		Session session = factory.openSession();
		String hql = "FROM HangHoa WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", productId);
		HangHoa hh = (HangHoa) query.uniqueResult();

		return hh;
	}

}
