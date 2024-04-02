package entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Entity
public class Categories {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "CategoryId")
    private int categoryId;
    @Basic
    @Column(name = "Name")
    private String name;
    @OneToMany(mappedBy = "categoriesByCategoryId")
    private List<Products> productsByCategoryId;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Categories that = (Categories) o;

        if (categoryId != that.categoryId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = categoryId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    public List<Products> getProductsByCategoryId() {
        return productsByCategoryId;
    }

    public void setProductsByCategoryId(List<Products> productsByCategoryId) {
        this.productsByCategoryId = productsByCategoryId;
    }
}
