#include <bits/stdc++.h>
using namespace std ;

#define DEBUG 1
#define LOCALTEST 1

vector <vector<int> > G ;
vector<int> nodeSize ;
vector< vector<int> > firstMaxDepthChild ;
vector<int> secondMaxDepthChild ;


//This dfs calculates some other informations about graph as well which can be modified if the question gets modified
int dfs(int node , int par , int depth ){
    //For each node this function finds out the two max Child size
    if( G[node].size() < 2 ){
        //child Node ;
        return nodeSize[node];
    }
    int count = 0 ;
    for( int child : G[node]){
        if( child != par){
            int sz = dfs(child , node ,depth+1) ;
            if( count == 0 ){
                count++;
                nodeSize[node] = sz;
                firstMaxDepthChild[node].push_back(child);
            }
            else{
                if( nodeSize[node] == sz){
                    firstMaxDepthChild[node].push_back(child);
                }
                else if(sz > nodeSize[node]){
                    secondMaxDepthChild[node] = firstMaxDepthChild[node].back();
                    firstMaxDepthChild[node].clear();
                    firstMaxDepthChild[node].push_back(child);
                    nodeSize[node] = sz;
                }
                else{
                    if( sz > secondMaxDepthChild[node]){
                        secondMaxDepthChild[node] = child;
                    }
                }
            }
        }
    }
    return nodeSize[node] = 1 + nodeSize[node];
}

int getCenterWt(int initialNode , int wtOfParentBranch ){
    //Move to the one of the heaviest child
    if(firstMaxDepthChild[initialNode].size() >= 2){
        //this node must be center
        return nodeSize[firstMaxDepthChild[initialNode][0]];
    }

    int heaviestChild = firstMaxDepthChild[initialNode][0];
    int weightOfChild = nodeSize[heaviestChild];
    if( wtOfParentBranch < weightOfChild){
        return getCenterWt(heaviestChild, max(wtOfParentBranch,nodeSize[secondMaxDepthChild[initialNode]]) + 1);
    }
    else{
        return wtOfParentBranch ;
    }
}

int main(){
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    #ifdef LOCALTEST
        freopen("input_for_problem3.txt" , "r" , stdin);
        fstream fin;
        fin.open("output_for_problem3.txt" , ios::in|ios::out);
        freopen("output_for_problem3_by_Code.txt", "w" , stdout);
    #endif
    int t ;
    cin >> t ;
    for( int testcase = 1 ; testcase <= t ; testcase++ ){
        int n , m ;
        cin >> n ;
        m = n-1 ; // number of edges in a tree
        G.clear();
        firstMaxDepthChild.clear();
        secondMaxDepthChild.clear();
        nodeSize.clear();


        G.resize(n+1);
        int x , y ;
        for( int i = 0 ; i < m ; i++ ){
            cin >> x >> y ;
            G[x].push_back(y);
            G[y].push_back(x);
        }

        //edge cases
        int correctAns ;
        fin >> correctAns ;
        if( n == 1){
            cout << 0 << endl;
            continue;
        }
        if( n == 2){
            cout << 1 << endl;
            continue;
        }

        // for more than 2 nodes in tree

        nodeSize.resize(n+1 , 1);
        firstMaxDepthChild.resize(n+1);
        secondMaxDepthChild.resize(n+1 , -1);

        int initialCenter = -1 ;
        for(int i = 1 ; i <= n ; i++ ){
            if (G[i].size() >= 2){
                initialCenter = i ;
                break ;
            }
        }

        dfs(initialCenter, -1 , 0);
        int centerOfTreeDepth = getCenterWt(initialCenter , 1) ;
        cout << "For Testcase #:" << testcase << " " << centerOfTreeDepth << endl;

        if(centerOfTreeDepth != correctAns){
            cout << "For test case " << testcase << "Correct Ans was " << correctAns << endl;
            break;
        }
    }

    return 0;
}

/*

Input format:
N M
followed by M number of lines in form a1 a2

Output foramt
One integer giving the radius of tree

stdin
17
1 3
4 5
5 6
3 2
3 4
7 4
7 8
4 11
11 12
12 13
12 14
14 16
16 17
14 15
2 9
9 10

stdout
5

stdin
6
1 4
2 3
3 4
4 5
5 6

stdout
2

stdin
6
1 3
4 5
5 6
3 2
3 4

stdout
2

stdin
3
1 2
2 3
1

*/