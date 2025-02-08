Return-Path: <linux-leds+bounces-3896-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD9A2D75A
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 17:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE25E3A42CE
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 16:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57F221106;
	Sat,  8 Feb 2025 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="btzsGsCk"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75121F30BF;
	Sat,  8 Feb 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032224; cv=none; b=KrKMJ2wpgEH6znmAmlAvT7lZAcwuuNOUcwhCfJvUofXLMsCvtpAPyB32xES5YGCb/61VTFZ6D+yR7wNafpSOlhKT7TyvO+OngV6IFn1fvatHoo8S8PYXAv95vZ2SSJrpcv4QPil3reZ3q9rvaOjwDWx5YnGDfNz+9IYcrZsD7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032224; c=relaxed/simple;
	bh=CaCYZdoznE8WXB+t4HNPsgCbCMDDiyEbSGnXkSMn6g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3XqCAxCgR50uWQrFqHZjrpvSaUGfqgJnIol/k7IQ7PwZMp8ZQRstFY3GRb4x2oRXTim/yZwvA0RKbC4XkbKtBd3md+hmMwF/wG3NFolOD4tcvphsQMZbXhXsqGjjarVkSr5uV5F5eI74F0V5XTlSisYvpdoTMDMHBk7yIY+auI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=btzsGsCk; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739032220;
	bh=CaCYZdoznE8WXB+t4HNPsgCbCMDDiyEbSGnXkSMn6g8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=btzsGsCkKjEIbxIsSJ24YcyNkyx8a1wyGV4gJyzf+IvG2MzjPEFuJmFxSXEH2U0Ip
	 DlhKzBfeFOsWUnsY9a0rZPrHhA7sk5E+UTtgCTRdaTfoR3YB9M45yY7WXGHYxR772n
	 kSkeUfQvaZ43A12mVABwc00sWINulKz6JeSvxcuU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 08 Feb 2025 17:30:04 +0100
Subject: [PATCH v3 2/2] locking/mutex: Mark devm_mutex_init() as
 __must_check
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-must_check-devm_mutex_init-v3-2-245e417dcc9e@weissschuh.net>
References: <20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net>
In-Reply-To: <20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739032220; l=2032;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CaCYZdoznE8WXB+t4HNPsgCbCMDDiyEbSGnXkSMn6g8=;
 b=0ZxN+2uSZvaFdCeSXX5kVzhUxZVR9ll2dqmtVANSNQIw2rGkOw9DGeuBvPeweEjcp65yEp/1u
 RLtjJtBcFV7Cq5ngLpBp2isXBaOuAoQat+2hIOOtSA56SBuIsM7A8+m
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Enforce all callers
checking the return value through the compiler.

As devm_mutex_init() itself is a macro, it can not be annotated
directly. Annotate __devm_mutex_init() instead.
Unfortunately __must_check/warn_unused_result don't propagate through
statement expression. So move the statement expression into the argument
list of the call to __devm_mutex_init() through a helper macro.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/mutex.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2bf91b57591b49e4668752e773419ae945f124da..970b0526c549b699e7e4e1ba522696537957e069 100644
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
@@ -141,14 +141,17 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
 
 #endif
 
-#define devm_mutex_init(dev, mutex)			\
+#define __mutex_init_ret(mutex)				\
 ({							\
 	typeof(mutex) mutex_ = (mutex);			\
 							\
 	mutex_init(mutex_);				\
-	__devm_mutex_init(dev, mutex_);			\
+	mutex_;						\
 })
 
+#define devm_mutex_init(dev, mutex) \
+	__devm_mutex_init(dev, __mutex_init_ret(mutex))
+
 /*
  * See kernel/locking/mutex.c for detailed documentation of these APIs.
  * Also see Documentation/locking/mutex-design.rst.

-- 
2.48.1


