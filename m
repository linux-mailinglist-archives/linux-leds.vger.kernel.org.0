Return-Path: <linux-leds+bounces-2533-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEC95F2F2
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2024 15:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D553E1F25A57
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2024 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA2416F908;
	Mon, 26 Aug 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mAKD5Sbq"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454253373;
	Mon, 26 Aug 2024 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679165; cv=none; b=gvIlarQV8hObjsu7NNY2mgDsOVtaa6/ovq8NkHz1csSw63gFCilTPhbXHpVSu8f+7jCizeGHwJ4Ag3sIAHUOcfmbl998CLn1Qpt+iyClZTFqXp2ITezDGncpNJizdP59PgW4PW78fOEejVf71SUZ2hEvMRtTpi73ooC6SFO8P2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679165; c=relaxed/simple;
	bh=hMPEedZ7R8kQX2dAOqK1OinhKb8ITJnQhO+8RaFfET0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DDq73TCwwoCK6epaNeOFnwI87vv+Oyi4TiwgjxnwVq31ZEF4W+UA3lOrY1+0Ek++VSpJUdLBrbHwwgQfkl/EwR1JUjiXhyrFhpi0p4Pey3IypKYOeEnPd4OD7DF9MuxskvJKkqPA0DXFnzRIc2UDa9bvcYHEZDg/mNHVqeZUaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mAKD5Sbq; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 052F4E0009;
	Mon, 26 Aug 2024 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724679160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fl/SRGdttN3lDqzZyvZSVzuNCB/OVFNgjawoVIbl+Rc=;
	b=mAKD5SbqWGZ+7WygHA3/fj5+Ong7bLdaqJFsQI/caBjZPgcc1KMRxTA7PvLjpwVuUn7Mb/
	ltilOywn2keIo4EsUSLcKZyX3v/lkZppfEDpnouD34TgFHe0Poz6Sr7PdbLcNe1CqAXxat
	qbiECd7junX1KdKIcTM7unhWGhwuVLUObZXclr10JZJ/erYNzE/+PLCfVA5FvFxls+7mrt
	/SW2VMbq5u8fRnThJp49pJAm2FLfzIdpAKEsEJ3jtYfLUVxJUYDAwX4yBW0n467rulnhZA
	+NG8V92US7tgFZzxUHZyQ6G9jXIkfvM3r/Ls91CsbeazM0MI/awcbpeIA0JzYA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	stable@vger.kernel.org
Subject: [PATCH] leds: pca9532: Remove irrelevant error message
Date: Mon, 26 Aug 2024 15:32:37 +0200
Message-ID: <20240826133237.134604-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

The update_hw_blink() function prints an error message when hardware is
not able to handle a blink configuration on its own. IMHO, this isn't a
'real' error since the software fallback is used afterwards.

Remove the error messages to avoid flooding the logs with unnecessary
messages.

Cc: stable@vger.kernel.org
Fixes: 48ca7f302cfc ("leds: pca9532: Use PWM1 for hardware blinking")
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 9f3fac66a11c..bcc3063bd441 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -215,8 +215,7 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 		if (other->state == PCA9532_PWM1) {
 			if (other->ldev.blink_delay_on != delay_on ||
 			    other->ldev.blink_delay_off != delay_off) {
-				dev_err(&led->client->dev,
-					"HW can handle only one blink configuration at a time\n");
+				/* HW can handle only one blink configuration at a time */
 				return -EINVAL;
 			}
 		}
@@ -224,7 +223,7 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 
 	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
 	if (psc > U8_MAX) {
-		dev_err(&led->client->dev, "Blink period too long to be handled by hardware\n");
+		/* Blink period too long to be handled by hardware */
 		return -EINVAL;
 	}
 
-- 
2.45.0


