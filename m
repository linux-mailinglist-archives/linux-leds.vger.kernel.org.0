Return-Path: <linux-leds+bounces-3897-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B145AA2D75B
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 17:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFBEC188938E
	for <lists+linux-leds@lfdr.de>; Sat,  8 Feb 2025 16:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C5F1F30C8;
	Sat,  8 Feb 2025 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ny1XhArJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B7154445;
	Sat,  8 Feb 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032224; cv=none; b=lSC+e2SQvpLVbAd66B0MeaAL/MbpWR5Z1bLaYynSC2Wv1CZ8eGxT2D8m51cEPEYl/5K/T9rcWqDNvV79Vc+4P+zur1mQMt4Ymfh4EtjlXicpZDLe9cP73iLPr3nc/PMJn3GTGFRmD1/khA6laZ7mD1ANrELJEO39FQ185XL/lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032224; c=relaxed/simple;
	bh=S+FgsT4YmTc9xZS3TcIUnObVuDCWJlNFwJHQyUr8Bl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZTCOCNceYMCd7lryig5iZ2q+am+HbJzgYTdASYRgKvdMIbhQRZX0NRSW9sQFBqc4h214lIoFknOlmXoGkAOlk2UTFR6C2AHavKKEH5bm9qqtQpYXwkO/7qjARU5Ykw0uWtFcW183X21GtYnCUs1h6iHKMibTQMWq8JMR7KdR5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ny1XhArJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739032220;
	bh=S+FgsT4YmTc9xZS3TcIUnObVuDCWJlNFwJHQyUr8Bl0=;
	h=From:Subject:Date:To:Cc:From;
	b=ny1XhArJYA3nmrmSvzPTHTuptpJb7xPxFUxZUlTodnrDSNZKdoiTigio5gJHzBSpP
	 C0xaIVuWw76aGfKBiUQ3dsqge8pyNCjitqQ6Ki33NRPT73RsNnEbrYvhL/+5MqNjHX
	 lq3ykjo7/btcp8JCX2Xan/4O8sp4bZZv+wkpXc54=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] locking/mutex: Mark devm_mutex_init() as
 __must_check
Date: Sat, 08 Feb 2025 17:30:02 +0100
Message-Id: <20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIqGp2cC/33NTQ6CMBCG4auQrq1py0/RlfcwhtAy2ImhGFoqh
 nB3C8aVCZtJ3lk830wcDAiOnJOZDBDQYW9jpIeEaFPbO1BsYhPBRMZZymk3Ol9pA/pBGwhd1Y0
 epgoteqprnZepauqyBRKB5wAtTht+vcU26Hw/vLetwNfvl41njw2ccgoFA3WSqtRSXF6AzjltR
 nO04MlqB/HzciZYtusJyqhUhZBcZ0pC8ecty/IBrlAqTxkBAAA=
X-Change-ID: 20241031-must_check-devm_mutex_init-cac583bda8fe
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739032220; l=1217;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=S+FgsT4YmTc9xZS3TcIUnObVuDCWJlNFwJHQyUr8Bl0=;
 b=ST/Gfa1vXaFKGJvEL3yIbebIuSviD0jUwCW3sc3iHkIybaLa8vc74liDOiu2+6zE7dYxu4tAT
 cFaib2WJQnbDbXHQHoQQ+yO1UBkBkLYjICfvDNIiDmx/SBSUwSQzz3Q
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Enforce all callers
checking the return value through the compiler.

The series should go through the locking tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Introduce and use helper macro __mutex_init_ret()
- Link to v2: https://lore.kernel.org/r/20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net

Changes in v2:
- Rebase on 6.14-rc1
- Fix up leds-1202 driver
- Link to v1: https://lore.kernel.org/r/20241202-must_check-devm_mutex_init-v1-1-e60eb97b8c72@weissschuh.net

---
Thomas Weißschuh (2):
      leds: st1202: Check for error code from devm_mutex_init() call
      locking/mutex: Mark devm_mutex_init() as __must_check

 drivers/leds/leds-st1202.c |  4 +++-
 include/linux/mutex.h      | 11 +++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241031-must_check-devm_mutex_init-cac583bda8fe

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


