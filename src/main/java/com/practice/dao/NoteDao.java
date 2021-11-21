package com.practice.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.practice.model.Note;

@Component
public class NoteDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int save(Note note) {
		int i = (Integer) hibernateTemplate.save(note);
		return i;
	}
	
	public List<Note> getAll() {
		List<Note> notes = this.hibernateTemplate.loadAll(Note.class);
		return notes;
	}
	
	public void deleteOne(Note note) {
		this.hibernateTemplate.delete(note);
	}
}
