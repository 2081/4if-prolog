#include <set>
#include <utility>
#include <iostream>
#include <string>
#include <fstream>
#include <iomanip>

using namespace std;

int main()
{
	/*
		ICI
		Si il y a un argument, prendre ça comme path au lieu de plateau.txt,
		Comme ça on peut drag and drop un txt sur l'exe et ça génére le plateau.
	*/

	set<pair<double,double> > points;
	set<pair<int,int> > centres;
	ifstream entree;
	ofstream sortie;
	string ligneCourante;
	entree.open("plateau.txt");
	sortie.open("plateau.pl");
	char** carte;
	int largeurCarte,hauteurCarte;
	string points_list="free_lines([";
	hauteurCarte=0;
	while(getline(entree,ligneCourante))
	{
		largeurCarte=ligneCourante.length();
		hauteurCarte++;
	}
	entree.close();
	entree.open("plateau.txt");
	carte=new char*[largeurCarte];
	for(int i=0;i<largeurCarte;i++)
	{
		carte[i]=new char[hauteurCarte];
	}
	for(int i=0;i<hauteurCarte;i++)
	{
		getline(entree,ligneCourante);
		for(int j=0;j<largeurCarte;j++)
		{
			carte[j][i]=ligneCourante.at(j);
		}
	}
	for(int i=0;i<largeurCarte;i++)
	{
		for(int j=0;j<hauteurCarte;j++)
		{
			if(carte[i][j]=='.')
			{
				centres.insert(make_pair(i,j));
				points.insert(make_pair(i-0.5,j));
				points.insert(make_pair(i+0.5,j));
				points.insert(make_pair(i,j-0.5));
				points.insert(make_pair(i,j+0.5));

			}
		}
	}
	sortie<<fixed<<"centers([["<<setprecision(1)<<(centres.begin())->first<<","<<(centres.begin())->second<<"]";
	for(set<pair<int,int> >::iterator iCentre = ++centres.begin();iCentre!=centres.end();iCentre++)
	{
		sortie<<",["<<iCentre->first<<","<<iCentre->second<<"]";
	}
	sortie<<"])."<<endl;

	sortie<<"free_lines([["<<(points.begin())->first<<","<<(points.begin())->second<<"]";
	for(set<pair<double,double> >::iterator iCentre = ++points.begin();iCentre!=points.end();iCentre++)
	{
		sortie<<",["<<iCentre->first<<","<<iCentre->second<<"]";
	}
	sortie<<"])."<<endl;
	sortie<<"width_board("<<largeurCarte<<")."<<endl;
	sortie<<"height_board("<<hauteurCarte<<")."<<endl;
	entree.close();
	sortie.close();
	return 0;
}
