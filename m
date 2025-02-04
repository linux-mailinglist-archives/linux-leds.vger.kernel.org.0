Return-Path: <linux-leds+bounces-3874-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F7A26C47
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 07:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F561621D6
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 06:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66D2036FA;
	Tue,  4 Feb 2025 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="el64BpR/"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017D158524;
	Tue,  4 Feb 2025 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651994; cv=none; b=erfJYVy4929V8hVarhQx522GLnx3lckIhuhT3sF/q5zcEvMHiJ/Mirl3F5B8xPn6ladGlIHZPFdxP7w8hvYhlJDukH8u6X1XSqLsVFrHFZg5+X44vVhrFXnp2rgFGIG+958e4NbhJFL3zVJ48/35PDt4MUHF5+qDkQwIYPg8Rg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651994; c=relaxed/simple;
	bh=8o4oNcfMbl5apVwsKTboT/C2NPZBgsAaBH5eEBfrt/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+PVxZc9t/FP+01P7RISgfHJ1C4QZb6xwuv/1QbSXhWBGjhZedLjJIGPoJmFH1yfFAkxHj4NnhRQ661V0XrrVb8OtlT3lbRETa0Qz6m2rHFZLRx1cCZ93sl8eQc+r09PVDnExT0SDDsACc55TocKSOanUyM8feaIwpK1ZyRFlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=el64BpR/; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738651982;
	bh=8o4oNcfMbl5apVwsKTboT/C2NPZBgsAaBH5eEBfrt/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=el64BpR/F9AGD97NSmKAhZXtLVaMPXocgKTj9jv0zQ43wKPc2upHptB4MrTFiN1PR
	 8IoZcdHFiFfqBsrS1qs0LTqHmsoJAhSacN91gZ6+tRS62AH078Vx40fQ6C9QDHuV9C
	 v0IcxmzRfssEgPXe1sR/yDaJ1UtUcKTsGNCDviJw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Feb 2025 07:52:51 +0100
Subject: [PATCH v2 2/2] locking/mutex: Mark devm_mutex_init() as
 __must_check
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-must_check-devm_mutex_init-v2-2-7b6271c4b7e6@weissschuh.net>
References: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
In-Reply-To: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738651981; l=2054;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8o4oNcfMbl5apVwsKTboT/C2NPZBgsAaBH5eEBfrt/c=;
 b=i2FB1C+6Hk6bvSnTgIrPAVu13VpecclEIRL+TbUqweG0T5nwPZh0q38d71SvN/gAA3ANJqQZa
 QrE1BvjpaddBw5ZxsfQGKvUGznhrozy3OwSYaZ9FIRfXTtzQ2qkm/Ly
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Enforce all callers
checking the return value through the compiler.

As devm_mutex_init() itself is a macro which can not be annotated,
annotate __devm_mutex_init() instead.
Unfortunately __must_check/warn_unused_result don't propagate through
statement expression. To work around this move the statement expression
into the argument list of the call to __devm_mutex_init() so
devm_mutex_init() directly expands to __devm_mutex_init().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/mutex.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2bf91b57591b49e4668752e773419ae945f124da..65b28c9e6efc123982d923d1ed171eae471c82c1 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -126,11 +126,11 @@ do {							\
 
 #ifdef CONFIG_DEBUG_MUTEXES
 
-int __devm_mutex_init(struct device *dev, struct mutex *lock);
+int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);
 
 #else
 
-static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
+static inline int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock)
 {
 	/*
 	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy() is just a nop so
@@ -141,13 +141,12 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
 
 #endif
 
-#define devm_mutex_init(dev, mutex)			\
-({							\
-	typeof(mutex) mutex_ = (mutex);			\
-							\
-	mutex_init(mutex_);				\
-	__devm_mutex_init(dev, mutex_);			\
-})
+#define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ({	\
+	typeof(mutex) mutex_ = (mutex);				\
+								\
+	mutex_init(mutex_);					\
+	mutex_;							\
+}))
 
 /*
  * See kernel/locking/mutex.c for detailed documentation of these APIs.

-- 
2.48.1


