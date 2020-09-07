package ptithcm.controller;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.MyItem;
import ptithcm.entity.ChiTietDatHang;
import ptithcm.entity.DatHang;
import ptithcm.entity.HangHoa;
import ptithcm.entity.UserID;

@Transactional
@Controller
@RequestMapping("/admin/order/")
public class AdminOrderController {
	@Autowired
	SessionFactory factory;

	Date date = new Date();

	// ============TÌM KIẾM THÔNG TIN ĐƠN HÀNG=======
	// tìm kiếm thông tin mã đơn hàng
	@RequestMapping("search")
	public String searchOrder(ModelMap model, HttpServletRequest req, HttpServletResponse response) {

		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		String keyword = req.getParameter("search").trim();
		
		while (keyword.indexOf(" ") != -1) {
			keyword = keyword.replaceAll(" ", "");
		}
		System.out.println(keyword);
		
		Session session = factory.getCurrentSession();
		String hql = "FROM DatHang WHERE dbo.ufn_removeMark(id) LIKE '%" + keyword + "%'";
		Query query = session.createQuery(hql);
		List<DatHang> list = query.list();

		if (list.isEmpty()) {
			model.addAttribute("message", "Không có kết quả !");
		} else {
			model.addAttribute("order", list);
		}

		return "order/search";
	}

	// tìm kiếm thông tin trạng thái đơn hàng
	@RequestMapping("searchStatus")
	public String searchByStatus(ModelMap model, HttpServletRequest req, HttpServletResponse response) {

		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		String status = req.getParameter("status");
		int status_delivery = Integer.parseInt(status);
		Session session = factory.getCurrentSession();
		String hql = "FROM DatHang WHERE status_delivery = :status";
		Query query = session.createQuery(hql);
		query.setParameter("status", status_delivery);
		List<DatHang> list = query.list();

		if (list.isEmpty()) {
			model.addAttribute("message", "Không có kết quả !");
		} else {
			model.addAttribute("order", list);
		}
		
		return "order/searchStatus";
	}

	// =====XEM CHI TIẾT TỪNG ĐƠN HÀNG
	@RequestMapping(value = "detailOrder/{id}")
	public String detailOrder(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest req,
			HttpServletResponse response) {
		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		Session session = factory.getCurrentSession();
		 DatHang order = (DatHang) session.get(DatHang.class, id);
		 List<ChiTietDatHang> list = (List<ChiTietDatHang>) order.getDetail_order();
//		String hql = "FROM ChiTietDatHang WHERE dathang_id = :id";
//		Query query = session.createQuery(hql);
//		query.setParameter("id", id);
//		List<ChiTietDatHang> list = query.list();
		model.addAttribute("detail_order", list);

		return "order/detailOrder";
	}

	// ============XỬ LÝ ĐƠN HÀNG===========
	@RequestMapping("update/{id}")
	public String updateOrder(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest req,
			HttpServletResponse response, HttpSession ss) {

		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		Session session = factory.getCurrentSession();
		DatHang order = (DatHang) session.get(DatHang.class, id);

		date = order.getCreated();
		model.addAttribute("order", order);
		return "order/update";
	}

	@RequestMapping("update")
	public String updateOrder(ModelMap model, @ModelAttribute("order") DatHang order, BindingResult errors,
			HttpServletRequest req, HttpSession ss) {
		
		String status = req.getParameter("status");

		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
//		UserID user = (UserID) admin_session.getAttribute("user");
		
		if (errors.hasErrors()) {

		} else {
			if (Integer.parseInt(status) == 4) {
				order.setStatus_payment(true);
			}
			if (Integer.parseInt(status) == 2 || Integer.parseInt(status) == 3 || Integer.parseInt(status) == 4) {
				order.setUserid1(user);
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
//				order.setUserid1(user);
				order.setStatus_delivery(Integer.parseInt(status));
				if(Integer.parseInt(status) == 5){
					List<ChiTietDatHang> list = (List<ChiTietDatHang>) order.getDetail_order();
					Session session1 = factory.getCurrentSession();
//					String hql = "FROM ChiTietDatHang WHERE dathang_id = :id";
//					Query query = session1.createQuery(hql);
//					query.setParameter("id", order.getId());
//					List<ChiTietDatHang> list = query.list();
					for (int i = 0; i < list.size(); i++) {
						String hql1 = "UPDATE HangHoa SET count_buy = count_buy - (:countbuy), in_stock= in_stock +(:countbuy) WHERE id = :id";
						Query query1 = session1.createQuery(hql1);
						query1.setParameter("countbuy", list.get(i).getQty());
						query1.setParameter("id", list.get(i).getHanghoas().getId());
						int result = query1.executeUpdate();
					}
				}
				order.setCreated(date);
				session.update(order);
				t.commit();
				model.addAttribute("message", "Cập nhật thành công !");
				return "redirect:/admin/admin-home.htm";
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Cập nhật thất bại !");
			} finally {
				session.close();
			}
		}

		return "order/update";
	}

	// ============THỐNG KÊ DOANH THU=============
	@RequestMapping(value = "indexCount")
	public String indexCount(ModelMap model, HttpServletRequest req, HttpServletResponse response) {
		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		Session session = factory.getCurrentSession();
		Date cur = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
		String date = formatter2.format(cur);
		String hql = "SELECT SUM(amount) FROM DatHang WHERE created = :date " + "AND status_payment = 'true'";
		Query query = session.createQuery(hql);
		query.setDate("date", cur);

		model.addAttribute("date", date);
		model.addAttribute("count", query.uniqueResult());

		return "order/indexCount";
	}

	@RequestMapping(value = "count")
	public String count(ModelMap model, HttpServletRequest req, HttpServletResponse response) {
		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("user");
		if (admin_session.getAttribute("user") == null) {
			return "redirect:/admin/index.htm";
		}
		UserID user = (UserID) admin_session.getAttribute("user");
		if (user.getRole().getId() == 1) {
			return "redirect:/admin/index.htm";
		}
		Date date1 = new Date();
		Date date2 = new Date();

		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
		String var_date1 = req.getParameter("date1");
		String var_date2 = req.getParameter("date2");
		if (var_date1.equals("")) {
			model.addAttribute("message", "Vui lòng chọn ngày thống kê!");
		}
		if (var_date2.equals("")) {
			model.addAttribute("message", "Vui lòng chọn ngày thống kê!");
		} else {
			try {
				date1 = formatter2.parse(var_date1);
				date2 = formatter2.parse(var_date2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//
//			GregorianCalendar cal_date1 = new GregorianCalendar();
//			GregorianCalendar cal_date2 = new GregorianCalendar();
//			cal_date1.setTime(date1);
//			cal_date2.setTime(date2);
//			System.out.println(formatter2.format(date1));
//			System.out.println(formatter2.format(date2));
			if (date1.after(date2)) {
				model.addAttribute("message", "Ngày kết thúc phải lớn hơn ngày bắt đầu");
				return "order/indexCount";
			} else if (date1.before(date2)) {
				Session session = factory.openSession();
				List<MyItem> reportOrder = new ArrayList<>();
				while (date1.before(date2) || date1.equals(date2)) {
					int i = 1;
					Date tmp = date1;
					MyItem myItem = new MyItem();
					myItem.setTime(formatter2.format(tmp));
					Query query = session.createQuery("SELECT ISNULL(SUM(amount), 0) FROM DatHang WHERE created =:date"
							+ " AND status_payment = 'true'");
					query.setDate("date", tmp);
					myItem.setValue((long) query.uniqueResult());
					reportOrder.add(myItem);
					date1 = addDays(date1, i);
//					System.out.println(formatter2.format(date1));
				}
				model.addAttribute("report", reportOrder);
				return "order/count";
			} else {
				model.addAttribute("message", "Ngày kết thúc phải lớn hơn ngày bắt đầu");
				return "order/indexCount";
			}
		}
		return "order/indexCount";
	}

	// load danh sách Nhân Viên đơn hàng ra combobox
	@ModelAttribute("employee")
	public List<UserID> getEmployee() {
		Session session = factory.getCurrentSession();
		String hql = "FROM UserID WHERE role_id = 2";
		Query query = session.createQuery(hql);
		List<UserID> list = query.list();
		return list;
	}

	public int totalItem() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM DatHang");
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

	public List<DatHang> getListNav(int start, int limit) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM DatHang ORDER BY created DESC");
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

	// public List<MyItem> report(Date date1, Date date2) {
	// GregorianCalendar cal_date1 = new GregorianCalendar();
	// GregorianCalendar cal_date2 = new GregorianCalendar();
	// cal_date1.setTime(date1);
	// cal_date2.setTime(date2);
	// int day1 = cal_date1.get(Calendar.DAY_OF_MONTH);
	// int day2 = cal_date2.get(Calendar.DAY_OF_MONTH);
	// List<MyItem> list = new ArrayList<>();
	// for (int i = day1; i <= day2; i++) {
	// int k = 1;
	// Date tmp = date1;
	// MyItem myItem = new MyItem();
	// myItem.setTime(covertD2S(tmp));
	// myItem.setValue(sumItemByDate(tmp)/1000);
	// System.out.println(sumItemByDate(tmp)/1000);
	// list.add(myItem);
	// date1 = addDays(date1, k);
	// }
	//
	// return list;
	// }

	private double sumItemByDate(Date date) {
		Session session = factory.openSession();
		Transaction t = null;
		try {
			Query query = session.createQuery("SELECT ISNULL(SUM(amount), 0) FROM DatHang WHERE created =:date");
			query.setDate("date", date);
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.doubleValue();
			// System.err.println(query.uniqueResult());
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

	 public static Date addDays(Date date, int days) {
	        GregorianCalendar cal = new GregorianCalendar();
	        cal.setTime(date);
	        cal.add(Calendar.DATE, days);
	        return cal.getTime();
	    }

	public static Date subDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, -days);
		return cal.getTime();
	}

	private String covertD2S(Date date) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyy");
		return df.format(date);
	}
}
