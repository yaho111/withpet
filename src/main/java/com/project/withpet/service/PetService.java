package com.project.withpet.service;


import com.project.withpet.dao.PetDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetService {

    @Autowired
    private PetDAO petDAO;


}
