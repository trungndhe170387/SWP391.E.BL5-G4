/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HaLB
 */
public class Constants {
    private static String PART1_GOOGLE_CLIENT_ID = "782277117461-o1v2psh7r1lu";
    private static String PART2_GOOGLE_CLIENT_ID = "phl71loo5bt2u0hq2svv.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_ID = PART1_GOOGLE_CLIENT_ID + PART2_GOOGLE_CLIENT_ID;

    private static String PART1_GOOGLE_CLIENT_SECRET = "GOCSPX-wEk";
    private static String PART2_GOOGLE_CLIENT_SECRET = "eDhJtC43c59cYz3bLfqD3T6cf";
    public static String GOOGLE_CLIENT_SECRET = PART1_GOOGLE_CLIENT_SECRET + PART2_GOOGLE_CLIENT_SECRET;

    private static String PART1_GOOGLE_REDIRECT_URI = "http://localhost:9999/SWP391.E.BL5-";
    private static String PART2_GOOGLE_REDIRECT_URI = "G4/login";
    public static String GOOGLE_REDIRECT_URI = PART1_GOOGLE_REDIRECT_URI + PART2_GOOGLE_REDIRECT_URI;

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
