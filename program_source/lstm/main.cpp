#include <iostream>
#include <ap_fixed.h>
typedef ap_fixed<8,2> FIX_TYPE;
#define SEQ_LENGTH 59
#define NUM_UNITS 5

void lstm(FIX_TYPE inputs_DRAM[SEQ_LENGTH], FIX_TYPE w_array_DRAM[NUM_UNITS * 4], FIX_TYPE w_bias_DRAM[NUM_UNITS * 4],
                     FIX_TYPE u_array_DRAM[NUM_UNITS][NUM_UNITS * 4], FIX_TYPE u_bias_DRAM[NUM_UNITS * 4],
                     FIX_TYPE dense_weights_DRAM[NUM_UNITS], FIX_TYPE dense_bias_DRAM[1], FIX_TYPE result[1]);
int main()
{
		FIX_TYPE inputs[SEQ_LENGTH]{ 0.2068069 ,  0.25029544,  0.24887733,  0.24296857,  0.24982274,
	        0.28267549,  0.24698653,  0.24533207,  0.21886079,  0.21295202,
	        0.23398724,  0.20397069,  0.20302529,  0.20893406,  0.18151737,
	        0.17229969,  0.16520917,  0.19664382,  0.1895533 ,  0.17773576,
	        0.19286221,  0.19309856,  0.19309856,  0.21082486,  0.23989601,
	        0.18033562,  0.10588513,  0.16450012,  0.10848499,  0.06877807,
	        0.10541243,  0.06405105,  0.08744978,  0.07799575,  0.10233987,
	        0.11533916,  0.09004963,  0.06735996,  0.13022926,  0.16450012,
	        0.16048216,  0.17726306,  0.14913732,  0.12313874,  0.13731978,
	        0.13259277,  0.10564878,  0.13590168,  0.08555897,  0.07421413,
	        0.06145119,  0.07799575,  0.08508627, -0.00614512,  0.00590877,
	        0.01205389, -0.0307256 , -0.00945403, -0.00283621};

	    // array of input weights
	    FIX_TYPE w_array[NUM_UNITS * 4]{3.1927e-01,  5.9976e-01,  7.2024e-04, -4.3862e-01,  2.8494e-02,
	         -7.3467e-03,  3.5130e-01,  2.6407e-01, -2.9420e-01, -1.4218e-01,
	          3.2201e-02, -6.7983e-03,  5.8878e-01, -3.4760e-01, -6.1265e-01,
	          3.2612e-01,  3.0928e-01, -1.5461e-01, -8.3726e-01, -4.3657e-01};

	    // bias array
	    FIX_TYPE w_bias[NUM_UNITS * 4]{-0.0627, -0.2253,  0.6487,  0.5841,  0.2456,  0.1946,  0.2595,  0.0959,
	         0.0924,  0.5907, -0.4607, -0.3543, -0.3535,  0.3288,  0.2011, -0.1089,
	        -0.4042,  0.3502,  0.2061,  0.4977};

	    // array of hidden-state t-1 weights
	    FIX_TYPE u_array[NUM_UNITS][NUM_UNITS * 4] = {{ 0.2176, -0.1670, -0.1695, -0.2123, -0.4221,  0.0361,  0.0035, -0.4748,
												         -0.1537, -0.6968,  0.5124,  0.0308,  0.5270,  0.2991, -0.0756, -0.0890,
												          0.2103,  0.1678,  0.1906, -0.2094},
	    												{ 0.0502, -0.0752, -0.4829,  0.2084, -0.0333,  0.0539, -0.0986,  0.3026,
												          0.3542, -0.1276, -0.3689,  0.1378,  0.1800, -0.0721,  0.2803, -0.0441,
												          0.5178, -0.1790, -0.3895,  0.0026},
														  { 0.2281,  0.4983,  0.0831, -0.5448, -0.0586,  0.4054,  0.4267,  0.2623,
												         -0.3723, -0.3448, -0.7352, -0.3908,  0.1475, -0.1336, -0.5008,  0.4588,
												          0.1616, -0.0078, -0.1030,  0.0366},
												        {-0.0745, -0.1701, -0.0635,  0.4162,  0.6858, -0.3404, -0.0803, -0.1431,
												          0.4055,  0.0648,  0.0404, -0.6385,  0.1033,  0.1331, -0.4016, -0.0468,
												         -0.3028, -0.0154,  0.5838, -0.0368},
												        {-0.4295, -0.5907, -0.2255,  0.4945,  0.1347, -0.0086, -0.0286, -0.0754,
												         -0.0084,  0.2629,  0.6876,  0.1491, -0.2378,  0.7754, -0.0644, -0.7541,
												          0.0241,  0.1209,  0.0328,  0.3523}};

	    // hh bias
	    FIX_TYPE u_bias[NUM_UNITS * 4]{-0.2093, -0.4099, -0.1789, -0.2214, -0.1196,  0.3726, -0.4054, -0.0364,
	         0.1041, -0.1340, -0.3091, -0.0559,  0.1497,  0.1903, -0.1369, -0.2525,
	        -0.0602,  0.1148,  0.1511,  0.6251};

	    FIX_TYPE dense_weights[NUM_UNITS] = {-0.3181, -0.2020,  0.2817, -0.5367, -0.8218};
	    FIX_TYPE dense_bias[1]{0.2035};

	    // Call LSTM inference function
	    FIX_TYPE result[1]{0};
	    lstm(inputs, w_array, w_bias, u_array, u_bias, dense_weights, dense_bias, result);

	    double double_result = (double)result[0];
	    double inversed_result = (double_result+3.40463247)/0.02363507;
	    double actual{144.83};

	    std::cout << "****LSTM Inference Result: " << inversed_result << '\n';
	    std::cout << "****Difference: " << (inversed_result-actual)/actual*100 << "%" << '\n';
		if ((inversed_result-actual)/actual*100 < 0.1) {
			std::cout << "PASSED ALL TESTS!\n";
		} else {
			std::cout << "FAILED TESTS!\n";
		}

        return 0;
}
