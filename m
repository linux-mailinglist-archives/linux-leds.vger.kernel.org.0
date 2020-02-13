Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF07415BB52
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2020 10:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgBMJQM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Feb 2020 04:16:12 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:43408 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgBMJQM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Feb 2020 04:16:12 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id BC96790832B; Thu, 13 Feb 2020 10:16:08 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-serial@vger.kernel.org
Subject: [PATCH v6 1/4] lib: new helper kstrtodev_t()
Date:   Thu, 13 Feb 2020 10:15:57 +0100
Message-Id: <20200213091600.554-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200213091600.554-1-uwe@kleine-koenig.org>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This function is in the same spirit as the other kstrto* functions and
uses the same calling convention. It expects the input string to be in
the format %u:%u and implements stricter parsing than sscanf as it
returns an error on trailing data (other than the usual \n).

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 include/linux/kdev_t.h |  2 ++
 include/linux/kernel.h |  1 +
 lib/kstrtox.c          | 46 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/linux/kdev_t.h b/include/linux/kdev_t.h
index 85b5151911cf..3a5c24bd8fa4 100644
--- a/include/linux/kdev_t.h
+++ b/include/linux/kdev_t.h
@@ -4,8 +4,10 @@
 
 #include <uapi/linux/kdev_t.h>
 
+/* dev_t is 32 bit wide, 20 bits are used for MINOR, 12 for major */
 #define MINORBITS	20
 #define MINORMASK	((1U << MINORBITS) - 1)
+#define MAJORBITS	12
 
 #define MAJOR(dev)	((unsigned int) ((dev) >> MINORBITS))
 #define MINOR(dev)	((unsigned int) ((dev) & MINORMASK))
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0d9db2a14f44..9cf694c5d2c3 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -410,6 +410,7 @@ int __must_check kstrtos16(const char *s, unsigned int base, s16 *res);
 int __must_check kstrtou8(const char *s, unsigned int base, u8 *res);
 int __must_check kstrtos8(const char *s, unsigned int base, s8 *res);
 int __must_check kstrtobool(const char *s, bool *res);
+int __must_check kstrtodev_t(const char *s, dev_t *res);
 
 int __must_check kstrtoull_from_user(const char __user *s, size_t count, unsigned int base, unsigned long long *res);
 int __must_check kstrtoll_from_user(const char __user *s, size_t count, unsigned int base, long long *res);
diff --git a/lib/kstrtox.c b/lib/kstrtox.c
index 1006bf70bf74..e1b896635c6a 100644
--- a/lib/kstrtox.c
+++ b/lib/kstrtox.c
@@ -19,6 +19,7 @@
 #include <linux/export.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/kdev_t.h>
 #include "kstrtox.h"
 
 const char *_parse_integer_fixup_radix(const char *s, unsigned int *base)
@@ -367,6 +368,51 @@ int kstrtobool(const char *s, bool *res)
 }
 EXPORT_SYMBOL(kstrtobool);
 
+/**
+ * kstrtodev_t - convert a string in format %u:%u to a dev_t
+ * @s: input string
+ * @res: result
+ *
+ * This is the reverse of print_dev_t. The first number is interpreted as major,
+ * the second as minor.
+ */
+int kstrtodev_t(const char *s, dev_t *res)
+{
+	unsigned long long _res;
+	unsigned int ma, mi;
+	int rv;
+
+	rv = _parse_integer(s, 10, &_res);
+	if (rv < 0)
+		return rv;
+	if (rv & KSTRTOX_OVERFLOW || _res >= (1U << MAJORBITS))
+		return -ERANGE;
+	ma = _res;
+
+	s += rv;
+
+	if (*s++ != ':')
+		return -EINVAL;
+
+	rv = _parse_integer(s, 10, &_res);
+	if (rv < 0)
+		return rv;
+	if (rv & KSTRTOX_OVERFLOW || _res >= (1U << MINORBITS))
+		return -ERANGE;
+	mi = _res;
+
+	s += rv;
+
+	if (*s == '\n')
+		s++;
+	if (*s)
+		return -EINVAL;
+
+	*res = MKDEV(ma, mi);
+	return 0;
+}
+EXPORT_SYMBOL(kstrtodev_t);
+
 /*
  * Since "base" would be a nonsense argument, this open-codes the
  * _from_user helper instead of using the helper macro below.
-- 
2.24.0

