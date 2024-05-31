Return-Path: <linux-leds+bounces-1779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3B8D66F5
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34155283D5E
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE01416EBF5;
	Fri, 31 May 2024 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TXYxNV2B"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE517D88A;
	Fri, 31 May 2024 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173223; cv=none; b=thcVm50nN9AYvqvlh8SM851OexzOMG9Hr7rQI3+phyPRxHfydcc/yq+Gnq8E1veR9RCnv8+0DDBAC+L2aVG1jjOogkajyTxJmGJeE/4/0Xn21dIx2N5B3oeoiIQGwwIUBxyjeODAqcCVpiosmM3VYF2lzGrN8YnyfRqaQMAm5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173223; c=relaxed/simple;
	bh=mR6GzlkWH3qHprHn11q+4xst17qh+XBAHkTQgtLxS4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cv9JtLoHvNCRSZ1PuvmrBcSKFRZMvq91b3Uk+MLsqpP3jKvC3r2g9mf/7m1LQdXiXPLuWX66OTJ4WDKKQa75d/bmhaHqf3MMpYkAk2O3uOMX8YfDLj4VGGcdQ8/NMr8hespfkhPNCWCBSj1jlTP74XU7THd7wQNpXbWPc/X1Egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TXYxNV2B; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717173219;
	bh=mR6GzlkWH3qHprHn11q+4xst17qh+XBAHkTQgtLxS4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TXYxNV2B//jK3MqoIzUgwNlLwzUfPNSFwgednrs+peOnP0kCUXd+amePHM8fFfjjK
	 y18QbG1JpLyK5RST/1c9X6Z0nh9vDf7xB7SxEfg/MxFTUitxWhqXtHWBzFSWvE6RI6
	 ZILZ4Z8jJZYHbVNiYAn10AlLSjyk/iitSVSYrAmQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 31 May 2024 18:33:32 +0200
Subject: [PATCH v2 2/5] leds: multicolor: Use led_get_color_name() function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240531-cros_ec-led-v2-2-6cc34408b40d@weissschuh.net>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
In-Reply-To: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717173219; l=942;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mR6GzlkWH3qHprHn11q+4xst17qh+XBAHkTQgtLxS4o=;
 b=tUA8JrwsAnM/01+XZiQJ1wK2eRlxXmLXA2mipUdTZ4tlgRS+Dhip9uCkV6wxFxR/F2ygTYpyE
 sWVEa58x0EnAcLS2wCm6/2M6TZWjhu6DmiuEJ+7zE7fyagdhqdSSpAG
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

led_get_color_name() is a safer alternative to led_colors.

led-class-multicolor.c is the only external user of led_colors and its
removal allows unexporting the array.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class-multicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index ec62a4811613..584e3786a1e7 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -101,7 +101,7 @@ static ssize_t multi_index_show(struct device *dev,
 
 	for (i = 0; i < mcled_cdev->num_colors; i++) {
 		index = mcled_cdev->subled_info[i].color_index;
-		len += sprintf(buf + len, "%s", led_colors[index]);
+		len += sprintf(buf + len, "%s", led_get_color_name(index));
 		if (i < mcled_cdev->num_colors - 1)
 			len += sprintf(buf + len, " ");
 	}

-- 
2.45.1


