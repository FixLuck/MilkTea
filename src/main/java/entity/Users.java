package entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Entity
public class Users {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "UserId")
    private int userId;
    @Basic
    @Column(name = "UserName")
    private String userName;
    @Basic
    @Column(name = "Email")
    private String email;
    @Basic
    @Column(name = "Password")
    private String password;
    @Basic
    @Column(name = "Address")
    private String address;
    @Basic
    @Column(name = "Gender")
    private Boolean gender;
    @Basic
    @Column(name = "Phone")
    private String phone;
    @OneToMany(mappedBy = "usersByUserId")
    private List<Orders> ordersByUserId;
    @ManyToOne
    @JoinColumn(name = "RoleId", referencedColumnName = "RoleId", nullable = false)
    private Roles rolesByRoleId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (userId != users.userId) return false;
        if (userName != null ? !userName.equals(users.userName) : users.userName != null) return false;
        if (email != null ? !email.equals(users.email) : users.email != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;
        if (address != null ? !address.equals(users.address) : users.address != null) return false;
        if (gender != null ? !gender.equals(users.gender) : users.gender != null) return false;
        if (phone != null ? !phone.equals(users.phone) : users.phone != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        return result;
    }

    public List<Orders> getOrdersByUserId() {
        return ordersByUserId;
    }

    public void setOrdersByUserId(List<Orders> ordersByUserId) {
        this.ordersByUserId = ordersByUserId;
    }

    public Roles getRolesByRoleId() {
        return rolesByRoleId;
    }

    public void setRolesByRoleId(Roles rolesByRoleId) {
        this.rolesByRoleId = rolesByRoleId;
    }
}
