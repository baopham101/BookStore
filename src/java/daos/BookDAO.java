/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.BookDTO;
import utils.DBUtils;

import javax.naming.NamingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author baoph
 */
public class BookDAO {

    public void create(BookDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblProducts(ProductName, Images, Price, Quantity, Statuss, CreateDate) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getBookName());
                stm.setString(2, dto.getBookImage());
                stm.setDouble(3, dto.getBookPrice());
                stm.setInt(4, dto.getBookQuantity());
                stm.setBoolean(5, dto.isBookStatus());
                stm.setDate(6, dto.getCreateDate());
                stm.executeUpdate();

            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<BookDTO> getAllListBook(String search) throws SQLException {
        List<BookDTO> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, Images, Price, Quantity, Statuss, CreateDate FROM tblProducts "
                        + " WHERE ProductName LIKE ? AND Statuss = 'True' "
                        + " ORDER BY CreateDate DESC ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String images = rs.getString("images");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("statuss");
                    result.add(new BookDTO(productID, productName, images, price, status, quantity, createDate));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<BookDTO> getListBookByID(int ID) throws SQLException {
        List<BookDTO> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductName, Images, Price, Quantity, Statuss, CreateDate FROM tblProducts "
                        + " WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    String images = rs.getString("images");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("statuss");
                    result.add(new BookDTO(ID, productName, images, price, status, quantity, createDate));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void update(BookDTO dto, int ID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE dbo.tblProducts\n"
                        + "SET\n"
                        + "    ProductName = ?,\n"
                        + "    Images = ?,\n"
                        + "    Price = ?,\n"
                        + "    Quantity = ?,\n"
                        + "    Statuss = ?,\n"
                        + "    CreateDate = ?\n"
                        + "	WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getBookName());
                stm.setString(2, dto.getBookImage());
                stm.setFloat(3, dto.getBookPrice());
                stm.setInt(4, dto.getBookQuantity());
                stm.setBoolean(5, dto.isBookStatus());
                stm.setDate(6, dto.getCreateDate());
                stm.setInt(7, ID);
                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void delete(int ID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts\n"
                        + "SET Statuss = 0 \n"
                        + "WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, ID);
                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public BookDTO getBookByID(int ID) throws SQLException {
        BookDTO dto = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductName, Images, Price, Quantity, Statuss, CreateDate FROM tblProducts " +
                        "WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    String images = rs.getString("images");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("statuss");
                    dto = new BookDTO(ID, productName, images, price, status, quantity, createDate);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }
    public int getQuantityByBookID(int ID) throws SQLException {
        BookDTO dto;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quantity = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Quantity FROM tblProducts "
                        + " WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public void updateBookQuantity(int bookID, int quantity) throws SQLException {
        BookDTO dto;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET Quantity = ? "
                        + "WHERE ProductID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setInt(2, bookID);
                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
