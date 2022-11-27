#include <stdio.h>
#include <math.h>


long long factorial(int n) {
    long long result = 1;
    for (long long i = 2; i <= n; i++) {
        result *= i;
    }
//    if (n == 20)
//        printf("%ld\n", result);
    return result;
}

long double bernoulliNumber(int n) {
    if (n == 0) {
        return 1.0;
    }
    long double semiResult = 0.0;
    long double n1 = factorial(n + 1);
    for (int k = 0; k < n; k++) {
        long double bk = bernoulliNumber(k);
        long double fk = factorial(k);
        long double fn1k = factorial(n + 1 - k);
//        long double x =
        semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
    }
    return 1.0 / (n + 1) * semiResult;
}

//long double bernoulliNumber(int n) {
//    long double results[] = {1.0, -0.5, 0.166666667, 0.0, -0.0333333333, 0.0, 0.0238095238, 0.0, -0.0333333333, 0.0,
//                             0.0757575758, 0.0, -0.253113553, 0.0, 1.16666667, 0.0, -7.09215686, 0.0, 54.9711779, 0.0,
//                             -529.124242, 0.0, 6192.12319, 0.0, -86580.2531, 0.0, 1425517.17, 0.0, -27298231.1, 0.0,
//                             601580874.0, 0.0, -15116315800.0, 0.0, 429614643000.0, 0.0, -13711655200000.0, 0.0,
//                             488332319000000.0, 0.0};
//    return results[n];
//}
//long double bernoulliNumber(int n) {
//    if (n == 0) {
//        return 1.0;
//    }
//    long double semiResult = 0.0;
//    long double n1 = factorial(n + 1);
//    for (int k = 0; k < n; k++) {
//        long double bk = bernoulliNumber(k);
////        long double fk = factorial(k);
////        long double fn1k = factorial(n + 1 - k);
//        semiResult += pow(-1, n + 1 - k) * pascal(n + 1, k) * bk;
//    }
//    return 1.0 / (n + 1) * semiResult;
//}

long double tanhNumber(long double angle, int threshold) {
//    angle = normalize(angle);
    long double result = 0;
    for (int n = 1; n < threshold; n++) {
        int n2 = n * 2;
        result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
    }
    return result;
}

int main() {
    long double angle;
    int maxThreshold = 11;
    scanf("%Lf", &angle);
    for (int threshold = 1; threshold <= maxThreshold; threshold += 1) {
        long double customTanh = tanhNumber(angle, threshold);
        long double mathTanh = tanh(angle);
        if (mathTanh == 0.0) {
            printf("Threshold: %d Diff: %lf%%\n", threshold, 0.0);
            continue;
        }
        long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
        printf("Threshold: %d Diff: %Lf%%\n", threshold, difference);
//        printf("%lf\n", tanh(angle));
    }

//    long double customTanh = tanhNumber(angle, maxThreshold);
//    long double mathTanh = tanh(angle);
//    long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
//    printf("Threshold: %d Diff: %lf%%\n", maxThreshold, difference);
    printf("Bernoulli: tanh(%Lf) = %Lf\n", angle, tanhNumber(angle, maxThreshold));
//    for (int i = 0; i < 20; i++) {
//        printf("%Lf\n", bernoulliNumber(i));
//    }
//    printf("%Lf\n", bernoulliNumber(20));
    printf("Exponent: tanh(%Lf) = %lf\n", angle, tanh(angle));
    return 0;
}
