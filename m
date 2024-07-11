Return-Path: <linux-leds+bounces-2260-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B792E7DF
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9741C23C91
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3135515DBDD;
	Thu, 11 Jul 2024 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gz+HaNbY"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636CB15B132;
	Thu, 11 Jul 2024 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699306; cv=none; b=G+S54PiiZy358pSycT/ja2+bPSEBBM9SAvtOPJA2V+THjzu21pVs3U3JuCFNHVRKzHERMNA7Xwu6yTToZ8OzTZvd5TSCBZqJxzBQArayHRFy6JyAP1NCpc3yLrRm2ooo94LHCiX+3E7rLVun9ulvbEt+E+lvczQcN6lja6G02eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699306; c=relaxed/simple;
	bh=WTkg1mmgyGocCrar+ee2VYEL/M+E17Wy5b+DjTXF+58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocxqMxBNT7tiKxdWKPHyIFKqzdEZvwREUxJLDpG+E4yOapUjSTTw6ehlzn2P6ShhKzKujx5rs9AA26+SKCb2HfqGuDcP8cP7dzEVxF6BbgWUspbwYzoxxpb/4kPkW0NCDtwtn9rSovVhILSXmPTB2Emwk6+ML6HYJrb6FcdpvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gz+HaNbY; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 31D451BF209;
	Thu, 11 Jul 2024 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720699297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJ4IeC2D0EH+zGYad7gYb+CYdBtZS62UIycZ5DawOR0=;
	b=Gz+HaNbYo0ZIQZzoiz+O/Uio2B5dqHZPbrlYFGLXki0XtO1W3Z7gk+svTYExfH+D3y264X
	20I7XTbVSG346NlQfFb/FHpsgIbvj1OqqHky/0NO12XIyf3VeeM/Jxu1YtQDuyWrWh4MRM
	7MRlCOPGVwSGC6OdtJVlQQ+VJfUPc2adrD+UWQxEX5E4o5pTqamTIDTyyj82bReOUx4bUR
	Pw/1CM2VPmjJ+lA47DvB2Z4kfUXdYNfP0NGIVqnKfnaQE8Imxb6OJva1SaFg4L7bXm+zs2
	Xiyr3Ld84j5LRVKKHnWboz6q8NtmzWW49xeWIx0fMip8eUxBNBdoAQo9xsnwGQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v3 4/4] leds: pca9532: Change default blinking frequency to 1Hz
Date: Thu, 11 Jul 2024 14:01:29 +0200
Message-ID: <20240711120129.100248-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
References: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Default blinking period is set to 2s. This is too long to be handled by
the hardware (maximum is 1.69s).

Set the default blinking period to 1s to match what is done in the
other LED drivers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 673d4d5b62bb..266f6e5001be 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -247,8 +247,8 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
-		*delay_on = 1000;
-		*delay_off = 1000;
+		*delay_on = 500;
+		*delay_off = 500;
 	}
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
-- 
2.45.0


