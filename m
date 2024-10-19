Return-Path: <linux-leds+bounces-3132-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E969A5083
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 21:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0DD1C21A61
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 19:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6BA192597;
	Sat, 19 Oct 2024 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVWsK3oq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38961922F6;
	Sat, 19 Oct 2024 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729366623; cv=none; b=UO01PvKlTKc7cMisy87DP4M2ygbAh8I21ITGLY3TIy1khIf1WTdEhcqN/xcZHybFw3paaH3OaJtbHBXnFim1UfSI0j/xbdoyoR5GfMvQBK/WsOUmanooVOW88RoM9JDIUvasrJyQk1VCB6laL/8S1BNMBknoVbVyLgODXHzUXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729366623; c=relaxed/simple;
	bh=cEEZ0quhccc13X1vvYM+9Xw8Hhji07ouxS88FBE4ebE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LryeVuBcUD4YKlDDRH3U7vqtgZO1W2EtM1hVyOtvgI7Qar7iHozriPgRIJ3xWtN7mL9VivHBFQzESEtng46bSPmbzGBap+uUt8yQurMCi0T0LTaxciBVLH4YGsUO62FPhkqDlO/vyiN2ks/vGzAH3H8yAE+RajhAlnlUUfNEMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVWsK3oq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so2321405e9.2;
        Sat, 19 Oct 2024 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729366620; x=1729971420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leYdjoufQORPLAGvRQEiDcoAbqADrIFzALhOuH3u9D0=;
        b=DVWsK3oq6VbualTCfLvGmWC/gmOCerEyABNm/qa2sEcIEAK0cwMDq+J+5Hon8AxxB/
         ph7krivWftUH5SJOad5LkMPHWJihI4w9XxGONFDhJyqt/zdXa6g5VIPA7XKrHSiqOS8L
         Kf+y9Iq/lS9jwK+d8JKMvlWWOcx5o2cvWN+1boxnISAPGd4x86VuSxEUQSxOlGAFiUJ6
         o86z7KkkiAwAx+JDRBTagXCSIsjZpSYK0cf7VJ6YPQg29dzqa5fkwG6LFn370DVdQQb7
         s16Fa3z1Dp7sp5wCNmBVt7RivT+ipQiDgVr0O+PW81yV6AZwu9E8v2Zw/MZmM7bcLIgc
         0rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729366620; x=1729971420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leYdjoufQORPLAGvRQEiDcoAbqADrIFzALhOuH3u9D0=;
        b=gUVudcvOIPFPq29myAYLdooMvw6pgkgjdapI+hi2EIM+SKbnrZ0FXRGRAIk1fkaz70
         1egA9ruQLaANmhPXe9PA/g/VHxrGa5pWg1Ke5LixV7S170zvIEnsZBFgjbIJ/d0GRdyG
         WSIuUWqLFErqNOZaw2BIA/7MQ7MqD1xGSP2vSwvo5h3bVmobKDo2bgH3cjXMSFT/pe2L
         kkpSkjciDk1S4phX4cuOu/bfAC/P/T4xttJkcrpihL9WOi5C/6yLK6vaxgJMctmWNsSM
         yxFTEmWJqRnZyTqIVt+PrY5KK4S3DNlf2DaBUDg7H/4pQpHFgkZ0JSDNIEqYjowKvIdc
         sVOw==
X-Forwarded-Encrypted: i=1; AJvYcCVsWGHa+WTO5iRzpS+uVhSgK2bR34w6Xq3br210Bc0CtN5LUXAAjtggKGqKxELpxiqq3LhLF6Pp8GzHyeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+JIGjoN09NnzQ1etE7jGMFeOkEWSB4Fzilwy7eXSXR9FBrIr
	/9wfmXzaAKaaiQH+dOclNf0i1RfVrleBznz2GqKwp2Z9l/WcmXos
X-Google-Smtp-Source: AGHT+IED4O7PVswq8U0icu4DMVbrbRmP+/d4MdFLYoFw5/3gXn7E+51r2uYWiXPH8TlAz8x9fsGN6A==
X-Received: by 2002:a05:600c:4e12:b0:431:1d97:2b0a with SMTP id 5b1f17b1804b1-43161641793mr55652255e9.15.1729366620146;
        Sat, 19 Oct 2024 12:37:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57e66asm2671335e9.13.2024.10.19.12.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 12:36:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 19 Oct 2024 21:36:44 +0200
Subject: [PATCH 2/2] leds: max5970: use cleanup facility for fwnode_handle
 led_node
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-max5970-of_node_put-v1-2-e6ce4af4119b@gmail.com>
References: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
In-Reply-To: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729366612; l=1825;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=cEEZ0quhccc13X1vvYM+9Xw8Hhji07ouxS88FBE4ebE=;
 b=fjpdq4xJriM5loAtY7S3JTtytER/f5oDha6KdhhxuOh+xZG5NJ31BTGY8KizgNhSYCTfKPo5H
 3cD/b2DqdFZC5O2SRMofaXl7Ok8Vk57iWCA/POXJXhbKtM9lvuO1NYo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Add the automatic cleanup facility for 'led_node' to simplify the code
and make it more robust against new error paths where omitting a call to
fwnode_handle_put() would leak memory.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-max5970.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index c021330e0ae7..285074c53b23 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -45,7 +45,7 @@ static int max5970_led_set_brightness(struct led_classdev *cdev,
 
 static int max5970_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *led_node, *child;
+	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct max5970_led *ddata;
@@ -55,7 +55,8 @@ static int max5970_led_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
-	led_node = device_get_named_child_node(dev->parent, "leds");
+	struct fwnode_handle *led_node __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "leds");
 	if (!led_node)
 		return -ENODEV;
 
@@ -72,7 +73,6 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 		if (!ddata) {
-			fwnode_handle_put(led_node);
 			fwnode_handle_put(child);
 			return -ENOMEM;
 		}
@@ -90,14 +90,11 @@ static int max5970_led_probe(struct platform_device *pdev)
 
 		ret = devm_led_classdev_register(dev, &ddata->cdev);
 		if (ret < 0) {
-			fwnode_handle_put(led_node);
 			fwnode_handle_put(child);
 			return dev_err_probe(dev, ret, "Failed to initialize LED %u\n", reg);
 		}
 	}
 
-	fwnode_handle_put(led_node);
-
 	return ret;
 }
 

-- 
2.43.0


