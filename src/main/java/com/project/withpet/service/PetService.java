package com.project.withpet.service;


import com.project.withpet.dao.PetDAO;
import com.project.withpet.model.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetService {

    @Autowired
    private PetDAO petDAO;

    // 펫 등록
    public void enrollPet(Pet pet) throws Exception {
        petDAO.enrollPet(pet);
    }
    // 펫 리스트

    // 펫 검색

    // 펫 정보 수정

    // 펫 정보 삭제
}
