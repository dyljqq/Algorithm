# coding: utf-8


class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution(object):
    def getIntersectionNode(self, headA, headB):
        if not (headA and headB):
            return

        rootA = headA
        rootB = headB
        while headA != headB:
            headA = headA.next if headA else rootB
            headB = headB.next if headB else rootA
        return headA
