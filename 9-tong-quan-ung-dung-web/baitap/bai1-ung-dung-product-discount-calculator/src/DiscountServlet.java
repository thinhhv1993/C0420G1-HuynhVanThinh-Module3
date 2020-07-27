import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", urlPatterns = "/discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double ListPrice = Double.parseDouble(request.getParameter("listprice"));
        Double Discount = Double.parseDouble(request.getParameter("discount"));

        Double DiscountAmount = ListPrice * Discount * 0.01;
        Double DiscountPrice = DiscountAmount + ListPrice;

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");

        printWriter.println("DiscountAmount : " + DiscountAmount);
        printWriter.println("DiscountPrice : " + DiscountPrice);

        printWriter.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
