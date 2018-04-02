package com.shekar.spring.myvalidators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shekar.spring.models.Car;

@Component
@PropertySource("classpath:validations.properties")
public class AddCarValidation implements Validator {
	@Autowired
	private Environment en;

	@Override
	public boolean supports(Class<?> obj) {
		// TODO Auto-generated method stub
		return Car.class.equals(obj);
	}

	@Override
	public void validate(Object obj, Errors err) {
		ValidationUtils.rejectIfEmpty(err,"id", "id.empty", en.getProperty("id"));
		ValidationUtils.rejectIfEmpty(err, "name", "name.empty", en.getProperty("name"));
		ValidationUtils.rejectIfEmpty(err, "model", "model.empty", en.getProperty("model"));
		ValidationUtils.rejectIfEmpty(err, "maker", "maker.empty", en.getProperty("maker"));
		ValidationUtils.rejectIfEmpty(err, "category", "category.empty", en.getProperty("category"));
		ValidationUtils.rejectIfEmpty(err, "rentPerDay", "rentPerDay.empty", en.getProperty("rentPerDay"));

	}

}
