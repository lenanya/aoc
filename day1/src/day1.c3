module day1;
import std::io;
import std::math;
import std::collections; 

// part 1
fn void add_smallest(List(<int>) *small, List(<int>) *list1, List(<int>) *list2) {
	int smallest1 = 2 << 25;
	int smallest2 = 2 << 25;
	usz index1 = 0;
	usz index2 = 0;
	foreach (idx, i: list1) {
		if (i < smallest1) {
			smallest1 = i;
			index1 = idx;
 		}
	}
	foreach (idx, i: list2) {
		if (i < smallest2) {
			smallest2 = i;
			index2 = idx;
		}
	}
	list1.remove_at(index1);
	list2.remove_at(index2);

	small.push(math::abs(smallest1 - smallest2));
}



fn int main(String[] args) {
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

	List(<int>) small_sums;
	List(<int>) similarity_scores;

	usz full_length = list1.len();

	for (usz i = 0; i < full_length; ++i) {
		add_smallest(&small_sums, &list1, &list2);
	}

	int sum = 0;
	foreach (i: small_sums) {
		sum += i;
	}

	io::printn(sum);

	return 0;
}
