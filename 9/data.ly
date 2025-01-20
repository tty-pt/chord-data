\version "2.17.0"

\header {
  title = "Eu vim para que tenham vida"
  
  composer = "F. Silva"

  ocasioes = "entrada,comunhao"
  seccao   = "comunhao"

}

\include "../utils.ly"

global = {
  \key ees \major
  \time 3/4
}
 
melody = {
  \global
  \relative c' {
    \autoBeamOff

    \partial 4 bes4^\markup{Assembleia} |
    ees4. g8 f ees | \time 2/4 c4 d | \time 3/4 ees4 ees g8 aes |
    bes4 bes8 bes c c | \time 2/4 bes4 bes ~ | bes4 \breathe bes4 |
    ees4. ees8 | d c bes aes | g4 c4 ~ | c4 ees,8 f | \time 3/4 g4 g8 aes f f |
    ees4 ees2 ~ | ees2 \bar "|."

    \break

    \set Timing.measurePosition = #(ly:make-moment 0 8)
    \set Score.measureLength = #(ly:make-moment 15 8)
    g1^\markup{Estrofes (Salmo 145)} bes8 ees d c[ bes] c4 |
    \set Score.measureLength = #(ly:make-moment 17 8)
    f,1 g8 bes aes g8[ f] g2 \bar "||"
  }
}
 
upA = {
  \global
  \relative c' {
    \voiceOne
    \autoBeamOff

    \mergeDifferentlyDottedOn
    \partial 4 bes4 | ees4. g8 f[ ees] | c4 d | ees2 g8[ aes] |
    bes2 c4 | <f, bes>2 ~ | q4 \breathe bes | ees2 | d8[ c] bes[ aes] |
    g4 c ~ | c ees,8[ f] | g4. aes8 f4 | ees2. ~ | ees2 \bar "|."

    \set Timing.measurePosition = #(ly:make-moment 0 8)
    \set Score.measureLength = #(ly:make-moment 15 8)
    s1 bes'8 ees8[ d] c[ bes] c4 | 
    \set Score.measureLength = #(ly:make-moment 17 8)
    f,1 g8 bes[ aes] g[ f] g2 \bar "||"
  }
}

upB = {
  \global
  \relative c' {
    \autoBeamOff
    \voiceTwo

    \mergeDifferentlyDottedOn
    \partial 4 bes4 | g aes bes | aes2 ~ | aes4 g ees'4 ~ |
    ees4 d ees4 ~ | ees4. d8 | f[ ees] d[ f] | ees4. g8 | aes4 d, |
    g4. aes8 | g8[ f] ees4 ~ | ees2 d8[ c] | bes2. ~ | bes2 \bar "|."

    \set Timing.measurePosition = #(ly:make-moment 0 8)
    \set Score.measureLength = #(ly:make-moment 15 8)
    g'1 ~ g8 ~ g4 ees aes |
    \set Score.measureLength = #(ly:make-moment 17 8)
    d,1 ~ d8 ~ d4 ees8[ f] ees2 \bar "||"
  }
}

downA = {
  \global
  \clef bass
  \relative c' {
    \autoBeamOff
    \voiceOne

    s4 | s2. | s2 | s2. | 
    s2. | s2 | s2 | s2 | s2 |
    s2 | s2 | bes2 ~ bes8[ aes]~ | aes4 g2 ~ | g2


    \set Timing.measurePosition = #(ly:make-moment 0 8)
    \set Score.measureLength = #(ly:make-moment 15 8)
    ees'1 d8 c[ bes] c2 | 
    \set Score.measureLength = #(ly:make-moment 17 8)
    bes1 ~ bes8 ~ bes4 c4 ~ c2 \bar "||"
  }
}


downB = {
  \global
  \clef bass
  \relative c {
    \autoBeamOff
    \oneVoice
    \partial 4 bes4 | ees, f g | aes bes | ees, ees'8[ d] c4 |
    g g'8[ f] ees4 | bes'2 ~ | bes4 \breathe aes4 | g8[ f] g[ ees] | f4 g8[ f] |
    ees8[ d] ees4 | c4 c' | 
    \voiceTwo
    bes2 bes,4 | ees2. ~ | ees2 \bar "|."


    \set Timing.measurePosition = #(ly:make-moment 0 8)
    \set Score.measureLength = #(ly:make-moment 15 8)
    ees1 ~ ees8 ~ ees4 aes8[ g] f4 |
    \set Score.measureLength = #(ly:make-moment 17 8)
    s1 aes8 g[ f] ees[ d] c2 \bar "||"
  }
}

text = {
  \lyricmode {
    Eu vim pa -- ra que te -- nham vi -- da e a
    te -- nham em a -- bun -- dân -- cia. __
    Eu vim pa -- ra que te -- nham vi -- da __
    e a te -- nham em a -- bun -- dân -- cia. __
  }
  \set stanza = "1. "
  \lyricmode {
    \lefty "Louva, minha al" -- ma, o Se -- nhor __ _ 
    \lefty "Louvarei o Senhor to" -- da~a mi -- nha vi -- da.
  }
}

\score {
  <<
    \new Staff <<
      \new Voice = "mel" \melody
    >>
    \new Lyrics \lyricsto mel \text
    \new PianoStaff <<
      \new Staff = "upper"<<
        \new Voice \upA
        \new Voice \upB
      >>
      \new Staff ="lower"<<
        \new Voice \downA
        \new Voice \downB
      >>
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
      tempoWholesPerMinute = #(ly:make-moment 90 4)
    }
  }
}


