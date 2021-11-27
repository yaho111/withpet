package com.project.withpet.service;


import com.project.withpet.dao.PetDAO;
import com.project.withpet.model.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetService {

    @Autowired
    private PetDAO petDAO;

    // 펫 등록
    public void enrollPet(Pet pet) throws Exception {
        petDAO.enrollPet(pet);
    }
    // 펫 리스트
    public List<Pet> selectPetList(String pet_parent) throws Exception {
        return petDAO.selectPetList(pet_parent);
    }

    // 펫 검색
    public Pet selectPet(int pet_no) throws Exception {
        return petDAO.selectPet(pet_no);
    }

    // 펫 정보 수정
    public void updatePet(Pet pet) throws Exception {
        petDAO.updatePet(pet);
    }

    // 펫 정보 삭제
    public void deletePet(int pet_no) throws Exception {
        petDAO.deletePet(pet_no);
    }
}
