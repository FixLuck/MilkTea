package entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Entity
public class Roles {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "RoleId")
    private int roleId;
    @Basic
    @Column(name = "RoleName")
    private String roleName;
    @OneToMany(mappedBy = "rolesByRoleId")
    private List<Users> usersByRoleId;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Roles roles = (Roles) o;

        if (roleId != roles.roleId) return false;
        if (roleName != null ? !roleName.equals(roles.roleName) : roles.roleName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        return result;
    }

    public List<Users> getUsersByRoleId() {
        return usersByRoleId;
    }

    public void setUsersByRoleId(List<Users> usersByRoleId) {
        this.usersByRoleId = usersByRoleId;
    }
}
