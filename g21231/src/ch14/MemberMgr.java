package ch14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import ch15.ThemaBean;


public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean checkId(String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from tblSignup where id= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		}catch(Exception e) {
			e.getMessage();
			
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
	
	public Vector<ZipcodeBean> zipcodeRead(String area3) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
			ZipcodeBean bean = new ZipcodeBean();
			bean.setZipcode(rs.getString(1));
			bean.setArea1(rs.getString(2));
			bean.setArea2(rs.getString(3));
			bean.setArea3(rs.getString(4));
			vlist.addElement(bean);
			}
			
		}catch(Exception e) {
			e.getMessage();
			
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	public boolean insertMember(MemberBean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into tblSignup(id,email,name,gender,pwd,zipcode,address,birthday"
					+ ",hobby,job,regdate)values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getPwd());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getBirthday());
			String hobby[] = bean.getHobby();
			char hb[] = { '0', '0', '0', '0', '0' };
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j]))
						hb[j] = '1';
				}
			}
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getJob());
			if (pstmt.executeUpdate() == 1)
				flag = true;
			
		}catch(Exception e) {
			e.getMessage();
			
		}finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	 public boolean loginMember(String id, String pwd) {
	      
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      boolean flag = false;
	      
	      try {
	            con = pool.getConnection();
	             sql =  "select id from tblSignup where id= ? and pwd =?";
	             pstmt = con.prepareStatement(sql);
	             pstmt.setString(1,id);
	             pstmt.setString(2, pwd);
	             rs = pstmt.executeQuery();
	             flag = rs.next();
	          
	         }catch(Exception e) {
	            e.printStackTrace();
	         }finally {
	            pool.freeConnection(con, pstmt, rs);
	         }
	      
	      return flag;
	   }
	 
	 public Vector<FindIdBean> findId(String email,String name) {
	      
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      
	      Vector<FindIdBean> flist = new Vector<FindIdBean>();
	      try {
	            con = pool.getConnection();
	             sql =  "select id from tblSignup where email =? and name =?";
	             pstmt = con.prepareStatement(sql);
	           
	             pstmt.setString(1,email);
	             pstmt.setString(2,name);
	             rs = pstmt.executeQuery();
	             while(rs.next()) {
	            	FindIdBean bean = new FindIdBean();
	     			bean.setId(rs.getString(1));	
	     			flist.addElement(bean);
	     			}          
	         }catch(Exception e) {
	            e.printStackTrace();
	         }finally {
	            pool.freeConnection(con, pstmt, rs);
	         }
	      
	      return flist;
	   }

 	public void updateBoardPwd(String id, String pwd) {
         Connection con = null;
         PreparedStatement pstmt = null;
         String sql = null;

         try {
            con = pool.getConnection();
            sql = "update tblSignup set pwd=? where id=?";
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, pwd);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
            
         }catch(Exception e) {
            e.getMessage();
            
         }finally {
            pool.freeConnection(con, pstmt);
         }

      }

	  public Vector<FindPwdBean> findPwd(String id,String email) {
		      
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      
		      Vector<FindPwdBean> plist = new Vector<FindPwdBean>();
		      try {
		            con = pool.getConnection();
		             sql =  "select * from tblSignup where id =? and email =?";
		             pstmt = con.prepareStatement(sql);
		           
		             pstmt.setString(1,id);
		             pstmt.setString(2,email);
		             rs = pstmt.executeQuery();
		             while(rs.next()) {
		            	FindPwdBean bean = new FindPwdBean();
		     			bean.setPwd(rs.getString(1));	
		     			plist.addElement(bean);
		     			}          
		         }catch(Exception e) {
		            e.printStackTrace();
		         }finally {
		            pool.freeConnection(con, pstmt, rs);
		         }
		      
		      return plist;
		   }
	 
	 
	 
			/*
			 * public Vector<MemberBean> checkimg(String img) {
			 * 
			 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
			 * String sql = null;
			 * 
			 * Vector<MemberBean> flist = new Vector<MemberBean>(); try { con =
			 * pool.getConnection(); sql = "select img from tblSignup where id =?"; pstmt =
			 * con.prepareStatement(sql);
			 * 
			 * pstmt.setString(1,img); rs = pstmt.executeQuery(); while(rs.next()) {
			 * MemberBean bean = new MemberBean(); bean.setId(rs.getString(1));
			 * flist.addElement(bean); } }catch(Exception e) { e.printStackTrace(); }finally
			 * { pool.freeConnection(con, pstmt, rs); }
			 * 
			 * return flist; }
			 */
		 
		 
//			public Vector<MemberBean> checkimg(String img) {
//				Connection con = null;
//				PreparedStatement pstmt = null;
//				ResultSet rs = null;
//				String sql = null;
//				Vector<MemberBean> vlist = new Vector<MemberBean>();
//				try {
//					con = pool.getConnection();
//					if (img.equals("null") || img.equals("")) {
//						sql = "select img from tblSignup where id =?";
//						pstmt = con.prepareStatement(sql);
//						
//					} else {
//						sql = "select img from tblSignup where id =?";
//						pstmt = con.prepareStatement(sql);
//					}
//
//					rs = pstmt.executeQuery();
//					while (rs.next()) {
//						MemberBean bean = new MemberBean();
//						bean.setImg(rs.getString("img"));
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					pool.freeConnection(con, pstmt, rs);
//				}
//				return vlist;
//			}
		
	 
			  public Vector<imgBean> checkimg(String id) {
			      
			      Connection con = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      String sql = null;
			      
			      Vector<imgBean> vlist = new Vector<imgBean>();
			      try {
			            con = pool.getConnection();
			             sql =  "select img from tblsignup where id =?";
			             pstmt = con.prepareStatement(sql);
			           
			             pstmt.setString(1,id);
			             rs = pstmt.executeQuery();
			             while(rs.next()) {
			            	 imgBean bean = new imgBean();
			            	 bean.setImg(rs.getString("img"));
			     			vlist.addElement(bean);
			     			}          
			         }catch(Exception e) {
			            e.printStackTrace();
			         }finally {
			            pool.freeConnection(con, pstmt, rs);
			         }
			      
			      return vlist;
			   }
	
}
