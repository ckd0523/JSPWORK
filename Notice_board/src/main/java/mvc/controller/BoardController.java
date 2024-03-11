package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.RepleDAO;
import mvc.model.RepleDTO;

public class BoardController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static final int LISTCOUNT = 5;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        if (command.equals("/BoardListAction.do")) { // 등록된 글 목록 페이지 출력
            requestBoardList(request);
            RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
            rd.forward(request, response);
        } else if (command.equals("/BoardWriteForm.do")) { // 글 쓰기 폼 출력
            requestLoginName(request);
            RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
            rd.forward(request, response);
        } else if (command.equals("/BoardWriteAction.do")) { // 글 작성 처리
            requestBoardWrite(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);
        } else if (command.equals("/BoardViewAction.do")) { // 글 수정 페이지 처리
            requestBoardView(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
            rd.forward(request, response);
        } else if (command.equals("/BoardView.do")) { // 글 수정 보기 페이지 출력
            RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
            rd.forward(request, response);
        } else if (command.equals("/BoardUpdateAction.do")) { // 글 수정 처리
            requestBoardUpdate(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);
        } else if (command.equals("/BoardDeleteAction.do")) { // 글 삭제 처리
            requestBoardDelete(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);
        } else if(command.equals("/BoardRepleAction.do")) {	// 글 보기 처리
        	requestBoardReple(request);
        	RequestDispatcher rd = request.getRequestDispatcher("/BoardReple.do");
            rd.forward(request, response);
        } else if(command.equals("/BoardReple.do")) {	// 글 보기 페이지 출력
        	RequestDispatcher rd = request.getRequestDispatcher("./board/notice.jsp");
            rd.forward(request, response);
        } else if(command.equals("/BoardRepleWriteAction.do")) {
        	requestRepleWrite(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardRepleAction.do");
            rd.forward(request, response);
        }
    }
    


    // 댓글 삭제를 요청하는 메서드
//    public void requestRepleDelete(HttpServletRequest request) {
//
//        int num = Integer.parseInt(request.getParameter("num"));
//        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//
//        RepleDAO dao = RepleDAO.getInstance();
//    	RepleDTO reple = new RepleDTO();
//    	reple.
//        dao.deleteBoard(num);
//    }
    
    // 글 상세정보 요청하는 메서드
    public void requestRepleWrite(HttpServletRequest request) {
    	
    	
    	int num = Integer.parseInt(request.getParameter("num"));
    	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        request.setAttribute("num", num);
        System.out.println(num);
        request.setAttribute("page", pageNum);
    	
        
    	RepleDAO dao = RepleDAO.getInstance();
    	RepleDTO reple = new RepleDTO();
        reple.setId(request.getParameter("id"));
        reple.setReple(request.getParameter("reple")); 
        reple.setReplenum(num);
        
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
        String regist_day = formatter.format(new java.util.Date());
        
        reple.setRegist_day(regist_day);
        
        

        dao.insertReple(reple);
    }
    
    // 글 보기 메서드
    public void requestBoardReple(HttpServletRequest request) {
    	
        BoardDAO dao = BoardDAO.getInstance();
        //List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
  
        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        
        RepleDAO dao1 = RepleDAO.getInstance();
        List<RepleDTO> replelist = new ArrayList<RepleDTO>();
        replelist = dao1.getRepleList(num);
        
        


        BoardDTO board = dao.getBoardByNum(num, pageNum);

        request.setAttribute("num", num);
        request.setAttribute("page", pageNum);
        request.setAttribute("board", board);
        
        //request.setAttribute("boardlist", boardlist);
        request.setAttribute("replelist", replelist);
    }
    
    
    // 게시글 목록을 요청하는 메서드
    public void requestBoardList(HttpServletRequest request) {

        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> boardlist = new ArrayList<BoardDTO>();

        int pageNum = 1;
        int limit = LISTCOUNT;

        if (request.getParameter("pageNum") != null)
            pageNum = Integer.parseInt(request.getParameter("pageNum"));

        String items = request.getParameter("items");
        String text = request.getParameter("text");

        int total_record = dao.getListCount(items, text);
        boardlist = dao.getBoardList(pageNum, limit, items, text);

        int total_page;

        if (total_record % limit == 0) {
            total_page = total_record / limit;
            Math.floor(total_page);
        } else {
            total_page = total_record / limit;
            Math.floor(total_page);
            total_page = total_page + 1;
        }

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("total_page", total_page);
        request.setAttribute("total_record", total_record);
        request.setAttribute("boardlist", boardlist);
    }

    // 로그인한 사용자명을 요청하는 메서드
    public void requestLoginName(HttpServletRequest request) {

        String id = request.getParameter("id");

        BoardDAO dao = BoardDAO.getInstance();

        String name = dao.getLoginNameById(id);

        request.setAttribute("name", name);
    }

    // 게시글 작성을 요청하는 메서드
    public void requestBoardWrite(HttpServletRequest request) {

        BoardDAO dao = BoardDAO.getInstance();

        BoardDTO board = new BoardDTO();
        board.setId(request.getParameter("id"));
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
        String regist_day = formatter.format(new java.util.Date());

        board.setHit(0);
        board.setRegist_day(regist_day);
        board.setIp(request.getRemoteAddr());

        dao.insertBoard(board);
    }

    // 게시글 수정페이지 보기를 요청하는 메서드
    public void requestBoardView(HttpServletRequest request) {

        BoardDAO dao = BoardDAO.getInstance();
        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        BoardDTO board = dao.getBoardByNum(num, pageNum);

        request.setAttribute("num", num);
        request.setAttribute("page", pageNum);
        request.setAttribute("board", board);
    }

    // 게시글 수정을 요청하는 메서드
    public void requestBoardUpdate(HttpServletRequest request) {

        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        BoardDAO dao = BoardDAO.getInstance();

        BoardDTO board = new BoardDTO();
        board.setNum(num);
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
        String regist_day = formatter.format(new java.util.Date());

        board.setHit(0);
        board.setRegist_day(regist_day);
        board.setIp(request.getRemoteAddr());

        dao.updateBoard(board);
    }

    // 게시글 삭제를 요청하는 메서드
    public void requestBoardDelete(HttpServletRequest request) {

        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        BoardDAO dao = BoardDAO.getInstance();
        dao.deleteBoard(num);
    }
}
