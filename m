Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C072DF373
	for <lists+linux-leds@lfdr.de>; Sun, 20 Dec 2020 04:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgLTDqA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Dec 2020 22:46:00 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10051 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgLTDp5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Dec 2020 22:45:57 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cz7ks2QM6zM6xn;
        Sun, 20 Dec 2020 11:44:21 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Sun, 20 Dec 2020 11:45:07 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>, <rdunlap@infradead.org>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH v2 2/4] hung_task: Replace "did_panic" with in_panic_state()
Date:   Sun, 20 Dec 2020 11:45:03 +0800
Message-ID: <20201220034505.113118-3-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220034505.113118-1-nixiaoming@huawei.com>
References: <20201220034505.113118-1-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace the global variable "did_panic" with in_panic_state()

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 kernel/hung_task.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index bb2e3e15c84c..2747cd6dd35e 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -50,7 +50,6 @@ unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
 
 int __read_mostly sysctl_hung_task_warnings = 10;
 
-static int __read_mostly did_panic;
 static bool hung_task_show_lock;
 static bool hung_task_call_panic;
 static bool hung_task_show_all_bt;
@@ -72,18 +71,6 @@ unsigned int __read_mostly sysctl_hung_task_all_cpu_backtrace;
 unsigned int __read_mostly sysctl_hung_task_panic =
 				CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE;
 
-static int
-hung_task_panic(struct notifier_block *this, unsigned long event, void *ptr)
-{
-	did_panic = 1;
-
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block panic_block = {
-	.notifier_call = hung_task_panic,
-};
-
 static void check_hung_task(struct task_struct *t, unsigned long timeout)
 {
 	unsigned long switch_count = t->nvcsw + t->nivcsw;
@@ -223,7 +210,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	 * If the system crashed already then all bets are off,
 	 * do not report extra hung tasks:
 	 */
-	if (test_taint(TAINT_DIE) || did_panic)
+	if (test_taint(TAINT_DIE) || unlikely(in_panic_state()))
 		return;
 
 	hung_task_show_lock = false;
@@ -347,8 +334,6 @@ static int watchdog(void *dummy)
 
 static int __init hung_task_init(void)
 {
-	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
-
 	/* Disable hung task detector on suspend */
 	pm_notifier(hungtask_pm_notify, 0);
 
-- 
2.27.0

