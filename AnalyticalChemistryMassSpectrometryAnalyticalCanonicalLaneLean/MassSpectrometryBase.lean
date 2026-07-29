import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassSpectrumDatum where
  mz : Float
  intensity : Float
  charge : Nat
  resolution : Float

deriving Repr, DecidableEq

structure MassSpectrometerState where
  ionSourceType : String
  massAnalyzerType : String
  detectorType : String
  vacuumPressure : Float

deriving Repr, DecidableEq

structure AnalyticalObject where
  sampleName : String
  spectrum : List MassSpectrumDatum
  spectrometerState : MassSpectrometerState
  calibrationChecked : Bool

deriving Repr, DecidableEq

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse