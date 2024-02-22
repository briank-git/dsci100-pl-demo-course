from code_feedback import Feedback
from pl_helpers import name, points
from pl_unit_test import PLTestCase

class Test(PLTestCase):
    
    @points(1)
    @name("avocado_plot exists")
    def test_0(self):
        if self.st.avocado_plot != None:
            Feedback.set_score(1)
        else:
            Feedback.set_score(0)
            
    @points(1)
    @name("Plot encoding x and y")
    def test_1(self):
        fig_ref = self.ref.avocado_plot
        fig_st = self.st.avocado_plot
        
        if fig_st.encoding.x['shorthand'] == fig_ref.encoding.x['shorthand'] and fig_st.encoding.y['shorthand'] == fig_ref.encoding.y['shorthand']:
            Feedback.set_score(1)
        else:
            Feedback.set_score(0)
            
    @points(1)
    @name("Plot data region")
    def test_2(self):
        fig_ref = self.ref.avocado_plot
        fig_st = self.st.avocado_plot
        
        if fig_st.data.region.unique()[0] == fig_ref.data.region.unique()[0]:
            Feedback.set_score(1)
        else:
            Feedback.set_score(0)
            
    @points(1)
    @name("Plot mark type")
    def test_3(self):
        fig_ref = self.ref.avocado_plot
        fig_st = self.st.avocado_plot
        
        if fig_st.mark == fig_ref.mark:
            Feedback.set_score(1)
        else:
            Feedback.set_score(0)
            
    @points(1)
    @name("Plot x and y labels")
    def test_4(self):
        fig_ref = self.ref.avocado_plot
        fig_st = self.st.avocado_plot
        
        if fig_st.encoding.x['title'] == fig_ref.encoding.x['title'] and fig_st.encoding.y['title'] == fig_ref.encoding.y['title']:
            Feedback.set_score(1)
        else:
            Feedback.set_score(0)