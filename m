Return-Path: <linux-leds+bounces-3129-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1B9A4BD8
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 09:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1601C22070
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2024 07:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A97C1CF2AC;
	Sat, 19 Oct 2024 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBbGe+1r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E01CC890;
	Sat, 19 Oct 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729323191; cv=none; b=FTyIuleEeeBs0m13VSe+S2hGDA8QkwzYYCZuUXq1Ev5t09EZ/ewAhA9wIVBARyHQRFLrA+OHLMSwirb7gmiErzCUAq0TdnN9lTfdAnNLGjUWxSqwnYT8YMOuasyucI3iIKC4wbP/pJ//B2rOP9H7v5GZVXaEtOAQHZxXslw3b3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729323191; c=relaxed/simple;
	bh=PM1w9jPYNHRU+duHImk/IOAFy3VpBGInZe9wWXFLRc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRr1zljhxcTnftpM/ZrADoz4UZLI4d39Gw6t1Uv6UdmGXGVaWfjsr7TLttH4nF875Vm1Y4SStRqj0wlbBzZaNapb7yzNQoEHtCUdfh+VKCdo4Uqbr+4qjpFmWmk7NwPXCO6GGUhOCg8eXUl+x/wUUmELtuta/PhkusBVal5p448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBbGe+1r; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c767a9c50so27798305ad.1;
        Sat, 19 Oct 2024 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729323189; x=1729927989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lIu+bEoFl/+r/8JR6eoKiKy3olXY3TGY7BGrpwebwk=;
        b=TBbGe+1rwybie9lrDsL9ng/c5RIBoW/PuWiaSdRttfo/cS75EkS32EW1uXSdur8ZEv
         8P7GXi8wJ46ryCRM18BVL/FKXf1T6UH9bGRs8D5AD+PFhpJo9Xnrc41uIzQYqsv63zXM
         ItBerq2z8YucduHJUC/AzJLi5DF1a5kQ4YvEfnXKFgsazANa5FRKOuQccs57rX6xqh8a
         Zs4r3+IlOGj3rbHfXrT/nPGlx9ulPvSZPm2n3gtQ5XTJ84Oswu1bWSyL7LTKSndCNKRJ
         Wy1Kmr1LDr4vpTgfHb1yLpdDX4686V9TN2b7xkR8aLn0CxkQvHcT8E2DN2kl4E+9MqKP
         7hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729323189; x=1729927989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lIu+bEoFl/+r/8JR6eoKiKy3olXY3TGY7BGrpwebwk=;
        b=p+wAr1OfeMr6DRgv2ISGoVDRlkbQS6vVWFBpHZlwjcLbpjqeb19L96lPScV2DzP686
         3jCZM6i+1wN7mVcGojInPIQqFg8mrjXnSnv4P6kewmopaXrguGxMqAM3s1u43HOMy9zc
         dUqZeVhfBl+/5pDD1C7Qfzv5TRO1KH+KkznQfzTG9PLKiTqJvWl7WXIPlFXYsJbBLT0t
         H82dhwM8sj5uhU7QtiNViXP6+Mn6E/XKaUrwa3+EgirtqKf2dD5Uip0smyOc7khM8ciq
         xMN6PhIQDSZgCw1UK6g7WDip9wuDYz12s/9pY5yEh07umx1mPju3bn43vyV/1NGMxceq
         twVg==
X-Forwarded-Encrypted: i=1; AJvYcCUnfgYfaLs8B4X73feJmavx+gK0xa+OdVAsdBN9ch0c0upBpRqFBumHR4EDBfSH3CmX2Uw0q70KpwWM7g==@vger.kernel.org, AJvYcCXDp7h36jT4kibL7pReAavadaz9sXXWKxoWwwGIpQV7Q6j9BnKxOvJTiy748T8qTMK/qEacSEXx2dpi6cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwutfhPb9eq9AxTHbNTDiSrbt4baSuUgK8kTgWPUw7VRWyozDbS
	FcjLE/twzEqpq8Z2IzXIlCTG4+TA/CblsrhbPTMhjhqKbppuummzv/gMMQ==
X-Google-Smtp-Source: AGHT+IGeCPFVsEf+ZjSSJ0DmPlGqLZtKnyfJ6/ukYudRaS6qlR3B/jq99wetB1TY62zsPU+MSfvDQA==
X-Received: by 2002:a17:902:d505:b0:1fa:1dd8:947a with SMTP id d9443c01a7336-20e5a92837emr58392975ad.46.1729323188843;
        Sat, 19 Oct 2024 00:33:08 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f3d42sm22877205ad.211.2024.10.19.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:33:08 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: lee@kernel.org,
	pavel@ucw.cz
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: bcm6328: Replace divide condition with comparison for shift value
Date: Sat, 19 Oct 2024 07:33:01 +0000
Message-ID: <20241019073302.35499-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following Smatch warnings:
drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
v2:
 - Changed the patch subject as suggested
 - Changed the patch description
v1: https://lore.kernel.org/all/20240922174020.49856-1-kdipendra88@gmail.com/
 drivers/leds/leds-bcm6328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 29f5bad61796..592bbf4b7e35 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -113,7 +113,7 @@ static void bcm6328_led_mode(struct bcm6328_led *led, unsigned long value)
 	unsigned long val, shift;
 
 	shift = bcm6328_pin2shift(led->pin);
-	if (shift / 16)
+	if (shift >= 16)
 		mode = led->mem + BCM6328_REG_MODE_HI;
 	else
 		mode = led->mem + BCM6328_REG_MODE_LO;
@@ -357,7 +357,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		break;
 	case LEDS_DEFSTATE_KEEP:
 		shift = bcm6328_pin2shift(led->pin);
-		if (shift / 16)
+		if (shift >= 16)
 			mode = mem + BCM6328_REG_MODE_HI;
 		else
 			mode = mem + BCM6328_REG_MODE_LO;
-- 
2.43.0


