Return-Path: <linux-leds+bounces-5852-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A823BFA3E2
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 08:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21C344E5D5F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 06:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388BF2EC55C;
	Wed, 22 Oct 2025 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="z0DZXkro"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CB025784B;
	Wed, 22 Oct 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114825; cv=none; b=py+h/ZHEM+MY2/OUrpRjxam4Rw3E6eASBIIPa54k7wkhCl1s/nqS/eLiu6zBqMDnm+hYMwc9KMRLJfgnNoTrD/ZNTJKjfc0PAAZnd4y6VNwRHC4v81cCW/8zYbgj2BprOTX+AnkJn6aw3N712ZF7esdN0XdKbL2i5ugXEqO18bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114825; c=relaxed/simple;
	bh=flOl1xCGuCOPWGoBMyaOBP2p4GmZpiLATLs+rbLLmEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WevDtihfaczjyjpNoXlZ8md39UZQK93rfP5fd/ugAaw1a8PDCWJue773vm7DbeUlVC9tpqi/ktNQ+LIKPuFr86xKl3DqU9SKloxavi3PzVxKDmAD8c9JT3MN8owx3qtT7xJjEijzAdrZuEhF8LXthmxeLRyQ8TfMODiRCkDv+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=z0DZXkro; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id 733D9166D7;
	Wed, 22 Oct 2025 08:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from; s=sel2011a; t=1761114813; bh=fl
	Ol1xCGuCOPWGoBMyaOBP2p4GmZpiLATLs+rbLLmEM=; b=z0DZXkroMiSV9rsxQy
	fSpwWOIum+QbeW7pU9OrGzgSI+Jlwjutj85VZwek+6E0aG8Lqft+totSlKL5/jfT
	YHhCEFQsHeU+E+Rho3uAGzVnRkrcxu2SoUjVGI5Hsj7HHpZEFSq+m3bS5aFjtrr/
	BVb8DAzmONqOFcarRFvFBPpQE=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id DYbDTf5dOueE; Wed, 22 Oct 2025 08:33:33 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id 410A5166D6;
	Wed, 22 Oct 2025 08:33:32 +0200 (CEST)
From: Christian Hitz <christian@klarinett.li>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
Date: Wed, 22 Oct 2025 08:33:04 +0200
Message-ID: <20251022063305.972190-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Hitz <christian.hitz@bbv.ch>

LP5009 supports 9 LED outputs that are grouped into 3 modules.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")

Cc: stable@vger.kernel.org
Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Changes in v2:
 - Improve log message
---
 drivers/leds/leds-lp50xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 94f8ef6b482c..05229e2f2e7e 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -54,7 +54,7 @@
 /* There are 3 LED outputs per bank */
 #define LP50XX_LEDS_PER_MODULE	3
 
-#define LP5009_MAX_LED_MODULES	2
+#define LP5009_MAX_LED_MODULES	3
 #define LP5012_MAX_LED_MODULES	4
 #define LP5018_MAX_LED_MODULES	6
 #define LP5024_MAX_LED_MODULES	8
-- 
2.51.1


