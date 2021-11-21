package com.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.dao.NoteDao;
import com.practice.model.Note;

@Service
public class NoteService {
	
	@Autowired
	NoteDao noteDao;
	
	@Transactional
	public void saveNote(String nTitle, String nContent) {
		Note note = new Note(nTitle, nContent);
		this.noteDao.save(note);
	}
	
	public List<Note> getAllNotes() {
		List<Note> list = this.noteDao.getAll();
		return list;
	}

}
