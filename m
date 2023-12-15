Return-Path: <linux-leds+bounces-426-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB68141F3
	for <lists+linux-leds@lfdr.de>; Fri, 15 Dec 2023 07:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C6701C21D9B
	for <lists+linux-leds@lfdr.de>; Fri, 15 Dec 2023 06:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A69DDAD;
	Fri, 15 Dec 2023 06:50:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE798DDBA;
	Fri, 15 Dec 2023 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Srzfz2LKqz9tNC;
	Fri, 15 Dec 2023 07:23:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrLiEn9V7Nq8; Fri, 15 Dec 2023 07:23:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Srzfz1R30z9tMd;
	Fri, 15 Dec 2023 07:23:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B2898B779;
	Fri, 15 Dec 2023 07:23:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1waOS0s7MwND; Fri, 15 Dec 2023 07:23:07 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (PO24393.IDSI0.si.c-s.fr [192.168.232.43])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 43B508B767;
	Fri, 15 Dec 2023 07:23:06 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: andy.shevchenko@gmail.com,
	pavel@ucw.cz,
	lee@kernel.org,
	vadimp@nvidia.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hdegoede@redhat.com,
	mazziesaccount@gmail.com,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	nikitos.tr@gmail.com,
	George Stark <gnstark@salutedevices.com>
Cc: kernel@salutedevices.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH RFC v4-bis] locking: introduce devm_mutex_init
Date: Fri, 15 Dec 2023 07:22:57 +0100
Message-ID: <c16599b23afa853a44d13b906af5683027959a26.1702621174.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231214173614.2820929-3-gnstark@salutedevices.com>
References: <20231214173614.2820929-3-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702621376; l=3497; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=knrBp746sRirj9OKdUXZaiSIemnmdrXDctpOz0/Uwjo=; b=+opv6gcWbrLeFdYYfVWPIrvouBaqSluxG3A/gtkg5iBiHt+lU0qsRcFaFbwopezLi3Az4FikW sty92y+bjXNA4nO2gBMv0UQcdmKg/7LcnOWvyLu+jdlkCo/JKXNtSMh
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

From: George Stark <gnstark@salutedevices.com>

Using of devm API leads to a certain order of releasing resources.
So all dependent resources which are not devm-wrapped should be deleted
with respect to devm-release order. Mutex is one of such objects that
often is bound to other resources and has no own devm wrapping.
Since mutex_destroy() actually does nothing in non-debug builds
frequently calling mutex_destroy() is just ignored which is safe for now
but wrong formally and can lead to a problem if mutex_destroy() will be
extended so introduce devm_mutex_init()

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/mutex.h        | 28 ++++++++++++++++++++++------
 kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index a33aa9eb9fc3..db847220ef44 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -81,14 +81,10 @@ struct mutex {
 #define __DEBUG_MUTEX_INITIALIZER(lockname)				\
 	, .magic = &lockname
 
-extern void mutex_destroy(struct mutex *lock);
-
 #else
 
 # define __DEBUG_MUTEX_INITIALIZER(lockname)
 
-static inline void mutex_destroy(struct mutex *lock) {}
-
 #endif
 
 /**
@@ -153,8 +149,6 @@ extern void __mutex_rt_init(struct mutex *lock, const char *name,
 			    struct lock_class_key *key);
 extern int mutex_trylock(struct mutex *lock);
 
-static inline void mutex_destroy(struct mutex *lock) { }
-
 #define mutex_is_locked(l)	rt_mutex_base_is_locked(&(l)->rtmutex)
 
 #define __mutex_init(mutex, name, key)			\
@@ -171,6 +165,28 @@ do {							\
 } while (0)
 #endif /* CONFIG_PREEMPT_RT */
 
+struct device;
+
+/*
+ * devm_mutex_init() registers a function that calls mutex_destroy()
+ * when the ressource is released.
+ *
+ * When mutex_destroy() is a not, there is no need to register that
+ * function.
+ */
+#ifdef CONFIG_DEBUG_MUTEXES
+void mutex_destroy(struct mutex *lock);
+int devm_mutex_init(struct device *dev, struct mutex *lock);
+#else
+static inline void mutex_destroy(struct mutex *lock) {}
+
+static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+	return 0;
+}
+#endif
+
 /*
  * See kernel/locking/mutex.c for detailed documentation of these APIs.
  * Also see Documentation/locking/mutex-design.rst.
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
2.41.0


