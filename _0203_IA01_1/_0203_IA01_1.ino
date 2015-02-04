int sensors[3];
//int inByte;



void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  sensors[0] = 0;
  sensors[1] = 0;
  sensors[2] = 0;
//  inByte = 0;
  //establishContact();
}

void loop() {
  
  sensors[0] = analogRead(A0);
  sensors[1] = analogRead(A1);
  sensors[2] = digitalRead(2);

    // コンマ区切りでセンサーの値を送出
  Serial.print(sensors[0]);
  Serial.print(",");
  Serial.print(sensors[1]);
  Serial.print(",");
  Serial.println(sensors[2]);

  
  // send the value of analog input 0:
//  Serial.println(analogRead(A0));
  // wait a bit for the analog-to-digital converter 
  // to stabilize after the last reading:
  delay(200);
}
