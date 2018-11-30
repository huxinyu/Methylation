package mas.action;

import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.util.List;

/**
 * Created by USER on 2017/4/13.
 */
public class TestAction extends ActionSupport{
    private int workflow_sequence;
    private int workflow_type;
    private String workflowCustom_sequence;
    private String workflowCustom_sequence_pair1text;
    private String workflowCustom_sequence_pair2;
    private int refer_index_workCustom;
    private String workflowCustom_reference;
    private int workflowCustom_build;
    private String workflowCustom_control;
    private int workflowCustom_mapping;
    private int workflowCustom_peak;
    private int workflowTypical_type;
    private String workflowTypical_reads;
    private String workflowTypical_sequence_pair1text;
    private String workflowTypical_sequence_pair2;
    private int refer_index_workTypical;
    private String workflowTypical_reference;
    private String workflowTypical_build;
    private String workflowTypical_control;
    private String workflowTypical_path;
    private int typical_bowtie2_option;
    private int typical_macs_option;
    private String setting_skip;
    private String setting_u;
    private String setting_trim5;
    private String setting_trim3;
    private String alignmentOption;
    private String alignment_N;
    private String alignment_L;
    private String alignment_i;
    private String alignment_n;
    private String alignment_dpad;
    private String alignment_gbar;
    private String scoreOption;
    private String score_ma;
    private String score_mp;
    private String score_np;
    private String score_rdg5;
    private String score_rdg3;
    private String score_rfg5;
    private String score_rfg3;
    private String macs_gs;
    private String macs_s;
    private String macs_bw;
    private String macs_p;
    private String workflowCustom_path;
    private String workflowCustom_path_peak;
    private int workflowCustom_option_bwa;
    private int workflowCustom_option_bowtie;
    private int workflowCustom_option_bowtie2;
    private int workflowCustom_option_macs;
    private int workflowCustom_option_peakseq;
    private int workflowCustom_option_peakranger;
    private int workflowCustom_option_sicer;
    private int workflowCustom_option_SOAP;
    private int workflowCustom_option_BLAST;
    private int workflowCustom_option_Subread;
    private int workflowCustom_option_NGM;
    private int workflowCustom_option_BCP;
    private int workflowCustom_option_diff;
    private int workflowCustom_option_SISSRs;
    private int workflowCustom_option_AREM;
    private int workflowCustom_option_fseq;
    private int workflowCustom_option_BroadPeak;
    private int workflowCustom_option_macs2;
    private int long_short;
    private String peakranger_length,peakranger_annofile,peakranger_pvalue,peakranger_fdr,peakranger_relength,peakranger_delta,peakranger_bandwidth,peakranger_pad,peakranger_t;
    private String peakranger_length1,peakranger_annofile1,peakranger_fdr1,peakranger_winsize1,peakranger_winstep1,peakranger_imcount1,peakranger_minscore1,peakranger_relength1,peakranger_pvalue1;
    private String peakranger_length2,peakranger_annofile2,peakranger_winsize2,peakranger_relength2;
    private String flag,flag_validate;
    private String sampath;
    private String bampath_treatment;
    private String bampath_control;
    private String peakpath;
    private String stdoutlist_mapping1;
    private String stdoutlist_mapping2;
    private String stdoutlist_peak;
    private String stdoutlist_mapvisual;
    private String stdoutlist_peakvisual;
    private String account_hidden;
    private String Scope_demo;
    private List<File> fileField_workflow;
    private List<String> fileField_workflowFileName;
    private List<String> fileField_workflowContentType;
    private String peakcalling_visual_scope;
    private String mapping_visual_scope;

    public String getPeakcalling_visual_scope() {
        return peakcalling_visual_scope;
    }

    public void setPeakcalling_visual_scope(String peakcalling_visual_scope) {
        this.peakcalling_visual_scope = peakcalling_visual_scope;
    }

    public String getMapping_visual_scope() {
        return mapping_visual_scope;
    }

    public void setMapping_visual_scope(String mapping_visual_scope) {
        this.mapping_visual_scope = mapping_visual_scope;
    }

    public String getScope_demo() {
        return Scope_demo;
    }

    public void setScope_demo(String scope_demo) {
        Scope_demo = scope_demo;
    }

    public String getAccount_hidden() {
        return account_hidden;
    }

    public void setAccount_hidden(String account_hidden) {
        this.account_hidden = account_hidden;
    }

    public List<File> getFileField_workflow() {
        return fileField_workflow;
    }

    public void setFileField_workflow(List<File> fileField_workflow) {
        this.fileField_workflow = fileField_workflow;
    }

    public List<String> getFileField_workflowFileName() {
        return fileField_workflowFileName;
    }

    public void setFileField_workflowFileName(List<String> fileField_workflowFileName) {
        this.fileField_workflowFileName = fileField_workflowFileName;
    }

    public List<String> getFileField_workflowContentType() {
        return fileField_workflowContentType;
    }

    public void setFileField_workflowContentType(List<String> fileField_workflowContentType) {
        this.fileField_workflowContentType = fileField_workflowContentType;
    }

    public String getPeakranger_length() {
        return peakranger_length;
    }

    public void setPeakranger_length(String peakranger_length) {
        this.peakranger_length = peakranger_length;
    }

    public String getPeakranger_annofile() {
        return peakranger_annofile;
    }

    public void setPeakranger_annofile(String peakranger_annofile) {
        this.peakranger_annofile = peakranger_annofile;
    }

    public String getPeakranger_pvalue() {
        return peakranger_pvalue;
    }

    public void setPeakranger_pvalue(String peakranger_pvalue) {
        this.peakranger_pvalue = peakranger_pvalue;
    }

    public String getPeakranger_fdr() {
        return peakranger_fdr;
    }

    public void setPeakranger_fdr(String peakranger_fdr) {
        this.peakranger_fdr = peakranger_fdr;
    }

    public String getPeakranger_relength() {
        return peakranger_relength;
    }

    public void setPeakranger_relength(String peakranger_relength) {
        this.peakranger_relength = peakranger_relength;
    }

    public String getPeakranger_delta() {
        return peakranger_delta;
    }

    public void setPeakranger_delta(String peakranger_delta) {
        this.peakranger_delta = peakranger_delta;
    }

    public String getPeakranger_bandwidth() {
        return peakranger_bandwidth;
    }

    public void setPeakranger_bandwidth(String peakranger_bandwidth) {
        this.peakranger_bandwidth = peakranger_bandwidth;
    }

    public String getPeakranger_pad() {
        return peakranger_pad;
    }

    public void setPeakranger_pad(String peakranger_pad) {
        this.peakranger_pad = peakranger_pad;
    }

    public String getPeakranger_t() {
        return peakranger_t;
    }

    public void setPeakranger_t(String peakranger_t) {
        this.peakranger_t = peakranger_t;
    }

    public String getPeakranger_length1() {
        return peakranger_length1;
    }

    public void setPeakranger_length1(String peakranger_length1) {
        this.peakranger_length1 = peakranger_length1;
    }

    public String getPeakranger_annofile1() {
        return peakranger_annofile1;
    }

    public void setPeakranger_annofile1(String peakranger_annofile1) {
        this.peakranger_annofile1 = peakranger_annofile1;
    }

    public String getPeakranger_fdr1() {
        return peakranger_fdr1;
    }

    public void setPeakranger_fdr1(String peakranger_fdr1) {
        this.peakranger_fdr1 = peakranger_fdr1;
    }

    public String getPeakranger_winsize1() {
        return peakranger_winsize1;
    }

    public void setPeakranger_winsize1(String peakranger_winsize1) {
        this.peakranger_winsize1 = peakranger_winsize1;
    }

    public String getPeakranger_winstep1() {
        return peakranger_winstep1;
    }

    public void setPeakranger_winstep1(String peakranger_winstep1) {
        this.peakranger_winstep1 = peakranger_winstep1;
    }

    public String getPeakranger_imcount1() {
        return peakranger_imcount1;
    }

    public void setPeakranger_imcount1(String peakranger_imcount1) {
        this.peakranger_imcount1 = peakranger_imcount1;
    }

    public String getPeakranger_minscore1() {
        return peakranger_minscore1;
    }

    public void setPeakranger_minscore1(String peakranger_minscore1) {
        this.peakranger_minscore1 = peakranger_minscore1;
    }

    public String getPeakranger_relength1() {
        return peakranger_relength1;
    }

    public void setPeakranger_relength1(String peakranger_relength1) {
        this.peakranger_relength1 = peakranger_relength1;
    }

    public String getPeakranger_pvalue1() {
        return peakranger_pvalue1;
    }

    public void setPeakranger_pvalue1(String peakranger_pvalue1) {
        this.peakranger_pvalue1 = peakranger_pvalue1;
    }

    public String getPeakranger_length2() {
        return peakranger_length2;
    }

    public void setPeakranger_length2(String peakranger_length2) {
        this.peakranger_length2 = peakranger_length2;
    }

    public String getPeakranger_annofile2() {
        return peakranger_annofile2;
    }

    public void setPeakranger_annofile2(String peakranger_annofile2) {
        this.peakranger_annofile2 = peakranger_annofile2;
    }

    public String getPeakranger_winsize2() {
        return peakranger_winsize2;
    }

    public void setPeakranger_winsize2(String peakranger_winsize2) {
        this.peakranger_winsize2 = peakranger_winsize2;
    }

    public String getPeakranger_relength2() {
        return peakranger_relength2;
    }

    public void setPeakranger_relength2(String peakranger_relength2) {
        this.peakranger_relength2 = peakranger_relength2;
    }

    public int getWorkflow_sequence() {
        return workflow_sequence;
    }

    public void setWorkflow_sequence(int workflow_sequence) {
        this.workflow_sequence = workflow_sequence;
    }

    public int getWorkflow_type() {
        return workflow_type;
    }

    public void setWorkflow_type(int workflow_type) {
        this.workflow_type = workflow_type;
    }

    public String getWorkflowCustom_sequence() {
        return workflowCustom_sequence;
    }

    public void setWorkflowCustom_sequence(String workflowCustom_sequence) {
        this.workflowCustom_sequence = workflowCustom_sequence;
    }

    public String getWorkflowCustom_sequence_pair1text() {
        return workflowCustom_sequence_pair1text;
    }

    public void setWorkflowCustom_sequence_pair1text(String workflowCustom_sequence_pair1text) {
        this.workflowCustom_sequence_pair1text = workflowCustom_sequence_pair1text;
    }

    public String getWorkflowCustom_sequence_pair2() {
        return workflowCustom_sequence_pair2;
    }

    public void setWorkflowCustom_sequence_pair2(String workflowCustom_sequence_pair2) {
        this.workflowCustom_sequence_pair2 = workflowCustom_sequence_pair2;
    }

    public int getRefer_index_workCustom() {
        return refer_index_workCustom;
    }

    public void setRefer_index_workCustom(int refer_index_workCustom) {
        this.refer_index_workCustom = refer_index_workCustom;
    }

    public String getWorkflowCustom_reference() {
        return workflowCustom_reference;
    }

    public void setWorkflowCustom_reference(String workflowCustom_reference) {
        this.workflowCustom_reference = workflowCustom_reference;
    }

    public int getWorkflowCustom_build() {
        return workflowCustom_build;
    }

    public void setWorkflowCustom_build(int workflowCustom_build) {
        this.workflowCustom_build = workflowCustom_build;
    }

    public String getWorkflowCustom_control() {
        return workflowCustom_control;
    }

    public void setWorkflowCustom_control(String workflowCustom_control) {
        this.workflowCustom_control = workflowCustom_control;
    }

    public int getWorkflowCustom_mapping() {
        return workflowCustom_mapping;
    }

    public void setWorkflowCustom_mapping(int workflowCustom_mapping) {
        this.workflowCustom_mapping = workflowCustom_mapping;
    }

    public int getWorkflowCustom_peak() {
        return workflowCustom_peak;
    }

    public void setWorkflowCustom_peak(int workflowCustom_peak) {
        this.workflowCustom_peak = workflowCustom_peak;
    }

    public int getWorkflowTypical_type() {
        return workflowTypical_type;
    }

    public void setWorkflowTypical_type(int workflowTypical_type) {
        this.workflowTypical_type = workflowTypical_type;
    }

    public String getWorkflowTypical_reads() {
        return workflowTypical_reads;
    }

    public void setWorkflowTypical_reads(String workflowTypical_reads) {
        this.workflowTypical_reads = workflowTypical_reads;
    }

    public String getWorkflowTypical_sequence_pair1text() {
        return workflowTypical_sequence_pair1text;
    }

    public void setWorkflowTypical_sequence_pair1text(String workflowTypical_sequence_pair1text) {
        this.workflowTypical_sequence_pair1text = workflowTypical_sequence_pair1text;
    }

    public String getWorkflowTypical_sequence_pair2() {
        return workflowTypical_sequence_pair2;
    }

    public void setWorkflowTypical_sequence_pair2(String workflowTypical_sequence_pair2) {
        this.workflowTypical_sequence_pair2 = workflowTypical_sequence_pair2;
    }

    public int getRefer_index_workTypical() {
        return refer_index_workTypical;
    }

    public void setRefer_index_workTypical(int refer_index_workTypical) {
        this.refer_index_workTypical = refer_index_workTypical;
    }

    public String getWorkflowTypical_reference() {
        return workflowTypical_reference;
    }

    public void setWorkflowTypical_reference(String workflowTypical_reference) {
        this.workflowTypical_reference = workflowTypical_reference;
    }

    public String getWorkflowTypical_build() {
        return workflowTypical_build;
    }

    public void setWorkflowTypical_build(String workflowTypical_build) {
        this.workflowTypical_build = workflowTypical_build;
    }

    public String getWorkflowTypical_control() {
        return workflowTypical_control;
    }

    public void setWorkflowTypical_control(String workflowTypical_control) {
        this.workflowTypical_control = workflowTypical_control;
    }

    public String getWorkflowTypical_path() {
        return workflowTypical_path;
    }

    public void setWorkflowTypical_path(String workflowTypical_path) {
        this.workflowTypical_path = workflowTypical_path;
    }

    public int getTypical_bowtie2_option() {
        return typical_bowtie2_option;
    }

    public void setTypical_bowtie2_option(int typical_bowtie2_option) {
        this.typical_bowtie2_option = typical_bowtie2_option;
    }

    public int getTypical_macs_option() {
        return typical_macs_option;
    }

    public void setTypical_macs_option(int typical_macs_option) {
        this.typical_macs_option = typical_macs_option;
    }

    public String getSetting_skip() {
        return setting_skip;
    }

    public void setSetting_skip(String setting_skip) {
        this.setting_skip = setting_skip;
    }

    public String getSetting_u() {
        return setting_u;
    }

    public void setSetting_u(String setting_u) {
        this.setting_u = setting_u;
    }

    public String getSetting_trim5() {
        return setting_trim5;
    }

    public void setSetting_trim5(String setting_trim5) {
        this.setting_trim5 = setting_trim5;
    }

    public String getSetting_trim3() {
        return setting_trim3;
    }

    public void setSetting_trim3(String setting_trim3) {
        this.setting_trim3 = setting_trim3;
    }

    public String getAlignmentOption() {
        return alignmentOption;
    }

    public void setAlignmentOption(String alignmentOption) {
        this.alignmentOption = alignmentOption;
    }

    public String getAlignment_N() {
        return alignment_N;
    }

    public void setAlignment_N(String alignment_N) {
        this.alignment_N = alignment_N;
    }

    public String getAlignment_L() {
        return alignment_L;
    }

    public void setAlignment_L(String alignment_L) {
        this.alignment_L = alignment_L;
    }

    public String getAlignment_i() {
        return alignment_i;
    }

    public void setAlignment_i(String alignment_i) {
        this.alignment_i = alignment_i;
    }

    public String getAlignment_n() {
        return alignment_n;
    }

    public void setAlignment_n(String alignment_n) {
        this.alignment_n = alignment_n;
    }

    public String getAlignment_dpad() {
        return alignment_dpad;
    }

    public void setAlignment_dpad(String alignment_dpad) {
        this.alignment_dpad = alignment_dpad;
    }

    public String getAlignment_gbar() {
        return alignment_gbar;
    }

    public void setAlignment_gbar(String alignment_gbar) {
        this.alignment_gbar = alignment_gbar;
    }

    public String getScoreOption() {
        return scoreOption;
    }

    public void setScoreOption(String scoreOption) {
        this.scoreOption = scoreOption;
    }

    public String getScore_ma() {
        return score_ma;
    }

    public void setScore_ma(String score_ma) {
        this.score_ma = score_ma;
    }

    public String getScore_mp() {
        return score_mp;
    }

    public void setScore_mp(String score_mp) {
        this.score_mp = score_mp;
    }

    public String getScore_np() {
        return score_np;
    }

    public void setScore_np(String score_np) {
        this.score_np = score_np;
    }

    public String getScore_rdg5() {
        return score_rdg5;
    }

    public void setScore_rdg5(String score_rdg5) {
        this.score_rdg5 = score_rdg5;
    }

    public String getScore_rdg3() {
        return score_rdg3;
    }

    public void setScore_rdg3(String score_rdg3) {
        this.score_rdg3 = score_rdg3;
    }

    public String getScore_rfg5() {
        return score_rfg5;
    }

    public void setScore_rfg5(String score_rfg5) {
        this.score_rfg5 = score_rfg5;
    }

    public String getScore_rfg3() {
        return score_rfg3;
    }

    public void setScore_rfg3(String score_rfg3) {
        this.score_rfg3 = score_rfg3;
    }

    public String getMacs_gs() {
        return macs_gs;
    }

    public void setMacs_gs(String macs_gs) {
        this.macs_gs = macs_gs;
    }

    public String getMacs_s() {
        return macs_s;
    }

    public void setMacs_s(String macs_s) {
        this.macs_s = macs_s;
    }

    public String getMacs_bw() {
        return macs_bw;
    }

    public void setMacs_bw(String macs_bw) {
        this.macs_bw = macs_bw;
    }

    public String getMacs_p() {
        return macs_p;
    }

    public void setMacs_p(String macs_p) {
        this.macs_p = macs_p;
    }

    public int getWorkflowCustom_option_sicer() {
        return workflowCustom_option_sicer;
    }

    public void setWorkflowCustom_option_sicer(int workflowCustom_option_sicer) {
        this.workflowCustom_option_sicer = workflowCustom_option_sicer;
    }

    public String getWorkflowCustom_path() {
        return workflowCustom_path;
    }

    public void setWorkflowCustom_path(String workflowCustom_path) {
        this.workflowCustom_path = workflowCustom_path;
    }

    public int getWorkflowCustom_option_bwa() {
        return workflowCustom_option_bwa;
    }

    public void setWorkflowCustom_option_bwa(int workflowCustom_option_bwa) {
        this.workflowCustom_option_bwa = workflowCustom_option_bwa;
    }

    public int getWorkflowCustom_option_bowtie() {
        return workflowCustom_option_bowtie;
    }

    public void setWorkflowCustom_option_bowtie(int workflowCustom_option_bowtie) {
        this.workflowCustom_option_bowtie = workflowCustom_option_bowtie;
    }

    public int getWorkflowCustom_option_bowtie2() {
        return workflowCustom_option_bowtie2;
    }

    public void setWorkflowCustom_option_bowtie2(int workflowCustom_option_bowtie2) {
        this.workflowCustom_option_bowtie2 = workflowCustom_option_bowtie2;
    }

    public int getWorkflowCustom_option_macs() {
        return workflowCustom_option_macs;
    }

    public void setWorkflowCustom_option_macs(int workflowCustom_option_macs) {
        this.workflowCustom_option_macs = workflowCustom_option_macs;
    }

    public int getWorkflowCustom_option_peakseq() {
        return workflowCustom_option_peakseq;
    }

    public void setWorkflowCustom_option_peakseq(int workflowCustom_option_peakseq) {
        this.workflowCustom_option_peakseq = workflowCustom_option_peakseq;
    }

    public int getWorkflowCustom_option_peakranger() {
        return workflowCustom_option_peakranger;
    }

    public void setWorkflowCustom_option_peakranger(int workflowCustom_option_peakranger) {
        this.workflowCustom_option_peakranger = workflowCustom_option_peakranger;
    }

    public int getWorkflowCustom_option_SOAP() {
        return workflowCustom_option_SOAP;
    }

    public void setWorkflowCustom_option_SOAP(int workflowCustom_option_SOAP) {
        this.workflowCustom_option_SOAP = workflowCustom_option_SOAP;
    }

    public int getWorkflowCustom_option_BLAST() {
        return workflowCustom_option_BLAST;
    }

    public void setWorkflowCustom_option_BLAST(int workflowCustom_option_BLAST) {
        this.workflowCustom_option_BLAST = workflowCustom_option_BLAST;
    }

    public int getWorkflowCustom_option_Subread() {
        return workflowCustom_option_Subread;
    }

    public void setWorkflowCustom_option_Subread(int workflowCustom_option_Subread) {
        this.workflowCustom_option_Subread = workflowCustom_option_Subread;
    }

    public int getWorkflowCustom_option_NGM() {
        return workflowCustom_option_NGM;
    }

    public void setWorkflowCustom_option_NGM(int workflowCustom_option_NGM) {
        this.workflowCustom_option_NGM = workflowCustom_option_NGM;
    }

    public int getWorkflowCustom_option_BCP() {
        return workflowCustom_option_BCP;
    }

    public void setWorkflowCustom_option_BCP(int workflowCustom_option_BCP) {
        this.workflowCustom_option_BCP = workflowCustom_option_BCP;
    }

    public int getWorkflowCustom_option_diff() {
        return workflowCustom_option_diff;
    }

    public void setWorkflowCustom_option_diff(int workflowCustom_option_diff) {
        this.workflowCustom_option_diff = workflowCustom_option_diff;
    }

    public int getWorkflowCustom_option_SISSRs() {
        return workflowCustom_option_SISSRs;
    }

    public void setWorkflowCustom_option_SISSRs(int workflowCustom_option_SISSRs) {
        this.workflowCustom_option_SISSRs = workflowCustom_option_SISSRs;
    }

    public int getWorkflowCustom_option_AREM() {
        return workflowCustom_option_AREM;
    }

    public void setWorkflowCustom_option_AREM(int workflowCustom_option_AREM) {
        this.workflowCustom_option_AREM = workflowCustom_option_AREM;
    }

    public int getWorkflowCustom_option_fseq() {
        return workflowCustom_option_fseq;
    }

    public void setWorkflowCustom_option_fseq(int workflowCustom_option_fseq) {
        this.workflowCustom_option_fseq = workflowCustom_option_fseq;
    }

    public int getWorkflowCustom_option_BroadPeak() {
        return workflowCustom_option_BroadPeak;
    }

    public void setWorkflowCustom_option_BroadPeak(int workflowCustom_option_BroadPeak) {
        this.workflowCustom_option_BroadPeak = workflowCustom_option_BroadPeak;
    }

    public int getWorkflowCustom_option_macs2() {
        return workflowCustom_option_macs2;
    }

    public void setWorkflowCustom_option_macs2(int workflowCustom_option_macs2) {
        this.workflowCustom_option_macs2 = workflowCustom_option_macs2;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }

    public String getSampath() {
        return sampath;
    }

    public void setSampath(String sampath) {
        this.sampath = sampath;
    }

    public String getBampath_treatment() {
        return bampath_treatment;
    }

    public void setBampath_treatment(String bampath_treatment) {
        this.bampath_treatment = bampath_treatment;
    }

    public String getBampath_control() {
        return bampath_control;
    }

    public void setBampath_control(String bampath_control) {
        this.bampath_control = bampath_control;
    }

    public String getPeakpath() {
        return peakpath;
    }

    public void setPeakpath(String peakpath) {
        this.peakpath = peakpath;
    }

    public int getLong_short() {
        return long_short;
    }

    public void setLong_short(int long_short) {
        this.long_short = long_short;
    }

    public String getWorkflowCustom_path_peak() {
        return workflowCustom_path_peak;
    }

    public void setWorkflowCustom_path_peak(String workflowCustom_path_peak) {
        this.workflowCustom_path_peak = workflowCustom_path_peak;
    }

    public String getStdoutlist_mapping1() {
        return stdoutlist_mapping1;
    }

    public void setStdoutlist_mapping1(String stdoutlist_mapping1) {
        this.stdoutlist_mapping1 = stdoutlist_mapping1;
    }

    public String getStdoutlist_mapping2() {
        return stdoutlist_mapping2;
    }

    public void setStdoutlist_mapping2(String stdoutlist_mapping2) {
        this.stdoutlist_mapping2 = stdoutlist_mapping2;
    }

    public String getStdoutlist_peak() {
        return stdoutlist_peak;
    }

    public void setStdoutlist_peak(String stdoutlist_peak) {
        this.stdoutlist_peak = stdoutlist_peak;
    }

    public String getStdoutlist_mapvisual() {
        return stdoutlist_mapvisual;
    }

    public void setStdoutlist_mapvisual(String stdoutlist_mapvisual) {
        this.stdoutlist_mapvisual = stdoutlist_mapvisual;
    }

    public String getStdoutlist_peakvisual() {
        return stdoutlist_peakvisual;
    }

    public void setStdoutlist_peakvisual(String stdoutlist_peakvisual) {
        this.stdoutlist_peakvisual = stdoutlist_peakvisual;
    }

    public String Test() throws Exception{
        flag="3";
        workflowCustom_path="/home/bio/dataset/Demo";
        sampath="/home/bio/dataset/Demo/SRR576933.sam";
        workflowCustom_reference="/home/bio/dataset/Demo/reference.fasta";
        bampath_treatment="/home/bio/dataset/Demo/SRR576933.sam";
        bampath_control="/home/bio/dataset/Demo/SRR576938.sam";
        peakpath="/home/bio/dataset/Demo/SRR576933_peaks.bed";
        peakcalling_visual_scope="gi|556503834|ref|NC_000913.3|:826,929-834,194";
        mapping_visual_scope="gi|556503834|ref|NC_000913.3|:826,929-834,194";
        Scope_demo="gi|556503834|ref|NC_000913.3|:826,929-834,194";
        return SUCCESS;
    }
}
