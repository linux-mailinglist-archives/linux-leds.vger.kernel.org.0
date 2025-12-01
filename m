Return-Path: <linux-leds+bounces-6358-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59091C95B26
	for <lists+linux-leds@lfdr.de>; Mon, 01 Dec 2025 05:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF66E3419A0
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 04:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C631DE8BE;
	Mon,  1 Dec 2025 04:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRGbC9U2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014A036D51B
	for <linux-leds@vger.kernel.org>; Mon,  1 Dec 2025 04:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764563216; cv=none; b=DgZKSo1F07OJDLtQ/JC6Tnaq9AXF3CUOaUrQa0o96qskTsaH8bGzfR5iyICym5rJgqqTU407lsecqPm7WtYVcPpHIc8rBJr8HX0n0K3bbNYYCx17PJTimQMYDL+8mnTgpeatfL8kdoD1Yzn7lxMHs/8pp9v7nSXfAwKBWPeLhUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764563216; c=relaxed/simple;
	bh=s2zZcpkhEWJzD4hdcW5jRWBegv/r6soWrUEvNqdRjVU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=om2hj7p3BQfdNimleQDfVjqmOJluuNnyJ0GcKlysrYi8ln9B1njLLe6izGL2zrOdfj968XW0FfaYnGXP2sgBak1mUoghiD3M+FQlGQvH5yH/32n5Vy2tN1OH//28YvDOd0lNRaKQL8NvvaV94HV+yqiQTw53zSrvi3bXL8p6vAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRGbC9U2; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-882379c0b14so30143256d6.1
        for <linux-leds@vger.kernel.org>; Sun, 30 Nov 2025 20:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764563214; x=1765168014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iA2L2HQEqrwIONxNXAAo9wwBSUWk3QOPio/3w8+Rs+0=;
        b=RRGbC9U2lARf+wuNHcpl6t/YojrhsvUVyxkJ/o9wprDqqykQ8GDQQILLj++UbMQya/
         lfsG0u5RbAJzveDg4VqoaQXqkc+NM1tv5TZPjFOJKJS6xCJeXXG7n0SrwXKo3Tvcj65w
         +NjToBT9oxvyygqrWunT3kAG9jRGfa7HIWhDJQO9pPyGw0zUiujuEfW+6GDmYGuYpehU
         w8qIHJmywOFr+dFD870HtJd/Xj3cM8fAZsYVeOkRY9K9PnXPq5GzLp/GTZChrAT/jpWq
         WICpmvuQStpSarROYSU7GcQfaj58DEzu1e3V1WLknYEkcsnFSB/etjefYxid0yabBl+A
         83lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764563214; x=1765168014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA2L2HQEqrwIONxNXAAo9wwBSUWk3QOPio/3w8+Rs+0=;
        b=pa3VrGlU7KSqsjp3IGgjseH/uJAdStfm35eTk9DermJZ4qb8RN/CT1r64JFsvzoUth
         0Ms6Fb6oQQOnqch6V0n7Oal6mlSEj5GOS4h3TEPUbsaRL1/BzmkR+c23VByZiOptJPxm
         Py0xgIZwgp+rH7eQzrgVLhLcP+h0QD+2TCSfva9A3wP2VLdTbRwG6GJjkwuhaB1qxDEw
         ddTsb9kzLRZt5BBSujYDtDS5A1uJXPvPicjF51K9lWpos2DwpzmxgfDH5gaCtBwmg9E6
         mBq+R8VePWKSWU2WHU7KPbazTakI4rdtCg4SBEt5xtr8ki0iH9tfSVDwIlajS36+T1zE
         bIAA==
X-Gm-Message-State: AOJu0YzRhhSy2nvNvfblsdosTDh43zEjUA/062ldW6v1IGLsryHqr66d
	en8IaMzHa/MpiuOFN8O+lzLGSMS62XhRLYa6SSX3X4SKfTCREzeyrlTI06J7JQ==
X-Gm-Gg: ASbGncusy0aN6HRlBRCECK1x209VkbzyB6agPw5Wg8e+KmhFiZqrudfxqtuucYKMPvQ
	aZKlgLrvspJBmjVqZvnqUzGn+ElAC+wG4yVG2X34f/5w6o5voPMjJu+AtaFsVbfCH/DZHL9Yej0
	U1AMCAj6eh0JVNGKSICqFhAhMRSTYla+dn1lLXRyCwVV8OjteJNXTEpUm0XRvw22JyYhALfpPbr
	yXyGF8YAD5qdsLlNLVci3OkaQNARco+dpLgx8PXR9BA063Z43L3yIm+Mua9crLRjvZTTYpWeY6F
	fLb46b8ydmJKs6bM68I4Q3bzVbbNO5k+Rl0jbPuub1vbHsFy26VUYMcEYZ8ibQjrqsm/OHjL8De
	GvrImezk8ic9k1MiTfLzRr26QJ7lLpQghu+oyEo+kiTXO0UJz9a09kv5BZJzxvq7uumT8QMISkF
	6djsWbLPOU5t3HHHK4aRmuu1gDK7mATRxVZqhkYcHPblU=
X-Google-Smtp-Source: AGHT+IHJNgnwvHT8MT6+kFZLJD0Hr6y23R2yf99SVlSjIE66NXGl1ukySq/D0tYSFKVIS/2/Iy5WIA==
X-Received: by 2002:a05:6214:e85:b0:87b:cbf7:5eae with SMTP id 6a1803df08f44-8847c57cd6cmr710418546d6.59.1764563213698;
        Sun, 30 Nov 2025 20:26:53 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b494e0sm75621836d6.26.2025.11.30.20.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 20:26:53 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Balachandhar TN <vivek.balachandhar@gmail.com>
Subject: [PATCH] leds: lm3692x: fix kernel-doc for struct lm3692x_led
Date: Mon,  1 Dec 2025 04:26:12 +0000
Message-Id: <20251201042612.2099239-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 reports several kernel-doc warnings in
drivers/leds/leds-lm3692x.c:

  Warning: leds-lm3692x.c:122 struct member 'boost_ctrl'
  not described in 'lm3692x_led'
  Warning: leds-lm3692x.c:122 struct member 'brightness_ctrl'
  not described in 'lm3692x_led'
  Warning: leds-lm3692x.c:122 struct member 'enabled'
  not described in 'lm3692x_led'

These fields were added to struct lm3692x_led but the corresponding
kernel-doc comment was not updated. Convert the kernel-doc block to
use the "@member: description" style consistently and document the
boost_ctrl, brightness_ctrl and enabled fields.

This keeps the documentation in sync with the implementation and
silences the W=1 warnings.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/leds/leds-lm3692x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index c319ff4d70b2..1d64ceb5ac85 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -104,6 +104,9 @@
  * @regulator: LED supply regulator pointer
  * @led_enable: LED sync to be enabled
  * @model_id: Current device model ID enumerated
+ * @boost_ctrl: Cached configuration for the boost control register
+ * @brightness_ctrl: Cached configuration for brightness/brightness control
+ * @enabled: Cached enable state of the device
  */
 struct lm3692x_led {
 	struct mutex lock;
-- 
2.34.1


