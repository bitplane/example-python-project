import unittest

from example_project.program import add_two_numbers


class AddTwoNumbersTest(unittest.TestCase):
    """
    By convention, the module is named test_something, the class is SomethingTest
    and the test methods are test_something
    """

    def test_add_two_numbers(self):
        expected_result = 2
        actual_result = add_two_numbers(1, 1)

        self.assertEqual(actual_result, expected_result, '1+1 should equal 2')

    def test_add_two_strings(self):
        """
        Example failing test
        """
        with self.assertRaises(ValueError):
            add_two_numbers(1, 1)

