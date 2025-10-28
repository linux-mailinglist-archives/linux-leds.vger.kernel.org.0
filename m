Return-Path: <linux-leds+bounces-5924-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBEC15768
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 16:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586BB1B260EB
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3369833971F;
	Tue, 28 Oct 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TCA4OOXG"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21190C133;
	Tue, 28 Oct 2025 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665481; cv=none; b=UUJ9Bt4b6uZ/xqsloTdvfjfeapwsm+NgRLTXLv/kVBB7c8g2auIM9EPNUYlYN41MOA9VjKc8ZzcFspkMkM+lh0X6nq8MEqr3bukUDgg3UvbVl8oDNxfydyG/arCXRM8RrZXpGM/3pIkUUTItOCQ/lzFKf/OuYkQlQPlh9yXb3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665481; c=relaxed/simple;
	bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kDGfmScCfQS3HjNkSNHN90kX7hpAY6vrRvzQ/Y/PEN2tYJZr/umTURleg2GCpOTW1DocAp7+sORGJWuWbdU1/gf51s95OiPXgH9MHROvWAkGybbXD9hnQaUYzOFIAH2jxrD3Dt121wyl22wxi//TbgQgB1EB0t0L0yY6SBtqJ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TCA4OOXG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1761665469;
	bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
	h=From:Date:Subject:To:Cc:From;
	b=TCA4OOXG9+UCc7CZiOkQFM/GW2kS+WqshLkFSOfdh1CxfyXxDbJSftqs9jKgzNZoe
	 TmtQq1VJ4Uku4w05BjiZMp+VddrZfcwCe1cb5+Di0utgFnCs1cwuTokvrAjwnZZFiG
	 EAcUg1uryw/YeAHk0LcW/qUUQFj4DSa4t6wX3CFk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 28 Oct 2025 16:31:03 +0100
Subject: [PATCH] leds: leds-cros_ec: Skip LEDs without color components
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-cros_ec-leds-no-colors-v1-1-ebe13a02022a@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIALbhAGkC/x3MQQqDMBBG4avIrB0wASH1KlKKJr/tgGTKDBRBv
 Luhy2/x3kkOEzhN3UmGn7hobQh9R/mz1DdYSjPFIY5hiImzqb+QeUdxrspZdzXnkLCmErAtj0g
 t/ho2Of7j+XldN8MzoG1oAAAA
X-Change-ID: 20251028-cros_ec-leds-no-colors-18eb8d1efa92
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761665467; l=1805;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
 b=UjRulbLbK2+GN0xY/1dSSmLc4Xadqk2KEj5cukNLVODnGzdH5+07GuEURF3jX3ChBOKQdGMrI
 xcwvkUNJ4aiB37QDMehwdzZQo2I2NYRAAFwdkgcbDS0vnJkWPwrgOf6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

A user reports that on their Lenovo Corsola Magneton with EC firmware
steelix-15194.270.0 the driver probe fails with EINVAL. It turns out
that the power LED does not contain any color components as indicated
by the following "ectool led power query" output:

Brightness range for LED 1:
        red     : 0x0
        green   : 0x0
        blue    : 0x0
        yellow  : 0x0
        white   : 0x0
        amber   : 0x0

The LED also does not react to commands sent manually through ectool and
is generally non-functional.

Instead of failing the probe for all LEDs managed by the EC when one
without color components is encountered, silently skip those.

Fixes: 8d6ce6f3ec9d ("leds: Add ChromeOS EC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/leds-cros_ec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 377cf04e202a..bea3cc3fbfd2 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -142,9 +142,6 @@ static int cros_ec_led_count_subleds(struct device *dev,
 		}
 	}
 
-	if (!num_subleds)
-		return -EINVAL;
-
 	*max_brightness = common_range;
 	return num_subleds;
 }
@@ -189,6 +186,8 @@ static int cros_ec_led_probe_one(struct device *dev, struct cros_ec_device *cros
 						&priv->led_mc_cdev.led_cdev.max_brightness);
 	if (num_subleds < 0)
 		return num_subleds;
+	if (num_subleds == 0)
+		return 0; /* LED without any colors, skip */
 
 	priv->cros_ec = cros_ec;
 	priv->led_id = id;

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-cros_ec-leds-no-colors-18eb8d1efa92

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


