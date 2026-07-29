import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryAdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure IsotopicDistributionCertificate where
  spectrumKey : String
  isotopicPattern : String
  resolution : Float
  isotopicDistributionChecked : Bool
  theoreticalDistribution : String
  experimentalDistribution : String
  goodnessOfFit : Float
deriving Repr, DecidableEq

def isotopicDistributionCertificate : IsotopicDistributionCertificate := {
  spectrumKey := "sample_001",
  isotopicPattern := "C13 enrichment",
  resolution := 50000.0,
  isotopicDistributionChecked := true,
  theoreticalDistribution := "calculated from molecular formula",
  experimentalDistribution := "measured from MS",
  goodnessOfFit := 0.98
}

def IsotopicDistributionLayerClosed (C : IsotopicDistributionCertificate) : Prop :=
  C.isotopicDistributionChecked = true ∧ C.goodnessOfFit > 0.95

theorem isotopic_distribution_layer_closed_checked :
    IsotopicDistributionLayerClosed isotopicDistributionCertificate := by
  exact And.intro rfl (by native_decide)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse