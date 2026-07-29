import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrum

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ScopedClosure A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact ⟨A.object.sourceKeyChecked,
    A.object.spectrumChecked,
    rfl,
    rfl,
    rfl,
    rfl⟩

def ScopedClosure (O : AdmittedMassSpectrum) : Prop :=
  O.sourceKeyChecked ∧ O.spectrumChecked

def NativeBridgeClosed (O : AdmittedMassSpectrum) : Prop :=
  ScopedClosure O

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse