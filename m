Return-Path: <linux-leds+bounces-6788-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PeNCakse2lRCAIAu9opvQ
	(envelope-from <linux-leds+bounces-6788-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0AAE3D3
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13627303D651
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 09:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180E3371046;
	Thu, 29 Jan 2026 09:46:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD0737FF5F
	for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679992; cv=none; b=fDcMIKzAjf6D1pE3X4574oe679e4iy5jEk8u4n2EN8ovhlC/PxVIvzoNOBXL/CgBy/uqwDcGlTk2R7CeH/OVjmBQaodLp/K9QPxB2FuicLO4Jp+wmfdUe9KiEKxn2uzcLR0MBc/TdFCNDtZVcCjrMJ2YFebGLAwDjGn6T5IgJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679992; c=relaxed/simple;
	bh=gwioLcmtUIC/AIvVIzpQ0AH+XJ3UAiNQSFTwSZmr0Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PonjqybRtrmU9tL8St+AWzq5bMmCyfP50to+EM6tZQRWeoj7XR9McSL6XJjoaCjPEZU/4fKbMb8lq4s6Ulj9pGsjp1GrfkE/p+N3rPu/qErbuCEv3yptzWj2SXWWwniVnVcTCwfVL3ZUjmX+39T2qzFXrKXN/BekGxl7tikllnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vlObY-0000zg-3u; Thu, 29 Jan 2026 10:46:24 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 29 Jan 2026 10:45:55 +0100
Subject: [PATCH 1/2] leds: lp5860: Fix compilation as module
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-v6-19-topic-ti-lp5860-fixes-v1-1-635ab524ebbd@pengutronix.de>
References: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
In-Reply-To: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6788-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: BBC0AAE3D3
X-Rspamd-Action: no action

When the lp5860 is compiled as module, the lp5860_device_init/remove
functions must be exported or the spi-specific module can not use these
functions and the compilation will fail.

Add the needed EXPORT_SYMBOL_GPL calls and while at it the
MODULE_LICENSE and _DESCRIPTION for the lp5860-core module.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601230708.wwFMOXZp-lkp@intel.com/
---
 drivers/leds/rgb/leds-lp5860-core.c | 6 ++++++
 drivers/leds/rgb/leds-lp5860-spi.c  | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 977741a070d19..28b4d86e11f1a 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -185,6 +185,7 @@ int lp5860_device_init(struct device *dev)
 
 	return lp5860_init_dt(lp);
 }
+EXPORT_SYMBOL_GPL(lp5860_device_init);
 
 void lp5860_device_remove(struct device *dev)
 {
@@ -192,3 +193,8 @@ void lp5860_device_remove(struct device *dev)
 
 	lp5860_chip_enable_toggle(lp, LP5860_CHIP_DISABLE);
 }
+EXPORT_SYMBOL_GPL(lp5860_device_remove);
+
+MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("TI LP5860 RGB LED core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
index d6b8d93c09978..1a35a18f50fde 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -85,5 +85,5 @@ static struct spi_driver lp5860_driver = {
 module_spi_driver(lp5860_driver);
 
 MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
-MODULE_DESCRIPTION("TI LP5860 RGB LED driver");
+MODULE_DESCRIPTION("TI LP5860 RGB LED spi driver");
 MODULE_LICENSE("GPL");

-- 
2.51.0


