#### Incompleto en el Drive de guido, deberia estar completo en el de Gonza.

[drive de gonzi](https://drive.google.com/drive/folders/126kdIOLQRDSRwNQLQcC4h4vzVaJuZJnF)

Se puso a hacer ejercicios de [mutex](http://materias.fi.uba.ar/7508/Slides/11EL-ExcMutua-Estructuras.pdf).

- Ejercicio de Parejas, que solo entren de a pares A y B. Que no entre ningún B sin ningún A.

- Ejercicio de tipo Barrier, solo un grupo de N puede entrar en la sección critica, al salir ese grupo debe poder entrar otro.

- Ejemplo tipo Switch, el primer proceso prende la luz y el ultimo la apaga. O el sentido de un puente, etc.


#### Parejas : 

A la sección critica ingresan solo parejas, de tipo `A` y tipo `B` . 
Se nos da el siguiente header (status.h)

```cpp
class status {
    int procA;
    int procB;
public:
    status(){};
    void inicializa(){
        procA=0; 
        procB=0;
    }
    int getProcA(){return procA;}
    int getProcB(){return procB;}
    void llegaA(){procA++;}
    void llegaB(){procB++;}
    void entraA(){procA--;}
    void entraB(){procB--;}
    friend ostream& operator<<(ostream&os, status s){
    return os<<"(procA="<<s.getProcA()<<
    ", procB="<<s.getProcB()<<")";}
};
```

Los procesos de un tipo se van acolando, hasta que aparezca un compañero del otro bando. Cuando aparece uno entran juntos.

Vamos a tener un semáforo para los procesos `A` y uno para los procesos `B`. Donde los procesos que entran se va.

```cpp
using namespace std;

int main(int argc, char *argv[]) {
	string tipo="A";
	sv_sem mutex("Mutex");
	sv_sem entraA("EntraA");
	sv_sem entraB("EntraB");
	status * estado; 
	sv_shm area("Area_Estado");
	estado= reinterpret_cast<status *> (area.map(sizeof (status)));
	// Comienza el intento de entrar
	cout<<entraA<<endl<<entraB<<endl<<*estado<<endl;
	mutex.wait();
		if (estado->getProcB()==0){   // no tiene camarada
			estado->llegaA();     // se anota
		}
		else {     // hay al menos un B esperando
			estado->entraB();  // lo descuenta
			entraB.post();  // lo libera
			entraA.post();  // abre su puerta
		}
	mutex.post();
	cout<<"Proceso tipo A listo para entrar. "<<
		endl<<" estado="<<* estado<<endl; 
	entraA.wait();
	cout<<"Proceso tipo A en la Seccion Critica ..."<<endl;
	string aux; cin>>aux; 
	cout<<"Proceso tipo A termina "<<endl;
}
```

#### Barreras : 

Permite que a la sección critica solo entren de a grupo de n, ademas permite que un solo grupo este en la sección critica. (Asi se hace el de a pares de los parciales)

Ahi nos viene el header de barrier : 

```cpp
class vals{;
    int grupo; int en_cola; int adentro;
public:
    vals():adentro(0),en_cola(0),grupo(0){};
    int getAdentro(){return adentro;}
    int getEnCola(){return en_cola;}
    int getGrupo(){return grupo;}

    bool hayGrupo(){return en_cola>=grupo;}
    bool hayLugar(){return hayGrupo() and adentro==0;}
    void encolar(){en_cola++;}
    void pasar(){en_cola-=grupo; adentro=grupo;}
    void salir(){adentro--;}
    void inicializa(int c=0, int q=0, int a=0){
    grupo=c; en_cola=q; adentro=a;}
    friend ostream& operator<<(ostream& os, vals v){...
};
```

Deja entrar a grupo de N, espera a que salgan todos para dejar entrar a otros.

Si nos fijamos los métodos que nos da nos permite abstraernos de todos los problemas de barrier.
 

 El primer paso es inicializar : 
```cpp
int main(int argc, char*argv[]){
    if (argc<3) {
        cerr<<"Uso: "<<argv[0]<<
    " <Nombre-Barrera> <procesos en la SC>"<<endl;
    exit(1);
    }
    string clave=argv[1];
    int num=stoi(argv[2]);
    sv_sem semBar= sv_sem(clave,0); // barrera cerrada
    sv_sem mutex= sv_sem(clave+"_mutex",1); // mutex abierto.
    sv_shm memBar=sv_shm(clave);
    cout<<semBar<<endl<<mutex<<endl;
    vals* p_vals=reinterpret_cast<vals*>(memBar.map(sizeof(vals)));
    p_vals->inicializa(num,0,0); // grupos de num
    cout<<"Creado el grupo "<<memBar<<" con valores "<<* p_vals<<endl;
}
 ```

 Vamos a tener 3 estructuras compartidas, un SemBar que va a ser el semaforo compartido para la barrera,un Mutex que va a ser la exclusión mutua entre  operadores y un MemBar que va a guardar el estado de la barrera.

 Vamos al proceso principal : 

Tenemos las rutinas :
```cpp
void abre(vals *p_vals, sv_sem semBar){
    for(int i=0; i<p_vals->getGrupo();i++){
        semBar.post();}
        p_vals->pasar();
}
void entrar(sv_sem mutex, vals *p_vals, sv_sem semBar) {
    mutex.wait();
    p_vals->encolar();
    if (p_vals->hayLugar(){
        abre(p_vals,semBar);
    }
    mutex.post();
    semBar.wait();
}

void salir(sv_sem mutex, vals *p_vals, sv_sem semBar) {
    mutex.wait();
    p_vals->salir();
    if (p_vals->hayLugar()){
        abre(p_vals,semBar);
    }
    mutex.post();
}
```

y el código principal nos queda como : 

```cpp
int main(int argc, char * argv[]) {
    if (argc<3) {
        cerr<<"Uso: "<<argv[0]<<"<Nombre del proceso> <Nombre-Barrera> "<<endl;
        exit(1);
    }
    string nom=argv[1]; string clave=argv[2];
    string rta;
    sv_sem semBar= sv_sem(clave); // barrera
    sv_sem mutex= sv_sem(clave+"_mutex"); // mutex
    sv_shm memBar=sv_shm(clave);
    vals* p_vals=reinterpret_cast<vals*>(memBar.map(sizeof(vals)));
    cout<<"Recursos"<<endl;
    cout<<semBar<<endl<<mutex<<endl<<memBar<<" "<<*p_vals<<endl;
    cout<<nom<<" entrando a la seccion critica."<<endl;
    entrar(mutex,p_vals,semBar);
    cout<<nom<< " en la seccion critica..."<<endl;
    cin>>rta;
    salir(mutex,p_vals,semBar);
    cout<<nom<<" termina."<<endl;
}
```
Perfecto, este quedo entendido.
También tenemos la clase barrera, que nos deja abstraernos mejor.

#### Switch :
Es una estructura donde el primer proceso abre el paso a la
 sección critica y el ultimo lo cierra. La sección critica admite un numero (finito o infinito)
 de procesos de este tipo. Suele haber un segundo tipo de procesos que no puede ser admitido en la sección critica al mismo tiempo que el resto.

 Si cuando se va el contador queda en 0 apaga la luz. Si esta en 1 la prende(fue el primero)

 ```cpp
 typedef struct {int n;} conta;

class elSwitch{
	string clave;
	sv_sem miMutex;
	sv_shm datos;
	conta *p_cont;
  public:
	elSwitch(string k){
		clave=k;
		string clave_mutex=clave+"_mutex";
		string clave_shm=clave+"_shm";
		miMutex=sv_sem(clave_mutex);
		datos=sv_shm(clave_shm);
		p_cont=reinterpret_cast<conta*>(datos.map(sizeof(conta)));
	   // p_cont->n=0; 
		cout<<"Tomado "<<miMutex<<endl;
		cout<< "Tomado "<<datos<<" con valor "<<p_cont->n<<endl;
	}
	void entra(sv_sem semaf){
		miMutex.wait();
		p_cont->n++;
		cout<< "Soy el numero "<<p_cont->n<<endl;
		if (p_cont->n==1) semaf.wait();
		miMutex.post();
	}
	 void sale(sv_sem semaf){
		miMutex.wait();
		p_cont->n--;
		cout<< "Soy el numero "<<p_cont->n<<endl;
		if (p_cont->n==0) semaf.post();
		miMutex.post();
	}
	void del(){
		cout<<"Borrando "<<miMutex<<endl;
		miMutex.del();
		cout <<"Liberando "<<datos<<endl;
		datos.del();
	}
    friend ostream& operator<<(ostream& os, elSwitch s){
	return os<<"("<<s.clave<<", val="<<s.p_cont->n<<", miMutex= "<<s.miMutex<<")"<<endl;
  	}	
};
 ```

 y luego tenemos dos tipos de procesos, el que entra de a muchos : 

 ```cpp
    int main(int argc, char * argv[]){
    string rta;
    sv_sem semSala("SemSala");
    elSwitch sala("Sala");
    cout<<"Entrando a la sala."<<sala<<endl;
    cout<<"Semaforo "<<semSala<<endl;
    sala.entra(semSala);
    cout<< "En la seccion critica..."<<endl;
    cin>>rta;
    sala.sale(semSala);
    cout<<"Saliendo de la sala."<<sala<<endl;
    cout<<"SemSala "<<semSala<<endl;
    cout<<"Termina."<<endl;
}
 ```

 y el que quiere acceso exclusivo : 
```cpp
int main(int argc, char * argv[]) {
    string rta;
    sv_sem semSala("SemSala");
    cout<<" entrando a la sala."<<semSala<<endl;
    semSala.wait();
    cout<<"En la seccion critica..."<<endl;
    cin>>rta;
    semSala.post();
    cout<<"Termina."<<endl;
}
```

Pero nunca va a estar los dos tipos de procesos juntos.