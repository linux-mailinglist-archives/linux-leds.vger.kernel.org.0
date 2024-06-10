Return-Path: <linux-leds+bounces-1868-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB4902BD6
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 00:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940AD282524
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2024 22:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B261509A4;
	Mon, 10 Jun 2024 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvmvFSCU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A545466B;
	Mon, 10 Jun 2024 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718059233; cv=none; b=ix2ZnRgFEzb5Ku0/t+XRzzCl/I+jJaSjQuc24eqZzqEoBkQW3wBb0jWGMvFc9kKwzOc8jcJ+2buWTH5FjOWO3lQGW3roYLXZpl8rQ1BgG4p8Cj59w/J9VpbotePERJALkaq+LpwHQGfutNNjXavJW9Xy2lictv2GV+6Pbt5A/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718059233; c=relaxed/simple;
	bh=g10dlOBGYYkPLn3+3Cuj4VRZAJwM6Vn3EQdE5kpHkMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DtLqYNqL+mt4rX8x4qkiArci6zjwmDOaauE7toHoFpGTRP6Gb/BSB4+EA7u3krKBl8OgAthxb35RBuUTWSuCx81UvFGlRFmzsILI8EvPKMdYVFq6Y6p4aFJotRDkXE5RrZ+RnHzgIlhKoWuYqoTUVUOoFjnmy51Bst7ERfGlm7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvmvFSCU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f0d6255bdso2755791f8f.1;
        Mon, 10 Jun 2024 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718059229; x=1718664029; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpPyXWTVTerEIWhQ6o8wHto+dQPxy/WMM7tzpvoV1CQ=;
        b=GvmvFSCULRcafeNEh/wYJb3jCoXJ7i/o5lKlpfZ9QwxmpSRn3QyKoJnw+PuNmD9XTm
         fF2v+Wg7qJakweGkXDvYTqJpeXPGgjhfFlscLSfZ/YN2Oq85UU1OFKgfMDgdZ04rd3+1
         oqxpptgVDY1Kw5BqrQBkGqLAu7QlcLVyCurdzH7lff2ows3XQFlsUu13YihyeAfJ0AxH
         nV++COgTNyXofDmwB133xxsH/fQa+V5iirG4lMikWv2G2gOiBS8gIjoYdAgGE+Gky+kV
         bIYbr3dqLdK3lM46Gk0Ne8UBcWsDP2ymUUMyFjPWCkv4I691O/G47ViRSeS7gMinlIwV
         HhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718059229; x=1718664029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpPyXWTVTerEIWhQ6o8wHto+dQPxy/WMM7tzpvoV1CQ=;
        b=J433hfblN4NlEzzQWdWwEGXkrys0fTLsCMul9F9K8cJE2k2z90hyt52Af0QXQNZ3k8
         baEuAEczRvxnMNQNV8GJKGCAjlVoT3Qr8kufXDIsl+UfCBaENHaKitUXwChRUzFPrnlN
         rgzjHg8lto+GgxvNDnOY8QR6o4pq8HvflH2kB3ij1e/OextdnRO8FbCk1MiCTuO/G4CI
         oJaodf455KskuUwUyUmNRStc0WFnMItdyvu/vaZ1nEz5xShkUK1o/oD2YP2za8Gpe799
         G24ZXwNeRV5aQ0pFZBprNXRYxU/2tZPJX+vVsMILm/ho9PyauvDcOM0dDLOOuwzEvwF0
         g+lA==
X-Forwarded-Encrypted: i=1; AJvYcCVQB51HIS6TYO4jTbv9RU+rtPEhf8NqAcFyTaGin2U/dKjVW8aBu1FzaqIwjKGwt+0kjGR07K2ychXhv7YUm3GZ0/yMtGtDJ1ngqV89RX2+6vHZuDH+VULhSJz6NnooVYyRJ4Bq
X-Gm-Message-State: AOJu0YwuL0PNv3BubVyQRBnAnQJKGXO5lfqECMA3XA6FWeGCjKmCq6hq
	/lYL6r6OT/6V/ZBWuHP/2SejPbyWr+2wAmUNrcUT2c4u2kRaXJXK
X-Google-Smtp-Source: AGHT+IH4nQiCT9WMClPt604ZYVbJsCXhC4V56JFsZoe2WZyh2Jw0qDjY9RyNp0aFPn3YwnD54yHR8Q==
X-Received: by 2002:a5d:5f8f:0:b0:354:ddba:303a with SMTP id ffacd0b85a97d-35efedd7dbfmr8382883f8f.54.1718059229080;
        Mon, 10 Jun 2024 15:40:29 -0700 (PDT)
Received: from [127.0.1.1] (194-208-201-054.tele.net. [194.208.201.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d6990csm12131971f8f.58.2024.06.10.15.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:40:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Tue, 11 Jun 2024 00:40:26 +0200
Subject: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
X-B4-Tracking: v=1; b=H4sIANmAZ2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0MD3ZzUlGLd3BIzYzMD3dzU3JzUxGxdc4u0xDTjVBNj0yQDJaDOgqL
 UtMwKsKnRsbW1ACiVgOllAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718059227; l=1877;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=g10dlOBGYYkPLn3+3Cuj4VRZAJwM6Vn3EQdE5kpHkMY=;
 b=cR0LfOzpw4hwGKrOjdhmiXFbXriHLO5gLjMX4rHeP62PmE4NBWzxHdshrumFnOnhMhbrKZA4G
 Kka9SVk2V8DCemwIhzDYLmjD5RxVyuNqg306XZuey5g6snUaJ2g7f2B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The fwnode_for_each_child_node() loop requires manual intervention to
decrement the child refcount in case of an early return.

Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
in the error paths.

Cc: stable@vger.kernel.org
Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
This bug was found while analyzing the code and I have no real hardware
to validate the fix beyond compilation and static analysis. But given
that the child node is only used to retrieve some properties within the
fwnode_for_each_child_node(), and it is not used outside the loop, the
fix is straightforward.

Nevertheless, any tests to catch regressions with real hardware are
always welcome.

The bug has been around since the driver was added.
---
 drivers/leds/flash/leds-mt6360.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 1b75b4d36834..4c74f1cf01f0 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -643,14 +643,17 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 
 			ret = fwnode_property_read_u32(child, "reg", &reg);
 			if (ret || reg > MT6360_LED_ISNK3 ||
-			    priv->leds_active & BIT(reg))
+			    priv->leds_active & BIT(reg)) {
+				fwnode_handle_put(child);
 				return -EINVAL;
+			}
 
 			ret = fwnode_property_read_u32(child, "color", &color);
 			if (ret) {
 				dev_err(priv->dev,
 					"led %d, no color specified\n",
 					led->led_no);
+				fwnode_handle_put(child);
 				return ret;
 			}
 

---
base-commit: d35b2284e966c0bef3e2182a5c5ea02177dd32e4
change-id: 20240610-leds-mt6360-memleak-78faf3e435b0

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


