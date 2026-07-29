import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryAdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ScopedClosure A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact ⟨A.object.spectrumKey = sourceRepository,
    A.object.massSpectrum = sourceDescription,
    A.object.fragmentationPattern = expectedFragmentation,
    A.object.resolution = expectedResolution,
    A.object.isotopicDistribution = expectedIsotopicDistribution,
    A.object.massAnalyzerType = expectedAnalyzer,
    A.object.detectionMethod = expectedDetection⟩

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse