package ptithcm.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="UserID")
public class UserID {
	@Id
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="role_id")
	private Role role;

	@OneToOne
	@JoinColumn(name="infouser_id")
	private ThongTinUser thongtinuser;
	
	@OneToMany(mappedBy="userid", fetch=FetchType.EAGER)
	private Collection<DatHang> dathang;
	
//	@OneToMany(mappedBy="userid1", fetch=FetchType.EAGER)
//	private Collection<DatHang> dathang1;

	public UserID() {
		super();
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

//	public List<String> getRoles() {
//		return null;
//	}

	public ThongTinUser getThongtinuser() {
		return thongtinuser;
	}

	public void setThongtinuser(ThongTinUser thongtinuser) {
		this.thongtinuser = thongtinuser;
	}

	public Collection<DatHang> getDathang() {
		return dathang;
	}

	public void setDathang(Collection<DatHang> dathang) {
		this.dathang = dathang;
	}

//	public Collection<DatHang> getDathang1() {
//		return dathang1;
//	}
//
//	public void setDathang1(Collection<DatHang> dathang1) {
//		this.dathang1 = dathang1;
//	}
	
	
}
