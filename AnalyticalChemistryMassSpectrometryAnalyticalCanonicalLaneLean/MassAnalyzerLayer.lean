import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryBase

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassAnalyzerCertificate where
  analyzerType : String
  massRange : Float × Float
  resolution : Float
  accuracy : Float
  scanRate : Float

deriving Repr, DecidableEq

def quadrupoleAnalyzer : MassAnalyzerCertificate := {
  analyzerType := "Quadrupole",
  massRange := (50.0, 4000.0),
  resolution := 1000.0,
  accuracy := 0.1,
  scanRate := 0.2
}

def timeOfFlightAnalyzer : MassAnalyzerCertificate := {
  analyzerType := "Time-of-Flight",
  massRange := (0.0, 100000.0),
  resolution := 20000.0,
  accuracy := 0.01,
  scanRate := 0.001
}

def orbitrapAnalyzer : MassAnalyzerCertificate := {
  analyzerType := "Orbitrap",
  massRange := (50.0, 6000.0),
  resolution := 100000.0,
  accuracy := 0.001,
  scanRate := 0.1
}

def MassAnalyzerLayerClosed (C : MassAnalyzerCertificate) : Prop := 
  C.resolution > 100 ∧ C.accuracy < 0.5

theorem mass_analyzer_layer_closed_quad : MassAnalyzerLayerClosed quadrupoleAnalyzer := by
  exact And.intro (by decide) (by decide)

theorem mass_analyzer_layer_closed_tof : MassAnalyzerLayerClosed timeOfFlightAnalyzer := by
  exact And.intro (by decide) (by decide)

theorem mass_analyzer_layer_closed_orbitrap : MassAnalyzerLayerClosed orbitrapAnalyzer := by
  exact And.intro (by decide) (by decide)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse