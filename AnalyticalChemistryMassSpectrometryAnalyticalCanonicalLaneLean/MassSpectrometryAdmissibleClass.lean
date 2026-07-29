import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassSpectrometryObject where
  spectrumKey : String
  massSpectrum : String
  fragmentationPattern : String
  resolution : Float
  isotopicDistribution : String
  massAnalyzerType : String
  detectionMethod : String
deriving Repr, DecidableEq

structure AdmissibleClass where
  object : MassSpectrometryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse