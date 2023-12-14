Return-Path: <linux-leds+bounces-405-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7238138A4
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 632CA282592
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 17:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F428675A5;
	Thu, 14 Dec 2023 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="lsJ1+DAj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB9F10E;
	Thu, 14 Dec 2023 09:36:26 -0800 (PST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C789912001A;
	Thu, 14 Dec 2023 20:36:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C789912001A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702575384;
	bh=iVWYFD6b0apij0HQWfsa8gAqaTMVMRAzNodGO05e/bE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lsJ1+DAjunouTieLbR0DMDE+qCUpL/VIvCKfDxmTxqgWwou1vJgPy5TEMeDUyMY17
	 rijdruXZjHnokHnmFWKFPBzB5LV7P9oCurhzZ60Nw+yqqWZ9C3tHRZa3LwDAEph44k
	 NY66cZDjQ9h5WfXg5HKOC49axRfnSvsxqWOHfx0Qe1f8r4KR7md8DNONqyH0Wpo586
	 kdife/rVHy03q5wePcq0d2cJW9uhDVv4BTI5LBVJqOyTt3kHl5W0FJu0urgWbnS4AG
	 Bbx+vxkXBg3cxz3LUaQrntRGI2zqyHxqFJxvqJCXm9pJsWU1qVfjr9owIxDGketVPZ
	 bVNnhzOsyoIlg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 20:36:24 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 20:36:24 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v4 02/10] locking: introduce devm_mutex_init
Date: Thu, 14 Dec 2023 20:36:06 +0300
Message-ID: <20231214173614.2820929-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214173614.2820929-1-gnstark@salutedevices.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182125 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 10:50:00 #22693095
X-KSMG-AntiVirus-Status: Clean, skipped

Using of devm API leads to a certain order of releasing resources.
So all dependent resources which are not devm-wrapped should be deleted
with respect to devm-release order. Mutex is one of such objects that
often is bound to other resources and has no own devm wrapping.
Since mutex_destroy() actually does nothing in non-debug builds
frequently calling mutex_destroy() is just ignored which is safe for now
but wrong formally and can lead to a problem if mutex_destroy() will be
extended so introduce devm_mutex_init()

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 include/linux/mutex.h        | 23 +++++++++++++++++++++++
 kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index a33aa9eb9fc3..ebd03ff1ef66 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -21,6 +21,8 @@
 #include <linux/debug_locks.h>
 #include <linux/cleanup.h>
 
+struct device;
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
 		, .dep_map = {					\
@@ -127,6 +129,20 @@ extern void __mutex_init(struct mutex *lock, const char *name,
  */
 extern bool mutex_is_locked(struct mutex *lock);
 
+#ifdef CONFIG_DEBUG_MUTEXES
+
+int devm_mutex_init(struct device *dev, struct mutex *lock);
+
+#else
+
+static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+	return 0;
+}
+
+#endif
+
 #else /* !CONFIG_PREEMPT_RT */
 /*
  * Preempt-RT variant based on rtmutexes.
@@ -169,6 +185,13 @@ do {							\
 							\
 	__mutex_init((mutex), #mutex, &__key);		\
 } while (0)
+
+static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+	return 0;
+}
+
 #endif /* CONFIG_PREEMPT_RT */
 
 /*
diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index bc8abb8549d2..c9efab1a8026 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -19,6 +19,7 @@
 #include <linux/kallsyms.h>
 #include <linux/interrupt.h>
 #include <linux/debug_locks.h>
+#include <linux/device.h>
 
 #include "mutex.h"
 
@@ -104,3 +105,24 @@ void mutex_destroy(struct mutex *lock)
 }
 
 EXPORT_SYMBOL_GPL(mutex_destroy);
+
+static void devm_mutex_release(void *res)
+{
+	mutex_destroy(res);
+}
+
+/**
+ * devm_mutex_init - Resource-managed mutex initialization
+ * @dev:	Device which lifetime mutex is bound to
+ * @lock:	Pointer to a mutex
+ *
+ * Initialize mutex which is automatically destroyed when the driver is detached.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
+}
+EXPORT_SYMBOL_GPL(devm_mutex_init);
-- 
2.25.1


