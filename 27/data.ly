\version "2.14.0"

\header {
  title = "A fé em Deus"
  composer = "J. Fernandes da Silva"

  tagline = "Transcrita por Alberto Simões"
  meter = "Andante"

  ocasioes = "entrada"
  seccao   = "entrada"
}

\include "../utils.ly"

global = {
  \key f \major
  \time 4/4
}

melody = \relative c' {
  \global
  \clef treble
  \autoBeamOff

  \partial 8*3 c8^\markup{\italic{Estrofe}}\( f g | a4. a8 c a g f | g4 f4.\) f8\( a bes |
  c c d c a4 bes | c2\) ~ c8 a\( bes a 
  \repeat volta 2 {
    d4 d \) g,8\( g a g | 
    c4 a4.\) a8\( g f 
  }
  \alternative {
    { g4 g8 a bes g f g | a2\) ~ a8 \breathe a8\( bes a }
    { g4 g8 a bes bes a g | f2.\) }
  }
  r8.^\markup{\italic{Coro}} a16 \bar "||"
  a8. a16 a8. a16 bes8. bes16 a8. g16 |

  f4 c2 ~ c8. c16 | d8. d16 d8. e16 f8. d16 f8. a16 | 
  c4 c2 \breathe f,8. f16 |
  \repeat volta 2 {
    d'4 d8. bes16 g8. a16 bes8. g16 | a4 e a c |
    e4 d8. c16 b8. d16 c8. b16 |
  }
  \alternative {
    { a4 a2 \breathe f8. f16 }
    { a4 a2 ~ a8 }
  }
  \bar "|."
}

texto = {
  \set stanza = #"1. "
  \lyricmode {
    A fé em Deus
    é luz do meu ca- mi- nho,
    A gra- ça do Se- nhor me faz vi- ver. __ 
    Co- nhe- ço_o ru- mo,
    já não vou só- zi- nho;
    Deus vai co- mi- go: A quem hei de te- mer? __
    Co- nhe- ço_o mi- go: A quem hei de te- mer? 
  }
  \set stanza = \markup { \dynamic "f" }
  \lyricmode {
    Li- ber- ta- nos, Se- nhor, de tan- tos la- ços __
    Que_im- pe- dem pa- ra Ti nos- sa su- bi- da.
    Tu- a mão o- ri- en- te_os nos- sos pas- sos
    A ca- mi- nho da Ter- ra Pro- me- ti- da.
    Tu- a ti- da. __
  }
}


upperA = \relative c' {
  \voiceOne

  \partial 8*3 c8 f[ g]| a2 c8[ a g f] | g4 f4. f8[ a bes]|
  c4 d8[ c] a4 bes | c2 ~ c8 a8[ bes a] |
  \repeat volta 2 {
    d4 d g, aes8[ g] | c4 a4. a8 g[ f] |
  }
  \alternative {
    { g4. a8 bes[ g f g] | a2 ~ a8\noBeam a bes8[ a] }
    { g4. a8 bes4 a8[ g] | f2. }
  }
  r8. <f a>16 | q2 ~ <f bes>4 a8.[ g16] |
  f4 c2. | d4.. e16 f8.[ d16 f8. a16] | c2. f,4 |
  \repeat volta 2 {
    d'4.. bes16 g8.[ a16 bes8. g16] | a4 e a c | 
    e d8.[ c16 b8. d16 c8. b16]
  }
  \alternative {
    { a4 ~ a2 f4 }
    { a2. ~ a8 }
  }
}


upperB = \relative c' {
  \voiceTwo
  \partial 8*3 c8 a8[ bes] | c4. d8 ees2 ~ | ees!8[ c] d4 c2 |
  g'4 f2. | f8[ d g f] e2 |
  \repeat volta 2 {
    a4 aes g c, | f e ees d |
  }
  \alternative {
    { cis4 d2. | cis2. e4 }
    { cis4 d2. | a2. }
  }
  s4 | c2 d4 d |
  c4 s2. | s1 | e2 ees4 c |
  \repeat volta 2 {
    d4 f c f | e s4 e2 | gis4 a f e ~
  }
  \alternative {
    { e d cis c }
    { e d8[ bes] cis4 ~ cis8 }
  }
}

upper = {
  \global
  \clef treble
  << \new Voice \upperA 
     \new Voice \upperB >>
}


lowerA = \relative c {
  \oneVoice
  \partial 8*3 r8 r c | f,8[ g a f] f'[ g] a4 | bes2 a4 f |
  e8[ a, bes d] f[ d g d'] | a4 bes c g |
  \repeat volta 2 {
    fis4 f4 e ees | d cis c bes |
  }
  \alternative {
    { a bes g8[ a] bes4 | a4 bes' a g }
    { a,4 bes g8[ a] bes4 | f1 }
  }
  f'4 e d bes |
  \voiceOne
  s4 e4( f g)| a2. f4 | g4( a8[ g] f4) a|
  \repeat volta 2 {
    bes1 |     \showStaffSwitch a4 \change Staff = "upper" \stemDown d \stemUp \change Staff = "lower" c4 a |
    b a d gis, 
  }
  \alternative {
    { a( f e) a }
    { a f8[ d] e4 ~ e8 }
  }
}


lowerB = \relative c {
  \voiceTwo
  \repeat unfold 45 { s4 } s8
  a4 c( d e) | f e d2 | c4 a2 ees'4 |
  \repeat volta 2 {
    bes4 d e! d | c b a a' | e f d e |
  }
  \alternative {
    { a,2. ees'4 }
    { a,2. ~ a8}
  }
}

lower = {
  \global
  \clef bass
  << \new Voice \lowerA 
     \new Voice \lowerB >>
}

\score {
  \new Score <<
    \new Staff <<
      \new Voice = "mel"  \melody
      \new Lyrics \lyricsto "mel" \texto
    >>
    \new PianoStaff <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves       
      \override VerticalAxisGroup #'remove-first = ##t
    }
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 75 4)
    }
  }
}


