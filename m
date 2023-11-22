Return-Path: <linux-leds+bounces-96-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EBD7F544F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 00:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63C9BB20C3A
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 23:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140CE1CA84;
	Wed, 22 Nov 2023 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D22ED67;
	Wed, 22 Nov 2023 15:10:29 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b09035b850so9353439f.3;
        Wed, 22 Nov 2023 15:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700694628; x=1701299428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nObZTQG+vS/ySodGEz6Iv/w17ZhPrcgGwx4FOFJsZzw=;
        b=XqRHBWuSXleIR7gQxiEQ2sGA9nH+WTUjyWit9qDN0AkDRP4Eaj+/zmJTNbMwCsEOL1
         RWCrsU/7KwQ5yYOT8ww4V22uO6qkd4RZoNOwdILTzcfoIC4q9LwP+MWlH1EgeBMXOYGk
         kRXk5QNUAuXYUqU8j9lYhvZoIZVWYDxcwwnSqMZU7Jhdryg5oJ9dVOQcqas7EG/h3rNj
         y8YUeuRKo1crVBXTZwDy9UTOZyrPdeVNoNDcYjgyAzokK1MrCtikT7W5pINAH5KrOIJS
         MuxXM8sEEbQciBCygO2kuA0uKrXV/w0EE0H/orRC8udZrr9FdaRCLyZ+R57KX9qA7/Cz
         xJHg==
X-Gm-Message-State: AOJu0YwM/3XoF8Uwi2tTXPd8kZ9/YpUDpbCRyUNuOI+Z7iZmkQm75rec
	GkjnRPDl+6X1c/K9Awsph/7G+KfmTw==
X-Google-Smtp-Source: AGHT+IFvKpBEdYZ9/KyZEiuYK/DH0zs9MuSIB/uw5bxPP6OJc7zL6iD5sdevE3Th0g/Jx7YFZ/XesQ==
X-Received: by 2002:a05:6602:4194:b0:7a9:571c:5694 with SMTP id bx20-20020a056602419400b007a9571c5694mr4404420iob.10.1700694628566;
        Wed, 22 Nov 2023 15:10:28 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g14-20020a056638060e00b004664a5a22d2sm115195jar.83.2023.11.22.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:10:28 -0800 (PST)
Received: (nullmailer pid 2847984 invoked by uid 1000);
	Wed, 22 Nov 2023 23:10:26 -0000
From: Rob Herring <robh@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] leds: syscon: Support 'reg' in addition to 'offset' for register address
Date: Wed, 22 Nov 2023 16:07:55 -0700
Message-ID: <20231122230754.2844665-2-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register-bit-led binding now also supports 'reg' in addition to
'offset' for the register address. Add support to the driver to get the
address from 'reg'.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
The binding change landed, but v2[1] was never applied. The last 
resend[2] may have missed kernel.org addresses.

[1] https://lore.kernel.org/all/20210913192816.1225025-3-robh@kernel.org/
[2] https://lore.kernel.org/all/20231025190619.881090-2-robh@kernel.org/

 drivers/leds/leds-syscon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 360a376fa738..d633ad519d0c 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -81,7 +81,8 @@ static int syscon_led_probe(struct platform_device *pdev)
 
 	sled->map = map;
 
-	if (of_property_read_u32(np, "offset", &sled->offset))
+	if (of_property_read_u32(np, "reg", &sled->offset) &&
+	    of_property_read_u32(np, "offset", &sled->offset))
 		return -EINVAL;
 	if (of_property_read_u32(np, "mask", &sled->mask))
 		return -EINVAL;
-- 
2.42.0


