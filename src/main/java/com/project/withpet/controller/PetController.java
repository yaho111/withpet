package com.project.withpet.controller;

import com.project.withpet.model.Pet;
import com.project.withpet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

@Controller
public class PetController {

    @Autowired
    private PetService petService;

    // 펫 등록 페이지
    @RequestMapping(value = "/petEnrollForm")
    public String forwardPetEnrollForm() {
        return "pet/petEnrollForm";
    }

    // 펫 등록
    @RequestMapping(value = "/enrollPet", method = RequestMethod.POST)
    public String enrollPet(@RequestParam("petProfile") MultipartFile multipartFile,
                            @ModelAttribute Pet pet,
                            HttpServletRequest request,
                            Model model) throws Exception {
        String fileName = multipartFile.getOriginalFilename();
        int size = (int) multipartFile.getSize();
        int result = 0;

        String path = request.getRealPath("upload/pet");
        System.out.println("path" + path);
        System.out.println(pet.getPet_birth());
        String[] file;
        String newFileName = "";

        // 파일이 전송된 경우
        if (fileName != "") {

            file = fileName.split("\\.");

            String extension = "." + file[1];

            UUID uuid = UUID.randomUUID();

            newFileName = uuid + extension;
            System.out.println(newFileName);

            if (size > 1000000) { // 파일크기가 지정 한도를 초과하는 경우
                result = 1;
                model.addAttribute("result", result);

                return "pet/uploadResult";
            } else if (!file[1].equals("jpg") &&
                    !file[1].equals("gif") &&
                    !file[1].equals("png")) { // 파일의 확장자가 가능한 확장자가 아닌 경우

                result = 2;
                model.addAttribute("result", result);

                return "pet/uploadResult";
            }


        }

        if (size > 0) {
            multipartFile.transferTo(new File(path + "/" + newFileName));
            pet.setPet_photo(newFileName);
        }

        petService.enrollPet(pet);

        return "redirect:myPage";
    }

    // 펫 정보 수정 페이지
    @RequestMapping(value = "/petUpdateForm")
    public String forwardPetUpdateForm(HttpServletRequest request, Pet pet, Model model) throws Exception {
        int pet_no = Integer.parseInt(request.getParameter("pet_no"));

        Pet selectedPet = petService.selectPet(pet_no);

        model.addAttribute("selectedPet", selectedPet);

        return "pet/petUpdateForm";
    }

    // 펫 정보 수정
    @RequestMapping(value = "/updatePet")
    public String updatePet(@ModelAttribute Pet pet,
                            HttpServletRequest request,
                            @RequestParam("petProfile") MultipartFile multipartFile,
                            Model model) throws Exception {

        String fileName = multipartFile.getOriginalFilename();
        int size = (int) multipartFile.getSize();
        int result = 0;

        String path = request.getRealPath("upload/pet");
        System.out.println("path" + path);

        int pet_no = Integer.parseInt(request.getParameter("pet_no"));

        Pet selectedPet = petService.selectPet(pet_no);
        String[] file;
        String newFileName = "";

        // 파일이 전송된 경우
        if (fileName != "") {

            file = fileName.split("\\.");

            String extension = "." + file[1];

            UUID uuid = UUID.randomUUID();

            newFileName = uuid + extension;
            System.out.println(newFileName);

            if (size > 1000000) { // 파일크기가 지정 한도를 초과하는 경우
                result = 1;
                model.addAttribute("result", result);

                return "pet/uploadResult";
            } else if (!file[1].equals("jpg") &&
                    !file[1].equals("gif") &&
                    !file[1].equals("png")) { // 파일의 확장자가 가능한 확장자가 아닌 경우

                result = 2;
                model.addAttribute("result", result);

                return "pet/uploadResult";
            }


        }

        if (size > 0) {
            String originalProfile = selectedPet.getPet_photo();
            if(originalProfile != null){
                File needToDelete = new File(path + "/" + originalProfile);
                needToDelete.delete();
            }
            multipartFile.transferTo(new File(path + "/" + newFileName));
            pet.setPet_photo(newFileName);
        } else {
            pet.setPet_photo(selectedPet.getPet_photo());
        }

        petService.updatePet(pet);

        return "redirect:myPage";
    }

    // 펫 삭제
    @RequestMapping(value = "/deletePet")
    public String deletePet(HttpServletRequest request, HttpSession session) throws Exception{

        int pet_no = Integer.parseInt(request.getParameter("pet_no"));
        String path = session.getServletContext().getRealPath("upload/pet");

        Pet selectPet = petService.selectPet(pet_no);

        String petProfile = selectPet.getPet_photo();

        if(petProfile != null) {
            File needToDelete = new File(path + "/" + petProfile);
            needToDelete.delete();
        }

        petService.deletePet(pet_no);

        return "redirect:myPage";
    }
}
