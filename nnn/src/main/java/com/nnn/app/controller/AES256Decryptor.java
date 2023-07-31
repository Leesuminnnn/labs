package com.nnn.app.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class AES256Decryptor {
	
	 public static String AESDecrypt256(String encryptedText, String password) throws Exception {

	        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedText);

	        // Set salt value for key derivation function
	        byte[] salt = password.getBytes(StandardCharsets.US_ASCII);

	        // Derive key and iv from password and salt
	        SecretKeySpec secretKey = new SecretKeySpec(
	                deriveKey(password.toCharArray(), salt, 32 + 16),
	                "AES");

	        IvParameterSpec iv = new IvParameterSpec(
	                deriveKey(password.toCharArray(), salt, 16),
	                0,
	                16);

	        // Initialize cipher for decryption
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);

	        // Decrypt encrypted text
	        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);

	        return new String(decryptedBytes, StandardCharsets.UTF_16LE);
	    }

	    private static byte[] deriveKey(char[] password, byte[] salt, int length) throws Exception {
	        // Key derivation function parameters
	        int iterationCount = 1000;
	        int keyLength = length * 8;

	        // Initialize key derivation function with password and salt
	        PBEKeySpec pbeKeySpec = new PBEKeySpec(password, salt, iterationCount, keyLength);
	        SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

	        // Derive key
	        return secretKeyFactory.generateSecret(pbeKeySpec).getEncoded();
	    }

}
