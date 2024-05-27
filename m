Return-Path: <linux-leds+bounces-1707-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51C8D00E9
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 15:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FFA41F228DB
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 13:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC3715FD11;
	Mon, 27 May 2024 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Olyl4fuc"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8D15FA97;
	Mon, 27 May 2024 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814791; cv=none; b=i0YyLymkG8eln94tnhST4Pl2ibEMhkygMFCBc6PRPA1yBP75tnZob9uYlYs+WwCwGTnn0IjyvL+n80BU4NQekREDJ3acRkwmv+JhqSmumXYDqMcfZKjM3HX1E8L8QFZHnqCkOtyqiWXuxoIRJKTCjPyRrZVEeT31+XUd/Vv9lVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814791; c=relaxed/simple;
	bh=NUoe4mDdPN9W0IzNYWtLfDFheFSeywtuilNg5JQ/k5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bo6dZWfdRF4rGFQDn2oUxgM5tvmtRz90jTKTmWaJ3XfDrLMxZznlrqdDbz+3FiuFMG+zdgEO8gJGp3u3LbN87vxJ/RtOHUTek+r4pzkymmUgnsZLvqWvPgyVsZkmrHH2CLJ/IORzgtdqIHzpXHEtgQMXMN+JVVLChwnHtL29cLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Olyl4fuc; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 67BED1C0002;
	Mon, 27 May 2024 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716814787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuejyrShmDWp6N9DabjjRWMGIOVtRON+WOq46a8Kctc=;
	b=Olyl4fucwY1KvFrTY6et05Q/eLkJaaw30i9SV9uCqwqqo4wUi3PSmf9QA9I560FuHsgcVl
	amQDYSTr2jQwKaCILQHSD/27zD9lFsTMVpQJ2dAJRY2rfu6s89biBPIX0vtRy3pnLLyQvU
	dy8HLq04SL56v4uCD38eSlq1U9BD61O5nyRg0+QcKagjAoRC4864dYqg0HyzdXTHqo1ANt
	Rwn6OAtptkW9vZHhySEoCcJXpTRr947p0OrGw7tPqzfSXZs89p4f0rQMxtFEERWE//rnQM
	hqT9JZy0lehlHJDIBmKT/+S0/hftO9TYth2DRZiPfqELhidCY5DQKL1Y0l2rbg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 3/3] leds: pca9532: Change default blinking frequency to 1Hz
Date: Mon, 27 May 2024 14:59:40 +0200
Message-ID: <20240527125940.155260-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
References: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
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
other led drivers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 356b71a4b7ac..5fefcaae7006 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -240,8 +240,8 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
-		*delay_on = 1000;
-		*delay_off = 1000;
+		*delay_on = 500;
+		*delay_off = 500;
 	}
 
 	led->state = PCA9532_PWM1;
-- 
2.44.0


