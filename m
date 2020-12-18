Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1E92DE223
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 12:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgLRLpC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 06:45:02 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9464 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLRLpC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 06:45:02 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cy6T10vg3zhtN3;
        Fri, 18 Dec 2020 19:43:49 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 19:44:12 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH 1/4] panic: Add new API is_being_panic()
Date:   Fri, 18 Dec 2020 19:44:03 +0800
Message-ID: <20201218114406.61906-2-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218114406.61906-1-nixiaoming@huawei.com>
References: <20201218114406.61906-1-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add is_being_panic() to check whether the system is in panic state.
Used to replace the global variable used to determine the panic status
in other features: hung_task ledtrig-activity ledtrig-heartbeat

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 include/linux/kernel.h | 1 +
 kernel/panic.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index f7902d8c1048..3d6f344771c1 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -167,6 +167,7 @@ void __might_fault(const char *file, int line);
 static inline void might_fault(void) { }
 #endif
 
+extern bool is_being_panic(void);
 extern struct atomic_notifier_head panic_notifier_list;
 extern long (*panic_blink)(int state);
 __printf(1, 2)
diff --git a/kernel/panic.c b/kernel/panic.c
index 332736a72a58..3b6a487702b0 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -125,6 +125,12 @@ void __weak crash_smp_send_stop(void)
 
 atomic_t panic_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
 
+bool is_being_panic(void)
+{
+	return (atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
+}
+EXPORT_SYMBOL(is_being_panic);
+
 /*
  * A variant of panic() called from NMI context. We return if we've already
  * panicked on this CPU. If another CPU already panicked, loop in
-- 
2.27.0

