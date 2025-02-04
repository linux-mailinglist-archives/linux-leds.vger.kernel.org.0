Return-Path: <linux-leds+bounces-3875-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA89A26C49
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 07:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E8497A4179
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B64204080;
	Tue,  4 Feb 2025 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Fj5y1/Bd"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001223D81;
	Tue,  4 Feb 2025 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651994; cv=none; b=hrksCGXjDPA0gC2Ce3c398L5qToPXF6OGCUMaLvc8rORuCGDPrDfNTE2x5gcHigH3jd3zc2wZwE9bZfGk2CCXoO4YgdYliJLlMBDOrcJAxhl9Dg9WR4D8H4eDpbU2Ud+jc1J/Kn+8rEcT7Ok+QAtYQUFvc1z8uAmawP0f7LMsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651994; c=relaxed/simple;
	bh=e9ndPcbZwm5RuvhZvDZBuPk4IeP+XyR5Pvj0NbdTTec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UxUWGWRgRuJUfooVKeyikT5bEkb44BBZDLtsSC4upUbRj12+AQi4nEEwPhTPoPoXtiG39xH2uB1ObR3FTrtijEB2miXZHbcEQj8puka4A6FDtSTivfehE5TCa3ytjIFWWaZcFlbhXsz58a46/vmiMBf+FB1SMx9+OsP7iN/cH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Fj5y1/Bd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738651982;
	bh=e9ndPcbZwm5RuvhZvDZBuPk4IeP+XyR5Pvj0NbdTTec=;
	h=From:Subject:Date:To:Cc:From;
	b=Fj5y1/BdV0YQzl0M/limq+nrItnNFBRLlaAHWKnYEBgPbS+4IZNeNt4U2k1mFCyJ4
	 XGLsfAx0maidRV/35vgB/h9aYTqTm66v6wm8IPzmuZGVfrGsLqoRTOpaDijjm49sxy
	 w8rKBFLaZQMxk2u6lbQAd/scSbKmraa5MFBNGDsU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/2] locking/mutex: Mark devm_mutex_init() as
 __must_check
Date: Tue, 04 Feb 2025 07:52:49 +0100
Message-Id: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEG5oWcC/33NQQ6CMBCF4auQWVtDiwq68h6GECiDnRiK6ZSKI
 b27FfduJvln8b0VGB0hwyVbwWEgpsmmULsMtGntHQX1qUHl6iDzQopxZt9og/ohegxjM84el4Y
 seaFbfayKrm+rASEBT4cDLRt+q1MbYj+597YV5Pf7Y9P5xwYppMBTjt257CpdqusLiZm1mc3eo
 oc6xvgBq6/k3skAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738651981; l=1043;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=e9ndPcbZwm5RuvhZvDZBuPk4IeP+XyR5Pvj0NbdTTec=;
 b=gb7LykAWGBP7maTIml4gPL18TQZbsN9rUuVRQjeEHiyogkzfHbxrBaxXErfRQiYKfcui7ls/u
 nfW2I89DFoyBJDCccbhZG8Qzvkp1szGqGQeJo7nf+L3Sn4UuAf5say9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Enforce all callers
checking the return value through the compiler.

The series should go through the locking tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase on 6.14-rc1
- Fix up leds-1202 driver
- Link to v1: https://lore.kernel.org/r/20241202-must_check-devm_mutex_init-v1-1-e60eb97b8c72@weissschuh.net

---
Thomas Weißschuh (2):
      leds: st1202: Check for error code from devm_mutex_init() call
      locking/mutex: Mark devm_mutex_init() as __must_check

 drivers/leds/leds-st1202.c |  4 +++-
 include/linux/mutex.h      | 17 ++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241031-must_check-devm_mutex_init-cac583bda8fe

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


