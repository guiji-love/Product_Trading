package com.guiji.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {

    private static DruidDataSource dataSource;
    //利用ThreadLocal确保所有连接为同一个，从而实现订单的事务管理
    private static ThreadLocal<Connection> conns=new ThreadLocal<Connection>();

    static {
        try {
            Properties properties = new Properties();
            // 读取 jdbc.properties属性配置文件
            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            // 从流中加载数据
            properties.load(inputStream);
            // 创建数据库连接池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    /**
     * 获取数据库连接池中的连接
     * @return 如果返回null,说明获取连接失败<br/>有值就是获取连接成功
     */
    public static Connection getConnection(){
        //与session同理，有之前的就取，没有就新建一个，确保一直是同一个
        Connection conn =conns.get();
        if (conn==null){
            try {
                //如果为空，说明第一次进来无连接，这时候从数据库连接池里取连接
                conn = dataSource.getConnection();
                //保存到ThreadLocal对象中，供后面的jdbc操作使用
                conns.set(conn);
                //设置为手动管理事务
                conn.setAutoCommit(false);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
    //提交事务并关闭释放连接
    public static void commitAndClose(){
        Connection connection = conns.get();
        if (connection!=null){
            //如果不为空，说明之前使用过连接，操作过数据库
            try {
                //提交事务
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    //关闭释放连接
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        //一定要执行remove()操作，因为tomact服务器底层使用了线程池技术
        conns.remove();
    }

    //回滚事务并关闭释放连接
    public static void rollbackAndClose(){
        Connection connection = conns.get();
        if (connection!=null){
            //如果不为空，说明之前使用过连接，操作过数据库
            try {
                //回滚事务
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    //关闭释放连接
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        //一定要执行remove()操作，因为tomact服务器底层使用了线程池技术
        conns.remove();

    }
/*   订单改为事务,利用ThreadLocal确保所有连接为同一个，从而实现订单的事务管理，连接在事务中关闭，这段不用再次关闭了
    //关闭连接，放回数据库连接池
    public static void close(Connection conn){
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
*/

}