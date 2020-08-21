package com.pj.learn.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
	
	@GetMapping("/")
	public ResponseEntity<?> request1()
	{
		return ResponseEntity.status(HttpStatus.OK).body("request accepted by method request1");
	}
	
	@GetMapping("/secondReq")
	public ResponseEntity<?> request2()
	{
		return ResponseEntity.status(HttpStatus.OK).body("request accepted by method request2");
	}

}
