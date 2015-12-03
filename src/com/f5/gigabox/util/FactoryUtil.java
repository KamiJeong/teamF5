package com.f5.gigabox.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

/**
 * Created by kami on 8/26/15.
 */
public class FactoryUtil {

  private static SqlSessionFactory factory;

  static {
    try {
      Reader reader = Resources.getResourceAsReader("com/f5/gigabox/config/mybatis-config.xml");
      factory = new SqlSessionFactoryBuilder().build(reader);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static SqlSessionFactory getFactory() {
    return factory;
  }

}
