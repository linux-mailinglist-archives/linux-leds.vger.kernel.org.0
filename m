Return-Path: <linux-leds+bounces-4631-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250AAB68F8
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 12:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08391880275
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 10:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE212749FE;
	Wed, 14 May 2025 10:37:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81AD274646
	for <linux-leds@vger.kernel.org>; Wed, 14 May 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219022; cv=none; b=IMxjvvPUdSZ3Lu+Zi6HercitDBCTX5te64yvfSx2iv4ACGW+k6PSUtwiurFtVssn1PApZ+Jdy9NxKwHBrP2t4ggcGeyOvtTQ6HwoKVMWSLOUfLW1Tw+2gaIt9/Ih5ACwRAvzv+vToAdLWEkFpu6qJ+FfDBTFGjNvR5W2zOUr114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219022; c=relaxed/simple;
	bh=bUyax5imlyqIQbEI5jvfWLUcntK2ZMI0w/Iig53hQQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiiNXWU4KromXYyywuec5XpRpwyxMOg623/zdiybYP1bittomjHl547wPWaFjTJuh3eDVJrtCbxrrYFgcCFUp1M3uIUmWp8xgh4rZrMN6CaAQypQl89AYvpYQcRiWv//vxBpUCZFO5/aFnd/Ie7IqaH44GRfbzXMRZeOQfVIPUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1uF9Tl-0004uZ-Tm; Wed, 14 May 2025 12:36:49 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 14 May 2025 12:36:30 +0200
Subject: [PATCH v2 3/4] leds: lp5860: save count of multi_leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-v6-14-topic-ti-lp5860-v2-3-72ecc8fa4ad7@pengutronix.de>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Save the count of multi_leds child nodes for later use.
As the leds are added to a flex array, the size needs to be saved at
runtime.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/leds/leds-lp5860-spi.c | 2 ++
 drivers/leds/leds-lp5860.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/leds/leds-lp5860-spi.c b/drivers/leds/leds-lp5860-spi.c
index 751cc4184037c3c0e14d3493d0a43f0885786523..eee41ee8a8c226db6a68413998642624fabffe7c 100644
--- a/drivers/leds/leds-lp5860-spi.c
+++ b/drivers/leds/leds-lp5860-spi.c
@@ -50,6 +50,8 @@ static int lp5860_probe(struct spi_device *spi)
 	if (!lp5860)
 		return -ENOMEM;
 
+	lp5860->leds_size = multi_leds;
+
 	spi_set_drvdata(spi, lp5860);
 
 	spi->mode = SPI_MODE_0;
diff --git a/drivers/leds/leds-lp5860.h b/drivers/leds/leds-lp5860.h
index b4255fb48372814c7fda86ada96f504c2036f534..3b8342a832bc75afdf2318fd4ee1ee9ce105cbe3 100644
--- a/drivers/leds/leds-lp5860.h
+++ b/drivers/leds/leds-lp5860.h
@@ -305,6 +305,7 @@ struct lp5860_led {
 struct lp5860 {
 	struct device *dev;
 	struct regmap *regmap;
+	unsigned int leds_size;
 
 	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
 };

-- 
2.47.1


