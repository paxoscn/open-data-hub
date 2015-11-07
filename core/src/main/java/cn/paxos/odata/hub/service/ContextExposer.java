package cn.paxos.odata.hub.service;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class ContextExposer {
	
	public static ApplicationContext applicationContext = null;
	
	@Autowired ApplicationContext context;
	
	@PostConstruct
	public void init(){
		applicationContext = context;
	}

}
