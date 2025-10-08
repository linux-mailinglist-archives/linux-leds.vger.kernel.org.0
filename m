Return-Path: <linux-leds+bounces-5670-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F4BC4F98
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 14:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7F9A4EFF50
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5304255222;
	Wed,  8 Oct 2025 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="iNPCV9BB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4A20C023;
	Wed,  8 Oct 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927846; cv=none; b=kE9dZ0tnh9vlPfmCFh2+LUgiChfoHKRbigbo7D6fdWl8yq5tjZlucikcpCTPgMMHPvHauamloYdQC5u/4lQhB/VwPGmzhxR9T11tnlxdN7kZ6MXGM/kMPdZQBPZvc0e/P7lDqHwZpicbqozzxR6k0I7pxHOvCXqh4j18Jr1ybk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927846; c=relaxed/simple;
	bh=kgrznO8irHWuXkIwiNhZgAYFnig2K7K5z4CJbGR5Cf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XymuF225To5pWA43WaAlYcbBycWW5roVLYfpPHg0D/Ah8ex7wqqAO049XS1Uno+2C9bfwtueoaYgvrfeJnnmB4rl3+oaCCSrOuplKAmSLEYjxmUBiYltxiijSSogrHXwxY70I1ReUzFfWtb+ZXoMSqiTi43wSeH1WCAT/MlJLHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=iNPCV9BB; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id 68630166D2;
	Wed, 08 Oct 2025 14:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from; s=sel2011a; t=1759927842; bh=kg
	rznO8irHWuXkIwiNhZgAYFnig2K7K5z4CJbGR5Cf8=; b=iNPCV9BBirjmJMzP4K
	SBhbwkOMbASoVOQG0Y9cSCCm0fJoFpvvtyDJLh+vANjxbN5XJI+jbrkODjYJ6qP+
	svMbfYBeIvak3oiZg8vVjtjekRnQCtX2gpOMF6MWt9E7KsGT6Hf5R77ecljSGsXo
	kdvQIR1VAFOn3JVYjX9y7YHYE=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id qtfzY1Bylb67; Wed,  8 Oct 2025 14:50:42 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id E084D1614C;
	Wed, 08 Oct 2025 14:50:40 +0200 (CEST)
From: Christian Hitz <christian@klarinett.li>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
Date: Wed,  8 Oct 2025 14:50:30 +0200
Message-ID: <20251008125031.1174886-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Hitz <christian.hitz@bbv.ch>

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Cc: stable@vger.kernel.org
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
2.51.0


