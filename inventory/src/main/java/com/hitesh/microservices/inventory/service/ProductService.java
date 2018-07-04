/**
 * 
 */
package com.hitesh.microservices.inventory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hitesh.microservices.inventory.dto.FullCategoryDTO;
import com.hitesh.microservices.inventory.dto.PrimaryCategoryDTO;
import com.hitesh.microservices.inventory.dto.TertiaryCategoryDTO;
import com.hitesh.microservices.inventory.models.PrimaryCategory;
import com.hitesh.microservices.inventory.models.SecondaryCategory;
import com.hitesh.microservices.inventory.models.TertiaryCategory;
import com.hitesh.microservices.inventory.repository.PrimaryCategoryRepository;
import com.hitesh.microservices.inventory.repository.SecondaryCategoryRepository;
import com.hitesh.microservices.inventory.repository.TertiaryCategoryRepository;

/**
 * @author hitjoshi
 *
 */
@Service
public class ProductService {
	@Autowired
	PrimaryCategoryRepository primaryCategoryRepository;
	
	@Autowired
	SecondaryCategoryRepository secondaryCategoryRepository;
	
	@Autowired
	TertiaryCategoryRepository tertiaryCategoryRepository;
	
	public List<PrimaryCategoryDTO> fetchPrimaryCategories(){
		Iterable<PrimaryCategory> primaryCategories = primaryCategoryRepository.findAll();
		List<PrimaryCategoryDTO> primaryCategoryDTOs = new ArrayList<>();
		for(PrimaryCategory pr: primaryCategories) {
			PrimaryCategoryDTO primaryCategoryDTO = new PrimaryCategoryDTO();
			primaryCategoryDTO.setCategoryId(pr.getId());
			primaryCategoryDTO.setCategoryName(pr.getCategoryName());
			primaryCategoryDTOs.add(primaryCategoryDTO);
		}
		return primaryCategoryDTOs;
	}

	public List<FullCategoryDTO> fetchAllCategoryById(String primaryCategoryId) {
		Long id = Long.parseLong(primaryCategoryId);
		PrimaryCategory primaryCategory = primaryCategoryRepository.findOne(id);
		List<SecondaryCategory> secondaryCategories = secondaryCategoryRepository.findByPrimaryCategory(primaryCategory);
		Map<SecondaryCategory, List<TertiaryCategory>> fullCategoryMap = new HashMap<>();
		for(SecondaryCategory secCategory: secondaryCategories) {
			List<TertiaryCategory> tertiaryCategories = tertiaryCategoryRepository.findBySecondaryCategory(secCategory);
			fullCategoryMap.put(secCategory,tertiaryCategories);
		}
		List<FullCategoryDTO> fullCategoryDTOList = new ArrayList<>();
		for(Map.Entry<SecondaryCategory, List<TertiaryCategory>> entry: fullCategoryMap.entrySet()) {
			FullCategoryDTO fullCategoryDTO = new FullCategoryDTO();
			fullCategoryDTO.setSecondaryCatId(entry.getKey().getId());
			System.out.println(" Sec Category NAME------------     "+entry.getKey().getCategoryName());
			fullCategoryDTO.setSecondaryCatName(entry.getKey().getCategoryName());
			List<TertiaryCategory> tertiaryCategorys = entry.getValue();
			List<TertiaryCategoryDTO> tertiaryCategoryDTOs = convertToDTO(tertiaryCategorys);
			fullCategoryDTO.setTertiaryCategories(tertiaryCategoryDTOs);
			fullCategoryDTOList.add(fullCategoryDTO);
		}
		return fullCategoryDTOList;
	}

	private List<TertiaryCategoryDTO> convertToDTO(List<TertiaryCategory> tertiaryCategorys) {
		List<TertiaryCategoryDTO> tertiaryCategoryDTOs = new ArrayList<>();
		for(TertiaryCategory terCategory: tertiaryCategorys) {
			TertiaryCategoryDTO tertiaryCategoryDTO = new TertiaryCategoryDTO();
			tertiaryCategoryDTO.setId(terCategory.getId());
			tertiaryCategoryDTO.setCategoryName(terCategory.getCategoryName());
			tertiaryCategoryDTOs.add(tertiaryCategoryDTO);
		}
		return tertiaryCategoryDTOs;
	}

}
