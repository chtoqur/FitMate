package test;

import java.util.Arrays;
import java.util.StringTokenizer;

public class test {
	public static void main(String[] args) {
		int[] cnt = new int[50];
		
		StringTokenizer st = new StringTokenizer("1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28");
		
		for(int i = 0; i < 184; i++) {
			cnt[Integer.parseInt(st.nextToken())]++;
		}
		
		System.out.println(Arrays.toString(cnt));
	}
}
