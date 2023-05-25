/*
interval: số ngày đi nô đùa
hourStart: giờ đi
hourEnd: giờ về
id: id của địa điểm, không phải name
duration: thời gian nô đùa tại 1 địa điểm
*/

//[diem_choi]: id,price,duration,openhour,closehour     //dau phay giua cac field
//[diem_an]: id,price,duration,openhour,closehour


//input:
    //budget interval hourstart hourend     //khong co dau phay
    //[diem_choi#1]     
    //[diem_an#1]
    //[diem_choi#2]
    //[diem_an#2]
    //...

#include <bits/stdc++.h>
using namespace std;

#define all(x) x.begin(), x.end()
#define pb push_back


struct place {
    string id;
    double price;
    double duration;
    int openHour;
    int closeHour;
};

ostream &operator<<(ostream &os, const place &source) {
    os << source.id << "," << source.price << "," << source.duration << "," << source.openHour << "," << source.closeHour;
    return os;
}

bool operator==(const place &obj1, const place &obj2) {
    return obj1.id == obj2.id;
}

//3 mode:
//  +0: not enough budget -> remove
//  +1: not enough time -> reserve for later checks
//  +2: valid -> add to file

int isValid(const double &budget, const double &tmpTime, const place &src) {
    bool cond1 = src.price > budget;
    bool cond2 = src.duration > tmpTime;
    if (cond1) return 0;
    if (!cond1 && cond2) return 1;
    return 2; 
}

int main() {
    ifstream ifile {"input.txt"};
    int interval;
    double budget, hourStart, hourEnd;
    ifile >> budget >> interval >> hourStart >> hourEnd;
    vector<pair<place, place>> list;
    string placeHolder;
    getline(ifile, placeHolder);
    while (!ifile.eof()) {
        place tmp1, tmp2;
        getline(ifile, tmp1.id, ',');
        getline(ifile, placeHolder, ',');
        tmp1.price = stod(placeHolder);
        getline(ifile, placeHolder, ',');
        tmp1.duration = stod(placeHolder);
        getline(ifile, placeHolder, ',');
        tmp1.openHour = stod(placeHolder);
        getline(ifile, placeHolder);
        tmp1.closeHour = stod(placeHolder);
        getline(ifile, tmp2.id, ',');
        getline(ifile, placeHolder, ',');
        tmp2.price = stod(placeHolder);
        getline(ifile, placeHolder, ',');
        tmp2.duration = stod(placeHolder);
        getline(ifile, placeHolder, ',');
        tmp2.openHour = stod(placeHolder);
        getline(ifile, placeHolder);
        tmp2.closeHour = stod(placeHolder);
        if (tmp1.closeHour < hourStart+tmp1.duration || tmp1.duration > hourEnd-hourStart) 
            continue;
        list.pb(pair<place, place>(tmp1, tmp2));
    }
    ofstream ofile {"output.txt"};
    double tmpTime = hourEnd-hourStart;
    while (interval-- && !list.empty()) {
        for (int i = 0; i < list.size(); i++) {
            int firstRes = isValid(budget, tmpTime, list[i].first);
            if (firstRes == 0) {
                list.erase(i+list.begin());
                i--;
                continue;
            }
            else if (firstRes == 1) {
                continue;
            }
            else {
                ofile << list[i].first << endl;
                budget -= list[i].first.price;
                tmpTime -= list[i].first.duration;
                if (isValid(budget, tmpTime, list[i].second) == 2) {
                    ofile << list[i].second << endl;
                    budget -= list[i].second.price;
                    tmpTime -= list[i].second.duration;
                }
                list.erase(i+list.begin());
                i--;
                continue;
            }
        }
        tmpTime = hourEnd - hourStart;
        ofile << "&&" << endl;
    }
    ifile.close();
    ofile.close();
}