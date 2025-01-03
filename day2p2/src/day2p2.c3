module day2;
import std::io;
import std::collections;

def Ilist = List(<int>);

fn bool is_safe(List(<int>) r, bool is_top) {
	int failures = 0;
	bool asc = false;
	if (r[1] > r[0]) {
		asc = true;
	}
	for (usz i = 0; i < r.len() - 1; ++i) {
		if (asc) {
			if (r[i+1] <= r[i]) {
				failures += 1;
			}
			if (r[i+1] - r[i] > 3) {
				failures += 1;
			}
		} else {
			if (r[i+1] >= r[i]) {
				failures += 1;
			}
			if (r[i] - r[i + 1] > 3) {
				failures += 1;
			}
		}
	}
	if (failures >= 1) {
		if (is_top) {
			for (usz j = 0; j < r.len(); ++j) {
				Ilist temp;
				foreach (i: r) {
					temp.push(i);
				}
				temp.remove_at(j);
				if (is_safe(temp, false)) {
					return true;
				}
			}
		}
		return false;
	}
	return true;
}

fn int main(String[] args)
{
	assert(args.len > 1);
	String fp = args[1];
	List(<Ilist>) reports;
	String input = (String)file::load_temp(fp)!!;
	String[] input_split = input.split("\n");
	foreach (i: input_split) {
		List(<int>) vals;
		String[] values = i.split(" ");
		foreach (v: values) {
			vals.push(v.to_int()!!);
		}
		reports.push(vals);
	}
	int sum = 0;
	foreach (r: reports) {
		if (is_safe(r, true)) {
			sum += 1;
		}
	}

	io::printn(sum);

	return 0;
}
