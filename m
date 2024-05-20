Return-Path: <linux-leds+bounces-1685-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA08C9ADF
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 12:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D91281AC7
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 10:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7D64CE05;
	Mon, 20 May 2024 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WhmDdrhW"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5B481CD;
	Mon, 20 May 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199276; cv=none; b=U3pLWTp0mQ0T1xEW211/JN61DjHBqc0sjI7dIeiE+x89W/aktGOAJqAjK8gaeKsrrQnmc2WclZWbrkwgn42qoEW66MQgPPfCt3zzNyq0bRLq09/basfiaaI8BcybC4GSmUDAVVX7oakiV03W4TcO+nx8wAbPZxOO/xM5Vde+zWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199276; c=relaxed/simple;
	bh=BcMXMIsO1+Tp961ErDaYIMw6fdjqO2GgDS3upFE+hj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADt9Iz/xCCic9agN3tdK2CeNlXhc30VbXXPRpUwlO9fHpGkbq2f86JfHtm1UBHEfTCZO4rHbZkzBO/+zNLnr71smr533f0sKasX6F4e7Sr+mz6Bf6uG1+kUySWzfSYBiGwaMBCL6bIjBx6YCjnu1xSGbMajtHCUhgeXY6gotRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WhmDdrhW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716199266;
	bh=BcMXMIsO1+Tp961ErDaYIMw6fdjqO2GgDS3upFE+hj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WhmDdrhWo33Rk9k9SHe0ItXblVL/obibAghcLq6Jxrh4td6V2BufSDcoqgunLS5Vr
	 KRyQmaqlR/DVBBdYK+N3wJL6M2NLEaNl2JQnqneWI1uRPQF55X+W2A20cCaKVxRX4+
	 l8iq+tUXvFfvj8X0gD02IDcUYYM851u2T66Td75k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 20 May 2024 12:00:30 +0200
Subject: [PATCH 2/5] leds: multicolor: use led_color_name function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240520-cros_ec-led-v1-2-4068fc5c051a@weissschuh.net>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
In-Reply-To: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716199265; l=937;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BcMXMIsO1+Tp961ErDaYIMw6fdjqO2GgDS3upFE+hj8=;
 b=xq/8FXBPWAH0B005k6cY7z5AwjTdngxVumJMnJdYq4wbjq0eZI3W0MekS3WW4KST81Fd8yCjB
 45kT8sgA9JaCJaagWlzyBCFzBe2keaWExFCDBkiqCcQ6XX33IxYIp76
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

led_color_name is a safer alternative to led_colors.
led-class-multicolor.c is the only external user of led_colors and its
removal allows the unexporting of the array.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class-multicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index ec62a4811613..34bdebcf239e 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -101,7 +101,7 @@ static ssize_t multi_index_show(struct device *dev,
 
 	for (i = 0; i < mcled_cdev->num_colors; i++) {
 		index = mcled_cdev->subled_info[i].color_index;
-		len += sprintf(buf + len, "%s", led_colors[index]);
+		len += sprintf(buf + len, "%s", led_color_name(index));
 		if (i < mcled_cdev->num_colors - 1)
 			len += sprintf(buf + len, " ");
 	}

-- 
2.45.1


