package com.qyl.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qyl.bean.Book;
import com.qyl.bean.BookType;
import com.qyl.bean.Borrow;
import com.qyl.service.BookService;
import com.qyl.service.BookTypeService;
import com.qyl.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * projectName:  SSM
 * packageName: com.qyl.controller
 * date: 2020-06-06 18:22
 * copyright(c) 2020 南晓18卓工 邱依良
 */
@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    BookTypeService bookTypeService;
    @Autowired
    BorrowService borrowService;
    @RequestMapping("/saveBook")
    public String saveBook(Book book){
        bookService.saveBook(book);
        String path = "redirect:fuzzyQueryAllBooks";
        return path;
    }

    @RequestMapping("/insertBooksBatch")
    public String insertBooksBatch() {
        ArrayList<Book> books = new ArrayList<Book>();
        for (int i = 0; i < 100; i++) {
            Book book = new Book();
            book.setId(i);
            book.setAuthor("邱依良");
            book.setBookEncrypt(UUID.randomUUID().toString().substring(0, 5));
            book.setBookName("java");
            book.setPubName("南京晓庄");
            book.setStock(1);
            book.setTypeName("自然科学");
            book.setIfBorrow(0);
            books.add(book);
        }
        bookService.insertBooksBatch(books);
        return "redirect:fuzzyQueryAllBooks";
    }

    @RequestMapping("/toPageReturnBook")
    public String toPageReturnBook(){
        return "returnBook";
    }

    @RequestMapping("/toPageUpdateBook")
    public String toPageUpdateBook(String typeName,Model model) {
        List<BookType> bookTypes = bookTypeService.fuzzyQueryAllBookTypes(typeName);
        model.addAttribute("bookTypes",bookTypes);
        return "updateBook";
    }

    //    public List<Book> fuzzyQueryAllBooks(String name);
    @RequestMapping("/fuzzyQueryAllBooks")
    public String fuzzyQueryAllBooks(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String bookName, String bookEncrypt,
            String pubName, String author, @RequestParam(value = "typeName", defaultValue = "-1", required = false) String typeName, String path, Model model) {
        List<Book> books;
        PageHelper.startPage(pageNum, 8);
        if (path == null) {
            path = "bookList";
        }
        if (typeName.equals("-1")) {
            books = bookService.fuzzyQueryAllBooks(bookName, bookEncrypt,
                    pubName, author, null);
            model.addAttribute("typeName", "-1");
        } else {
            books = bookService.fuzzyQueryAllBooks(bookName, bookEncrypt,
                    pubName, author, typeName);
            model.addAttribute("typeName", typeName);
        }
        List<BookType> bookTypes = bookTypeService.fuzzyQueryAllBookTypes(" ");
        PageInfo<Book> info = new PageInfo<Book>(books, 5);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("bookTypes", bookTypes);
        model.addAttribute("nums", nums);
        model.addAttribute("info", info);
        return path;
    }

    @RequestMapping("/accurateQueryAllBooks")
    public String accurateQueryAllBooks(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String bookName, String bookEncrypt,
            String pubName, String author, String typeName ,Model model) {
        List<BookType> bookTypes = bookTypeService.fuzzyQueryAllBookTypes(" ");
        PageHelper.startPage(pageNum, 8);
        List<Book> books = bookService.accurateQueryAllBooks(bookName, bookEncrypt,
                pubName, author, typeName);
        PageInfo<Book> info = new PageInfo<Book>(books, 8);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("bookTypes",bookTypes);
        model.addAttribute("nums", nums);
        model.addAttribute("info", info);
        return "showAllSameBooks";
    }


    @RequestMapping("/getBookById")
    public String getBookById(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                              @RequestParam(value = "id", defaultValue = "1") Integer id,
                              @RequestParam(value = "path",defaultValue = "")String path,
                              @RequestParam(value = "typeName", defaultValue = "自然科学") String typeName,Model model) {
        Book book = bookService.getBookById(id);
        List<BookType> bookTypes = bookTypeService.fuzzyQueryAllBookTypes(typeName);
        model.addAttribute("bookTypes",bookTypes);
        model.addAttribute("book", book);
        model.addAttribute("pageNum", pageNum);
        return path;
    }

    @ResponseBody
    @RequestMapping("/getBookInfo")
    public Book getBookInfo(Integer id){
        return bookService.getBookById(id);
    }

    @RequestMapping("/borrowBook")
    public String borrowBook(Book book,HttpSession session){
        bookService.updateBook(book);
        String username = session.getAttribute("username").toString();
        Date date = new Date();
        Integer id = book.getId();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd   HH:mm:ss");
        Borrow borrow = new Borrow(id,username,formatter.format(date),"");
        borrowService.insertBorrowLog(borrow);
        return "redirect:fuzzyQueryAllBooks?path=searchPage";
    }

    @RequestMapping("/returnBook")
    public String returnBook(Book book,HttpSession session){
        System.out.println(book.toString()+"\n\n\n");
        bookService.updateBook(book);
        String username = session.getAttribute("username").toString();
        Date date = new Date();
        Integer id = book.getId();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Borrow borrow = new Borrow(id,username,"",formatter.format(date));
        borrowService.insertBorrowLog(borrow);
        return "returnBook";
    }
    @RequestMapping("/updateBook")
    public String updateBook(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Book book) {
        bookService.updateBook(book);
        String dirPath = "redirect:fuzzyQueryAllBooks?pageNum=" + pageNum;
        return dirPath;
    }


    @RequestMapping("/updateBooksBatch")
    public String updateBooksBatch(List<Book> books,Model model) {
        bookService.updateBooksBatch(books);
        return "redirect:fuzzyQueryAllBooks";
    }

    @RequestMapping("/fuzzyQueryAllBorrowLog")
    public String fuzzyQueryAllBorrowLog(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String username, Integer bookId,Model model) {
        PageHelper.startPage(pageNum, 8);
        List<Borrow> borrows = borrowService.fuzzyQueryAllBorrowLog(username, bookId);
        PageInfo<Borrow> info = new PageInfo<Borrow>(borrows, 5);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("nums", nums);
        model.addAttribute("info", info);
        return "borrowLogs";
    }


    @RequestMapping("getLogByUsername")
    public String getLogByUsername(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, HttpSession session, Model model){
        PageHelper.startPage(pageNum, 8);
        String username = session.getAttribute("username").toString();
        List<Borrow>borrows = borrowService.getLogByUsername(username);
        PageInfo<Borrow> info = new PageInfo<Borrow>(borrows, 5);
        int[] nums = info.getNavigatepageNums();
        model.addAttribute("info", info);
        model.addAttribute("nums", nums);
        return "myBorrowLog";
    }


    @RequestMapping("/deleteBookById")
    public String deleteBookById(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "id", defaultValue = "1") Integer id) {
        bookService.deleteBookById(id);
        String path = "redirect:fuzzyQueryAllBooks?pageNum=" + pageNum;
        return path;
    }
}
