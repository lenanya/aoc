module day1p2;
import std::io;
import std::math;
import std::collections; 

fn void similarity(List(<int>) *sim, List(<int>) *list1, List(<int>) *list2) {
	foreach (i: list1) {
		int sim1 = 0;
		foreach (j: list2) {
			if (i == j) {
				sim1 += 1;
			}
		}
		if (sim1 > 0) {
			sim.push(i * sim1);
		}
	}
}

fn int main(String[] args)
{
	assert(args.len > 1);
	String fp = args[1];
	List(<int>) list1;
	List(<int>) list2;
	String input = (String)file::load_temp(fp)!!;
	String[] input_split = input.split("\n");
	List(<String>) numbers;
	foreach (i: input_split) {
		String[] nums = i.split("   ");
		list1.push(nums[0].to_int()!!);
		list2.push(nums[1].to_int()!!);
	}

	//List(<int>) list1;
	//List(<int>) list2;

	//list1.add_array({3,4,2,1,3,3});
	//list2.add_array({4,3,5,3,9,3});

	List(<int>) small_sums;
	List(<int>) similarity_scores;

	usz full_length = list1.len();

	similarity(&similarity_scores, &list1, &list2);

	int sum = 0;
	foreach (i: similarity_scores) {
		sum += i;
	}

	io::printn(sum);

	return 0;
}