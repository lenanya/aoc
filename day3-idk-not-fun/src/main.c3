module day3;
import std::io;
import std::collections;

char[] numeric = {
	'0','1','2','3','4','5','6','7','8','9'
};

fn bool is_numeric(char c) {
	foreach (n: numeric) {
		if (c == n) return true;
	}
	return false;
}

fn int main(String[] args)
{
	assert(args.len > 1);
	String fp = args[1];
	String input = (String)file::load_temp(fp)!!;
	bool m = false;
	bool u = false;
	bool l = false;
	int i1, i2;
	List(<char>) i1l, i2l;
	bool open = false;
	bool comma = false;
	bool closed = false;

	int result;

	foreach (i: input) {
		switch {
			case !m: 
				switch (i) {
					case 'm': m = true;
					default: m = false;
				}
			case m && !u: 
				switch (i) {
					case 'u': u = true;
					default: 
						m = false;
						u = false;
				}
			case m && u && !l:
				switch (i) {
					case 'l': l = true;
					default:
						m = false;
						u = false;
						l = false;
				}
			case m && u && l:
				switch (i) {
					case '(': open = true;
					default:
						m = false;
						u = false;
						l = false;
						open = false;
				}
			case m && u && l && open && i1l.len() < 3 && !comma:
				switch {
					case i.is_digit():
						i1l.push(i);
					case i == ',' && i1l.len() > 0:
						comma = true;
					default:
						m = false;
						u = false;
						l = false;
						open = false;
						i1l.clear();
				}
			case m && u && l && open && comma && i2l.len() < 3:
				switch {
					case i.is_digit():
						i2l.push(i);
					default:
						m = false;
						u = false;
						l = false;
						open = false;
						comma = false;
						i1l.clear();
						i2l.clear();
				}
			case m && u && l && open && comma && i == ')':
				switch {
					case i1l.len() == 1:
						i1 = i1l.get(0) - 0x30;
						io::printn(i1);
					case i1l.len() == 2:
						i1 = i1l.get(0) - 0x30;
						io::printn(i1);

				}				
				m = false;
				u = false;
				l = false;
				open = false;
				comma = false;
				i1l.clear();
				i2l.clear();
		}	
	}



	return 0;
} 