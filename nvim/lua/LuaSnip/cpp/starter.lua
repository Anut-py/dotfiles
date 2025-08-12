starter = [[
#include <bits/stdc++.h>

using namespace std;
using ld = long double;
#define int long long
#define V vector

const int inf = numeric_limits<int>::max();
const ld infd = numeric_limits<ld>::infinity();

#define F first
#define S second
#define PB push_back
#define read(arr) for (auto &x : arr) cin >> x
#define show(arr) for (auto x : arr) cout << x << " "; cout << endl
#define FOR(v,l,h) for (int v = l; v < h; v ++)

signed main() {{
    {}
}}
]]

point = [[
class P { public: ld x, y; };
P operator+(const P &a, const P &b) { return {a.x + b.x, a.y + b.y}; }
P operator-(const P &a, const P &b) { return {a.x - b.x, a.y - b.y}; }
P operator-(const P &a) { return {-a.x, -a.y}; }
P operator*(const P &a, const P &b) { return {a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x}; }
P operator*(const P &a, const ld b) { return {a.x * b, a.y * b}; }
P operator/(const P &a, const ld b) { return {a.x / b, a.y / b}; }
P conj(const P &a) { return {a.x, -a.y}; }
ld abs(const P &a) { return sqrt(a.x * a.x + a.y * a.y); }
ld dist(const P &a, const P &b) { ld d1 = a.x - b.x, d2 = a.y - b.y; return sqrt(d1 * d1 + d2 * d2); }
bool cmpx(const P &a, const P &b) { return a.x < b.x || (a.x == b.x && a.y < b.y); }
bool cmpy(const P &a, const P &b) { return a.y < b.y || (a.y == b.y && a.x < b.x); }
ld dot(const P &a, const P &b) { return (conj(a) * b).x; }
ld cross(const P &a, const P &b) { return (conj(a) * b).y; }
]]

complex = [[
typedef complex<ld> P;
typedef complex<int> Pi;
#define X real()
#define Y imag()

bool cmpx(const P &a, const P &b) { return a.X < b.X || (a.X == b.X && a.Y < b.Y); }
bool cmpy(const P &a, const P &b) { return a.Y < b.Y || (a.Y == b.Y && a.X < b.X); }
]]

fio = [[
#define filename "<>"
ifstream fin(filename ".in");
ofstream fout(filename ".out");
]]

return {
    s("ss", fmt(starter, {i(1)})),
    s("fio", fmta(fio, {i(1)})),
    s("pp", t(vim.split(point, "\n", {plain = true}))),
    s("cc", t(vim.split(complex, "\n", {plain = true}))),
}
