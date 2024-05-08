s.boot;

// Ayuda de SampleTexto
SampleTexto2.help;

// Crea una instancia de SampleTexto
~a = SampleTexto2.new;

// Arrastra tu carpeta de sonidos después de los dos puntos y declara la línea para cargar los sonidos
~a.init(path: thisProcess.nowExecutingPath.dirname +/+ "/sonidos");

// Toca el sonido del índice cero
~a.st(1).play;

// Separa los sonidos en mono y estéreo
~a.stsel;

// Toca un sonido mono en el índice 0
~a.stm(0).play;

// Toca un sonido estéreo en el índice 0
~a.sts(0).play;

// Da información de los sonidos de la carpeta
~a.info;

// Crea un synth mono para cada sonido de la carpeta
~a.monosynth();

// Crea un synth estéreo para cada sonido de la carpeta
~a.stereosynth();

// Define el procesamiento de sonido: Reverberación y Delay
(
// Reverberación - bus 9
SynthDef(\rev, {|in = 9, mix = 0.4, room = 0.9, damp = 0.1, amp = 1, gate = 1, out = 0|
	var sen, env;
	sen = FreeVerb.ar(InFeedback.ar(in, 2), mix, room, damp, amp);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction: 0);
	Out.ar(out, sen * env);
}).add;

// Delay - bus 11, mdt = maxdelayTime, dt = delayTime, dct = decayTime
SynthDef(\del, {|in = 11, mdt = 0.3, dt = 0.25, dct = 2, gate = 1, out = 0|
	var del, env;
	del = CombL.ar(InFeedback.ar(in, 2), mdt, dt, dct);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, del * env);
}).add;
);

// Activa los efectos: Reverberación y Delay
(
~rev = Synth(\rev); // 9 Reverberación
~del = Synth(\del); // 11 Delay
);

// Modifica los efectos: Reverberación y Delay
~rev.set(\mix, 0.5, \room, 0.5, \damp, 0.5);
~del.set(\mdt, 0.5, \dt, 0.25, \dct, 3);

// Define el patrón para reproducir los sonidos secuencialmente y controla el tempo
TempoClock.tempo = (120/60)/4;
// -36 DO,
// Define el Pbind para reproducir el sonido mono desde el índice 0 LA GUITARRITA
(
~s1 = Pdef(\s1, Pbind(
	\instrument, \m0,
	\dur, 1/16,
	\rate, Pseq([-20, -30, -20, -40].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
))
);
~s1.play.quant(4);
~s1.stop;
// Define el Pbind para reproducir el sonido mono desde el índice 1 HIHAT
(
~s2 = Pdef(\s2, Pbind(
	\instrument, \m1,
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
))
);
~s2.play.quant(4);
~s2.stop;
// Define el Pbind para reproducir el sonido estéreo desde el índice 0
~s3 = Pdef(\s3, Pbind(
	\instrument, \s0, // Cambia el instrumento a \s0 para sonido estéreo
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
));
~s3.play.quant(4);
~s3.stop;
// Define el Pbind para reproducir el sonido estéreo desde el índice 1
~s4 = Pdef(\s4, Pbind(
	\instrument, \s1, // Cambia el instrumento a \s0 para sonido estéreo
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
));
~s4.play.quant(4);
~s4.stop;
// Define el Pbind para reproducir el sonido estéreo desde el índice 2
~s5 = Pdef(\s5, Pbind(
	\instrument, \s2, // Cambia el instrumento a \s0 para sonido estéreo
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
));
~s5.play.quant(4);
~s5.stop;
// Define el Pbind para reproducir el sonido estéreo desde el índice 3
~s6 = Pdef(\s6, Pbind(
	\instrument, \s3, // Cambia el instrumento a \s0 para sonido estéreo
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
));
~s6.play.quant(4);
~s6.stop;
// Define el Pbind para reproducir el sonido estéreo desde el índice 4
~s7 = Pdef(\s7, Pbind(
	\instrument, \s4, // Cambia el instrumento a \s0 para sonido estéreo
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
));
~s7.play.quant(4);
~s7.stop;