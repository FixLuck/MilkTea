package entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.List;




@Entity
public class Products {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ProductId")
    private int productId;
    @Basic
    @Column(name = "ProdName")
    private String prodName;
    @Basic
    @Column(name = "Price")
    private Float price;
    @Basic
    @Column(name = "Stock")
    private Integer stock;
    @Basic
    @Column(name = "Describe")
    private String describe;
    @Basic
    @Column(name = "Images")
    private String images;
    @Basic
    @Column(name = "CreateDate")
    private Date createDate;
    @OneToMany(mappedBy = "productsByProductId")
    private List<OrderDetails> orderDetailsByProductId;
    @ManyToOne
    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId", nullable = false)
    private Categories categoriesByCategoryId;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Products products = (Products) o;

        if (productId != products.productId) return false;
        if (prodName != null ? !prodName.equals(products.prodName) : products.prodName != null) return false;
        if (price != null ? !price.equals(products.price) : products.price != null) return false;
        if (stock != null ? !stock.equals(products.stock) : products.stock != null) return false;
        if (describe != null ? !describe.equals(products.describe) : products.describe != null) return false;
        if (images != null ? !images.equals(products.images) : products.images != null) return false;
        if (createDate != null ? !createDate.equals(products.createDate) : products.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        result = 31 * result + (describe != null ? describe.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        return result;
    }

    public List<OrderDetails> getOrderDetailsByProductId() {
        return orderDetailsByProductId;
    }

    public void setOrderDetailsByProductId(List<OrderDetails> orderDetailsByProductId) {
        this.orderDetailsByProductId = orderDetailsByProductId;
    }

    public Categories getCategoriesByCategoryId() {
        return categoriesByCategoryId;
    }

    public void setCategoriesByCategoryId(Categories categoriesByCategoryId) {
        this.categoriesByCategoryId = categoriesByCategoryId;
    }
}
