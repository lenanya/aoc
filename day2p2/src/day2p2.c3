module day2;
import std::io;
import std::collections;

def Ilist = List(<int>);

fn bool is_safe(List(<int>) r, bool is_top) {
	int failures = 0;
	bool asc = r[1] > r[0];
	for (usz i = 0; i < r.len() - 1; ++i) {
		switch {
			case asc && r[i+1] <= r[i]: failures++;
			case asc && r[i+1] - r[i] > 3: failures++;
			case !asc && r[i+1] >= r[i]: failures++;
			case !asc && r[i] - r[i+1] > 3: failures++;
		}
	}

	switch {
		case failures && is_top: 
			for (usz j = 0; j < r.len(); ++j) {
				Ilist temp;
				foreach (idx, i: r) {
					if (idx != j) temp.push(i);
				}
				if (is_safe(temp, is_top=false)) return true;
			}
			return false;
		case failures && !is_top: return false;
		default: return true;
	}
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
		if (is_safe(r, is_top=true)) sum++;
	}

	io::printn(sum);

	return 0;
}
