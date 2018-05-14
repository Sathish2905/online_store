/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.helper;

import java.security.MessageDigest;
import java.util.UUID;

/**
 *
 * @author Sathish
 */
public class MD5Hash {

    public static String hash(String args) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(args.getBytes());

        byte byteData[] = md.digest();

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }

    public static String getCode() throws Exception {
        String uuid = UUID.randomUUID().toString();
        return uuid.substring(0, 6).toUpperCase();
    }
}
