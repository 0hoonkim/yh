package ch15;

import java.io.BufferedInputStream;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ch14.MemberBean;

public class BoardMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "e:/fileupload";
	private static final String ENCTYPE = "utf-8";
	private static int MAXSIZE = 5*1024*1024;

	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public Vector<BoardBean> getBoardList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblHelp order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  tblHelp where " + keyField + " like ? ";
				sql += "order by ref desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			
			/*
			 * sql = "insert tblHelp(name, category, title, content, ref, pos, depth, " +
			 * "regdate, pass, count, ip, filename, filesize, rstatus)"; sql +=
			 * "valuse(?, ?, ?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?, ?)";
			 */
			
			
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setCategory(rs.getString("category"));
				bean.setTitle(rs.getString("title"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setRstatus(rs.getString("rstatus"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void upCount2(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblthema set count=count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from tblHelp";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from  tblHelp where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	

	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblHelp";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if (rs.next())
				ref = rs.getInt(1) + 1;
			File file = new File(SAVEFOLDER);
			if (!file.exists())
				file.mkdirs();
			multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			String content = multi.getParameter("content");
			if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			sql = "insert tblHelp(id,category,title,content,ref,pos,depth,regdate,"
					+ "pass,count,ip,filename,filesize,rstatus)";
			sql += "values(?, ?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?,?)";
			
			
			
			/*
			 * sql = "insert tblHelp(name, category, title, content, ref, pos, depth, " +
			 * "regdate, pass, count, ip, filename, filesize, rstatus)"; sql +=
			 * "valuse(?, ?, ?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?, ?)";
			 */
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("id"));
			pstmt.setString(2, multi.getParameter("category"));
			pstmt.setString(3, multi.getParameter("title"));
			pstmt.setString(4, content);
			
			pstmt.setInt(5, ref);
			pstmt.setString(6, multi.getParameter("pass"));
			pstmt.setString(7, multi.getParameter("ip"));
			pstmt.setString(8, filename);
			pstmt.setInt(9, filesize);
			pstmt.setString(10, "�깅�");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	

	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblHelp where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setCategory(rs.getString("category"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setIp(rs.getString("ip"));
				bean.setRstatus(rs.getString("rstatus"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}


	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblHelp set count=count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblHelp where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}
			sql = "delete from tblHelp where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}


	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblHelp set id=?,title=?,content=? where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			
			sql = "insert tblHelp (id,category,content,title,ref,pos,depth,regdate,pass,count,ip,rstatus)";
			sql += "values(?,?,?,?,?,?,?,now(),?,0,?,?)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getCategory());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getTitle());
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, pos);
			pstmt.setInt(7, depth);
			pstmt.setString(8, bean.getPass());
			pstmt.setString(9, bean.getIp());
			pstmt.setString(10, "�듬�");
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblHelp set pos = pos + 1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


		public void downLoad(HttpServletRequest req, HttpServletResponse res,
				JspWriter out, PageContext pageContext) {
			try {
				String filename = req.getParameter("filename");
				File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
				byte b[] = new byte[(int) file.length()];
				res.setHeader("Accept-Ranges", "bytes");
				String strClient = req.getHeader("User-Agent");
				if (strClient.indexOf("MSIE6.0") != -1) {
					res.setContentType("application/smnet;charset=euc-kr");
					res.setHeader("Content-Disposition", "filename=" + filename + ";");
				} else {
					res.setContentType("application/smnet;charset=euc-kr");
					res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
				}
				out.clear();
				out = pageContext.pushBody();
				if (file.isFile()) {
					BufferedInputStream fin = new BufferedInputStream(
							new FileInputStream(file));
					BufferedOutputStream outs = new BufferedOutputStream(
							res.getOutputStream());
					int read = 0;
					while ((read = fin.read(b)) != -1) {
						outs.write(b, 0, read);
					}
					outs.close();
					fin.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblHelp(id,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//main
	public static void main(String[] args) {
		new BoardMgr().post1000();
		System.out.println("SUCCESS");
	}
	
	
	public Vector<ThemaBean> getThemaList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ThemaBean> vlist = new Vector<ThemaBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblThema order by num asc, num limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  tblThema where " + keyField + " like ? ";
				sql += "order by num asc, num limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ThemaBean bean = new ThemaBean();
				bean.setNum(rs.getInt("num"));
				bean.setImg(rs.getString("img"));
				bean.setTitle(rs.getString("title"));
				bean.setCount(rs.getInt("count"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	
	public Vector<ThemaSubBean> getThemaSubList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ThemaSubBean> vlist = new Vector<ThemaSubBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblThema_sub order by num asc";
				pstmt = con.prepareStatement(sql);
				/*
				 * pstmt.setInt(1, start); pstmt.setInt(2, end);
				 */
			} else {
				sql = "select * from  tblThema_sub where " + keyField + " like ? ";
				sql += "order by num asc, num limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ThemaSubBean bean = new ThemaSubBean();
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setImg_1(rs.getString("img_1"));
				bean.setImg_2(rs.getString("img_2"));
				bean.setImg_3(rs.getString("img_3"));
				bean.setPlace_1(rs.getString("place_1"));
				bean.setPlace_2(rs.getString("place_2"));
				bean.setPlace_3(rs.getString("place_3"));
				bean.setContent_1(rs.getString("content_1"));
				bean.setContent_2(rs.getString("content_2"));
				bean.setContent_3(rs.getString("content_3"));
				bean.setContent_4(rs.getString("content_4"));
				bean.setContent_5(rs.getString("content_5"));
				bean.setContent_6(rs.getString("content_6"));
				bean.setContent_7(rs.getString("content_7"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	

	
	
	public Vector<BoardBeanProduct> getBoardListProduct(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBeanProduct> vlist = new Vector<BoardBeanProduct>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblMain order by num asc, num limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  tblMain where " + keyField + " like ? ";
				sql += "order by num asc, num limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBeanProduct bean = new BoardBeanProduct();
				bean.setNum(rs.getInt("num"));
				bean.setPlace(rs.getString("place"));
				bean.setImg(rs.getString("img"));
				bean.setIntro(rs.getString("intro"));
				bean.setFav(rs.getInt("fav"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<BoardBeanScript> getBoardListScript(String keyField, String keyWord,
	         int start, int end) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<BoardBeanScript> slist = new Vector<BoardBeanScript>();
	      try {
	         con = pool.getConnection();
	         if (keyWord.equals("null") || keyWord.equals("")) {
	            sql = "select * from tblMain_script order by num asc, num limit ?, ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, start);
	            pstmt.setInt(2, end);
	         } else {
	            sql = "select * from  tblMain_script where " + keyField + " like ? ";
	            sql += "order by num asc, num limit ? , ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyWord + "%");
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
	         }

	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            BoardBeanScript bean = new BoardBeanScript();
	            bean.setNum(rs.getInt("num"));
	            bean.setImg1(rs.getString("img1"));
	            bean.setImg2(rs.getString("img2"));
	            bean.setImg3(rs.getString("img3"));
	            bean.setImg4(rs.getString("img4"));
	            bean.setImg5(rs.getString("img5"));
	            bean.setImg6(rs.getString("img6"));
	            bean.setImg7(rs.getString("img7"));
	            bean.setImg8(rs.getString("img8"));
	            bean.setImg9(rs.getString("img9"));
	            bean.setPlace(rs.getString("place"));
	            bean.setContent(rs.getString("content"));

	            slist.add(bean);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return slist;
	   }
	
	
	public Vector<BoardBeanThemaSub> getBoardThemaSub(String keyField, String keyWord,
            int start, int end) {
         Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String sql = null;
         Vector<BoardBeanThemaSub> slist = new Vector<BoardBeanThemaSub>();
         try {
            con = pool.getConnection();
            if (keyWord.equals("null") || keyWord.equals("")) {
               sql = "select * from tblthema_sub order by num asc";
               pstmt = con.prepareStatement(sql);
//               pstmt.setInt(1, start);
//               pstmt.setInt(1, end);
            } else {
               sql = "select * from  tblthema_sub where " + keyField + " like ? ";
               sql += "order by num asc, num limit ? , ?";
               pstmt = con.prepareStatement(sql);
               pstmt.setString(1, "%" + keyWord + "%");
               pstmt.setInt(2, start);
               pstmt.setInt(3, end);
            }

            rs = pstmt.executeQuery();
            while (rs.next()) {
               BoardBeanThemaSub bean = new BoardBeanThemaSub();
               bean.setTitle(rs.getString("title"));
               bean.setImg_1(rs.getString("img_1"));
               bean.setImg_2(rs.getString("img_2"));
               bean.setImg_3(rs.getString("img_3"));
               bean.setPlace_1(rs.getString("place_1"));
               bean.setPlace_2(rs.getString("place_2"));
               bean.setPlace_3(rs.getString("place_3"));
               bean.setContent_1(rs.getString("content_1"));
               bean.setContent_2(rs.getString("content_2"));
               bean.setContent_3(rs.getString("content_3"));
               bean.setContent_4(rs.getString("content_4"));
               bean.setContent_5(rs.getString("content_5"));
               bean.setContent_6(rs.getString("content_6"));
               bean.setContent_7(rs.getString("content_7"));
               bean.setMap_lat_1(rs.getString("map_lat_1"));
               bean.setMap_lon_1(rs.getString("map_lon_1"));
               bean.setMap_lat_2(rs.getString("map_lat_2"));
               bean.setMap_lon_2(rs.getString("map_lon_2"));
               bean.setMap_lat_3(rs.getString("map_lat_3"));
               bean.setMap_lon_3(rs.getString("map_lon_3"));

               slist.add(bean);
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            pool.freeConnection(con, pstmt, rs);
         }
         return slist;
      }
	
	
	public void insertBoardReview(HttpServletRequest req) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      try {
	         con = pool.getConnection();
	         sql = "insert tblreview(id, img, comment, place, rating)";
	         sql += "values(?, ?, ?, ?, ?)";

	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, req.getParameter("id"));
	         pstmt.setString(2, req.getParameter("img"));
	         pstmt.setString(3, req.getParameter("comment"));
	         pstmt.setString(4, req.getParameter("place"));
	         pstmt.setString(5, req.getParameter("rating"));

	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt);
	      }
	   }
	
	
	
	public Vector<BoardBeanReview> getBoardListReview(String splace, int start, int end) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<BoardBeanReview> vlist = new Vector<BoardBeanReview>();
	      try {
	         con = pool.getConnection();
	         if (splace.equals("null") || splace.equals("")) {
	            sql = "SELECT * FROM tblreview ORDER BY num DESC LIMIT 3;";
	            pstmt = con.prepareStatement(sql);
	            
	         } else {
	            sql = "select * from  tblreview where place" + " like ? ";
	            sql += "ORDER BY num DESC LIMIT 3";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + splace + "%");
	            
	         }

	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            BoardBeanReview bean = new BoardBeanReview();
	            bean.setId(rs.getString("id"));
	            bean.setImg(rs.getString("img"));
	            bean.setComment(rs.getString("comment"));
	            bean.setPlace(rs.getString("place"));
	            bean.setRating(rs.getString("rating"));

	            vlist.add(bean);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return vlist;
	   }
	
	
	
	public Vector<BoardBeanFavCount> getBoardListFavCount(String splace) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<BoardBeanFavCount> vlist = new Vector<BoardBeanFavCount>();
	      try {
	         con = pool.getConnection();
	         if (splace.equals("null") || splace.equals("")) {
	            sql = "SELECT place, COUNT(*) as count, round(AVG(rating),  1) as avg FROM tblreview GROUP BY place";
	            pstmt = con.prepareStatement(sql);
	            /*
	             * pstmt.setInt(1, start); pstmt.setInt(2, end);
	             */
	         } else {
	            sql = "SELECT place, COUNT(*) as count, round(AVG(rating),  1) as avg FROM tblreview WHERE place =" + " ? ";
	            /* sql += "order by num desc, num limit ? , ?"; */
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, splace);
	            /*
	             * pstmt.setInt(2, start); pstmt.setInt(3, end);
	             */
	         }

	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            BoardBeanFavCount bean = new BoardBeanFavCount();
	            bean.setAvg(rs.getFloat("avg"));
	            bean.setCount(rs.getInt("count"));

	            vlist.add(bean);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return vlist;
	   }
	
	
	public Vector<ThemaBean> getIndexList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ThemaBean> vlist = new Vector<ThemaBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT * FROM tblthema ORDER BY count DESC LIMIT 6;";
				pstmt = con.prepareStatement(sql);
				
			} else {
				sql = "SELECT * FROM tblthema ORDER BY count DESC LIMIT 6;";
				pstmt = con.prepareStatement(sql);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ThemaBean bean = new ThemaBean();
				bean.setNum(rs.getInt("num"));
				bean.setImg(rs.getString("img"));
				bean.setTitle(rs.getString("title"));
				bean.setCount(rs.getInt("count"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	/*
	 * public Vector<ThemaBean> getIndexList(String id) { Connection con = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql = null;
	 * Vector<ThemaBean> vlist = new Vector<ThemaBean>(); try { con =
	 * pool.getConnection(); if (keyWord.equals("null") || keyWord.equals("")) { sql
	 * = "SELECT * FROM tblthema ORDER BY count DESC LIMIT 6;"; pstmt =
	 * con.prepareStatement(sql);
	 * 
	 * } else { sql = "SELECT * FROM tblthema ORDER BY count DESC LIMIT 6;"; pstmt =
	 * con.prepareStatement(sql); }
	 * 
	 * rs = pstmt.executeQuery(); while (rs.next()) { ThemaBean bean = new
	 * ThemaBean(); bean.setNum(rs.getInt("num")); bean.setImg(rs.getString("img"));
	 * bean.setTitle(rs.getString("title")); bean.setCount(rs.getInt("count"));
	 * vlist.add(bean); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * pool.freeConnection(con, pstmt, rs); } return vlist; }
	 */
	
	

	
}

