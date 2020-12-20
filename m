Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C482DF36F
	for <lists+linux-leds@lfdr.de>; Sun, 20 Dec 2020 04:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgLTDp4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Dec 2020 22:45:56 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10052 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgLTDp4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Dec 2020 22:45:56 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cz7ks2h6JzM6xk;
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
Subject: [PATCH v2 1/4] panic: Add new API in_panic_state()
Date:   Sun, 20 Dec 2020 11:45:02 +0800
Message-ID: <20201220034505.113118-2-nixiaoming@huawei.com>
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

For some features (such as hang_task, ledtrig-activity, ledtrig-heartbeat)
different processing logics need to be performed based on whether the
current system is in panic state:
	1: Register hook for panic_notifier_list.
	2. Assign a value to the global variable in the hook function.
	3. Determine whether the system is in panic state based on the
          global variable and perform different processing.
Duplicate code snippets exist, and the timing judgment is relatively lag.
Therefore, consider extracting the new API: bool in_panic_state(void).

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 include/linux/kernel.h | 1 +
 kernel/panic.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index f7902d8c1048..c9a9078157b6 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -167,6 +167,7 @@ void __might_fault(const char *file, int line);
 static inline void might_fault(void) { }
 #endif
 
+extern bool in_panic_state(void);
 extern struct atomic_notifier_head panic_notifier_list;
 extern long (*panic_blink)(int state);
 __printf(1, 2)
diff --git a/kernel/panic.c b/kernel/panic.c
index 332736a72a58..351627883a04 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -125,6 +125,12 @@ void __weak crash_smp_send_stop(void)
 
 atomic_t panic_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
 
+bool in_panic_state(void)
+{
+	return (atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
+}
+EXPORT_SYMBOL(in_panic_state);
+
 /*
  * A variant of panic() called from NMI context. We return if we've already
  * panicked on this CPU. If another CPU already panicked, loop in
-- 
2.27.0

