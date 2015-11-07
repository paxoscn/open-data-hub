package cn.paxos.odata.hub.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.olingo.server.api.ODataHttpHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.paxos.odata.hub.service.ContextExposer;
import cn.paxos.odata.hub.service.ODataService;

public class MainServlet extends HttpServlet
{

  private static final long serialVersionUID = 1L;

  private static final Logger LOG = LoggerFactory.getLogger(MainServlet.class);

  @Override
  protected void service(final HttpServletRequest req,
      final HttpServletResponse resp) throws ServletException, IOException
  {
    resp.setCharacterEncoding("UTF-8");
    ODataService odataService = ContextExposer.applicationContext
        .getBean(ODataService.class);
    ODataHttpHandler handler = odataService.getHandler();
    try
    {
      handler.process(req, resp);
    } catch (Exception e)
    {
      // TODO
      LOG.error("Server Error occurred in MainServlet", e);
      throw new ServletException(e);
    }
  }
  
}
