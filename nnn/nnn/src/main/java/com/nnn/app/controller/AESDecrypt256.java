package com.nnn.app.controller;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.security.spec.KeySpec;
import java.util.Arrays;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

@Component
public class AESDecrypt256 {

	public String aesDecrypt256(String encryptedText) throws Exception {
	    String password = ""; // 비밀번호를 설정하세요.

	    // Base64 디코딩
	    byte[] cipherTextBytes = DatatypeConverter.parseBase64Binary(encryptedText);

	    // Salt 생성 (C# 코드와 동일하게 설정)
	    byte[] salt = Integer.toString(password.length()).getBytes(StandardCharsets.US_ASCII);

	    // SecretKey 생성
	    KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt, 1000, 256 + 128); // 256비트 키와 128비트 IV
	    SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
	    byte[] secretKeyBytes = secretKeyFactory.generateSecret(keySpec).getEncoded();

	    // 키와 IV 분리
	    byte[] keyBytes = Arrays.copyOfRange(secretKeyBytes, 0, 32);
	    byte[] ivBytes = Arrays.copyOfRange(secretKeyBytes, 32, 48);

	    // 복호화
	    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
	    IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);
	    cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
	    byte[] decryptedTextBytes = cipher.doFinal(cipherTextBytes);

	    return new String(decryptedTextBytes, StandardCharsets.UTF_16LE);
	}
}
