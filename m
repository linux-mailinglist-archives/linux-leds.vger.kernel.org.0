Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA45409D01
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345396AbhIMT3k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:40 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:33616 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242654AbhIMT3j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:39 -0400
Received: by mail-ot1-f51.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso14920184otu.0;
        Mon, 13 Sep 2021 12:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BBmBTBD/+iBwMGuU2DXqDGCFrO8u6bMOR8Z4+lnQAM=;
        b=gEhwHwRGwgiYY1oGqfPZvqT8cK3myKdwQlmjZ9czAYtZcnWdt8UhIZsLPXOK3RW9mm
         IQf7aJzwfHsscZ0ypbkFI9lPz3jFQIo6inm8+T1K3jZZGBCkeMhB4S98N9ykQYcuFmqt
         Smcnu6zIvgamZz0UtglFUbGdlkSjpNSUuYa3d0K/BfWrO1kokFMULSMRW6rJp7I/+rjn
         eWneghx/flmkuCw8W24gabeYWJJkX7a+Q12IZJDNiuCTCffIRT4ZNm1cb3oKSFQklXW7
         usMoVEtQAR+QJyHoJULuLv/j+1R46SeDtZgScrmVa4KvAf5EoY5eshUq3UgeJGQ7Lfzh
         wmKA==
X-Gm-Message-State: AOAM533hVqPH+sjMjaJ71SDlfu6frYO8HViNNAIeeGXTqFSpKGPjBq1x
        UrQGindqrw/rLu0fgRl08w==
X-Google-Smtp-Source: ABdhPJwNuV74wCE+mYLB952ZYFLvACBXFmA+SnALVyiBkwoiZk8W4pI+AwyMyZErj9nIyrrw86d6Ag==
X-Received: by 2002:a05:6830:349c:: with SMTP id c28mr11349403otu.35.1631561302950;
        Mon, 13 Sep 2021 12:28:22 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:22 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 3/8] leds: syscon: Support 'reg' in addition to 'offset' for register address
Date:   Mon, 13 Sep 2021 14:28:11 -0500
Message-Id: <20210913192816.1225025-4-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The register-bit-led binding now also supports 'reg' in addition to
'offset' for the register address. Add support to the driver to get the
address from 'reg'.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/leds/leds-syscon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 7eddb8ecb44e..44e79cdf5c39 100644
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
2.30.2

