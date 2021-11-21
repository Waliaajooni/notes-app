package com.practice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practice.model.Note;
import com.practice.service.NoteService;

@Controller
public class HomeController {
	
	@Autowired
	NoteService noteService;
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/home")
	public String addNote(Model m) {
		Note note = new Note();
		m.addAttribute("page", "home");
		m.addAttribute("note", note);
		System.out.println("saving.....");
		
		return "home";
	}
	
	@RequestMapping(value = "/saveNotes", method = RequestMethod.POST)
	public String saveNotes(@ModelAttribute("note") Note nn, Model m) {
		noteService.saveNote(nn.getTitle(), nn.getContent());
		m.addAttribute("note", nn);
		m.addAttribute("page", "viewlist");
		System.out.println(nn.getTitle() + " " + nn.getContent());
		
		return "redirect:/viewlist";
	}
	
	@GetMapping(value = "/viewlist")
	public String notesList(Model m) {
		List<Note> list = noteService.getAllNotes();
		m.addAttribute("notes", list);
		m.addAttribute("page", "viewlist");
		return "home";
	}
}
