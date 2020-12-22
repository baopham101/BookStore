/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import utils.DBUtils;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author baoph
 */
public class OrderDAO {
    public void createOrder(OrderDTO dto) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrder(Names, Addresss, PhoneNumber, Email, CreateDate, TotalPrice, UserID) "
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getName());
                stm.setString(2, dto.getAddress());
                stm.setString(3, dto.getPhoneNumber());
                stm.setString(4, dto.getEmail());
                stm.setTimestamp(5, dto.getCreateDate());
                stm.setFloat(6, dto.getTotalPrice());
                stm.setString(7, dto.getUserID());
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

//    public List<OrderDTO> getOrderByID(int ID, String email) throws SQLException {
//        List<OrderDTO> result = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT OrderDate, PhoneNumber, Names, Addresss, PaymentMethod, PaymentStatus, Email " +
//                        "FROM tblOrder " +
//                        "WHERE OrderID = ? AND Email = ? ";
//                stm = conn.prepareStatement(sql);
//                stm.setInt(1, ID);
//                stm.setString(2, email);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    Timestamp orderDate = rs.getTimestamp("orderDate");
//                    String phoneNumber = rs.getString("phoneNumber");
//                    String name = rs.getString("names");
//                    String address = rs.getString("addresss");
//                    String paymentMethod = rs.getString("paymentMethod");
//                    boolean paymentStatus = rs.getBoolean("paymentStatus");
//                    result.add(new OrderDTO(ID, orderDate, phoneNumber, name, address, paymentMethod, email, paymentStatus));
//                }
//            }
//        } catch (Exception e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return result;
//    }

//    public List<OrderDTO> getOrderByEmail(String email) throws SQLException {
//        List<OrderDTO> result = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT OrderID, OrderDate, PhoneNumber, Names, Addresss, PaymentMethod, PaymentStatus \n" +
//                        "FROM tblOrder\n" +
//                        "WHERE Email = ?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, email);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    int orderID = rs.getInt("orderID");
//                    Timestamp orderDate = rs.getTimestamp("orderDate");
//                    String phoneNumber = rs.getString("phoneNumber");
//                    String name = rs.getString("names");
//                    String address = rs.getString("addresss");
//                    String paymentMethod = rs.getString("paymentMethod");
//                    boolean paymentStatus = rs.getBoolean("paymentStatus");
//                    result.add(new OrderDTO(orderID, orderDate, phoneNumber, name, address, paymentMethod, email, paymentStatus));
//                }
//            }
//        } catch (Exception e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return result;
//    }

    public int getOrderID() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int ID = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT MAX(OrderID) AS ID FROM tblOrder";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    ID = rs.getInt("ID");
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
        return ID;
    }

    public void createOrderDetail(OrderDetailDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrderDetail(Price, Quantity, OrderID, ProductID) "
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setFloat(1, dto.getPrice());
                stm.setInt(2, dto.getQuantity());
                stm.setInt(3, dto.getOrderID());
                stm.setInt(4, dto.getProductID());
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

//    public int getOrderIDByEmail(String email) throws SQLException {
//        OrderDTO dto = null;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        int ID = 0;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT MAX(OrderID)\n" +
//                        "FROM tblOrder\n" +
//                        "WHERE Email = ?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, email);
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    ID = rs.getInt("orderID");
//                }
//            }
//        } catch (Exception e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return ID;
//    }
}
