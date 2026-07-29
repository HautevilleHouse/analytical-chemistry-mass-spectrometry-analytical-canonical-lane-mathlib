import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassSpectrum where
  massToCharge : List Float
  intensity : List Float
  resolution : Float
  calibrationConstant : Float
  sourceKey : String
  spectrumChecked : Bool

default instance : Inhabited MassSpectrum where
  default := { massToCharge := [], intensity := [], resolution := 0.0, calibrationConstant := 0.0, sourceKey := "", spectrumChecked := false }

structure AdmittedMassSpectrum where
  object : MassSpectrum
  sourceKeyChecked : object.sourceKey = sourceRepository
  spectrumChecked : object.spectrumChecked = true

def sourceRepository : String :=
  "analytical-chemistry-mass-spectrometry-analytical"

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse