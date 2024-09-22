Return-Path: <linux-leds+bounces-2794-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B897E2C6
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2024 19:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D291F215E7
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2024 17:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09692AE9F;
	Sun, 22 Sep 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANwRQu8u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E9BA2E;
	Sun, 22 Sep 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727026827; cv=none; b=SKdjAV55DmU7dy35fa8R1CngrtqvVDncM4igg5f6NTukYpb+QgGPZ+Za6FvHbVGgceQhCeTGm3S83HhQb/DBwrsa9La0hK+04t+1ktYW5I+qmXQs1r1VYWcKA4bY2Bok7I+5uf067QMejn4h0B7Pvyn83olqbzcKyPWQgwm2Tvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727026827; c=relaxed/simple;
	bh=KaTEJurr5esKIvt/wzEiT1eeI53y2ekWehCUmOnrxzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLprhe+UKSVVuVvKy2hGb0vWLFJQ/9Q/jX1xQDKfsqU/+UNG+zdt+BkjCKyjoxKx9ET6V59WBsmka1rUIVpfaJVDHm8ErzIpV945xWxTml0yfx0CfZLRUYKs4Ax+2hnYVKcDT3JzZuYlLTS4BlpW239oaGQl29A08RdrI9Yfdb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANwRQu8u; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so2940124a91.0;
        Sun, 22 Sep 2024 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727026825; x=1727631625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pegc1W8q8SefoEn3z8bhlEgbTYwGVDSq17LZIGmX43o=;
        b=ANwRQu8uzf8Vt+/UdxNljI1ImgIFpwrvzUFP9I04YEH9dRXYx1m9PjW9oqIgtfkfFJ
         2TJfBJDHWWebU8suWyQKmg2xvwM0A7VuD4sLkWKYMf7m4wUigzzMlFusHaQYOgX3ZDRT
         Sjt3LEl7vavaOCoihz95WzcrfanxBdFL4eD95bq+ASB/yrifgx0kJK3mHgCzataLqLEV
         bwBzgXEvR6ejeYdP5CCB7kCzYT5tAGUXQpKjK2MalqcP02AX3aFGFC4C4UPgbJoVgHxB
         ADGV8Qp1AL5hITRCEJk1424ZIJ5KqYTLWHDl+R7bSR5p3NCCmO/xf6Ljqll9aJX+OXm3
         M+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727026825; x=1727631625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegc1W8q8SefoEn3z8bhlEgbTYwGVDSq17LZIGmX43o=;
        b=FZgJVJJoWZlNvGIEJKe0NKkCZuXqa7eHorapt1u1Ic6G5VE6W0NWLijyGutRXBoxX3
         14jxRbrxIoqWX4CXsnkvbr7psQjwbii0npNbPlPot6mJ0kQ+bl0+Bj6iHIrWzWq/Vpkw
         EvaFgHXgQ5qPL7oQTyqLYS23E7lJH+bskCBvDBEgenULcSt5b5FFtK1+kXgsUDcxL2cE
         uwWPK6NuYrsVYyjNwwuQX/YzggZIJ1swgmvJlOuu8F2Y5HUbqIB7KyiLdnCnFG2AhPN4
         8IxNjKFyWBsCGDETKLQBSDvXIFTFHdJgdZWgxo+BvvsYzBLa3iZRRThgHTjOMGuKMjdJ
         vRsg==
X-Forwarded-Encrypted: i=1; AJvYcCVQGo4TqP0ZtkXdXEyzIbzCRZs/Q/bDmvGmkWVOiVrmWVODv/rUvDfNZN06e1TyfLaRFeOKwnyIIvufFA==@vger.kernel.org, AJvYcCXhODiDOHhr33+zOuF91a0+9CnxN2z2isl3NlEELo3vyEkzl6SOJplb7+R7O+9ER4iTQFaNYL1QBTzGBPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+dVNLKKgq/F/DQAM1qvH3VxZuj0jg1R3dMQ9/gAsoPeugzNoE
	s+ajj+weYifzQ7SNucbJwWQ7yrrq+ySrbPNDDzIK3fHXUck/8/Dw
X-Google-Smtp-Source: AGHT+IEnFngIm8EUjwceCg4uTUu29Aj8e5dF5tnAafNS56MGqMSHVvG60wDouE7ULQy1LoiCn6R0AA==
X-Received: by 2002:a17:90a:6443:b0:2c2:df58:bb8c with SMTP id 98e67ed59e1d1-2dd7f451214mr11849232a91.18.1727026825475;
        Sun, 22 Sep 2024 10:40:25 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f825733sm5759786a91.17.2024.09.22.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:40:25 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: avel@ucw.cz,
	ee@kernel.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: leds: replace divide condition 'shift / 16' with 'shift >= 16'
Date: Sun, 22 Sep 2024 17:40:19 +0000
Message-ID: <20240922174020.49856-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch reported following:
'''
drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'
'''
Replacing 'shift / 16' with 'shift >= 16'.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 246f1296ab09..13f535ccba0b 100644
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


