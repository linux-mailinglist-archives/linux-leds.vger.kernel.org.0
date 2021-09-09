Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7647405ED6
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347667AbhIIVcj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:39 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:41612 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347159AbhIIVce (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:34 -0400
Received: by mail-oi1-f174.google.com with SMTP id 6so4448062oiy.8;
        Thu, 09 Sep 2021 14:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BBmBTBD/+iBwMGuU2DXqDGCFrO8u6bMOR8Z4+lnQAM=;
        b=Lk08Ecp/PBhqiZXF9tMM808395GP9Ifr6SksybB+hO78mmOeSmmViAEG51u9N/DqxG
         +rueHCLTZgTpH+tHZe2+S9mWcIYNjCviMeba4JquvjoDRoVpQEQcznzbaV6Ucr3G/Uv1
         HOAUTpPEfcW2cbKAfEOm3cVpUwqPWROGVxIQ85mi1TE+cGO26cvJorjOW9RMImIUbebX
         E4IKfCsrsyrX0a6g9Zp97VrzxZV644hOkXj82719u5togdswqDYxDdDEFtNDznVuyaTx
         Hk4QBuvg4NB8X7Gw6gzWX9/YuShJBm/9AiTPhnpLWAXDnK857TXiXFCAZqVqcpDdkUKl
         XR5w==
X-Gm-Message-State: AOAM531j4MVQsMLjGYVAuRdFA2f2nFdFovVc16FE3KtstFAF4CWfVhw+
        gSYZOs+7Ft4e8Bw7CcXxbMxehFHmMA==
X-Google-Smtp-Source: ABdhPJwrVB66gNmjeXYJ0rbSlJgsXe1/F6uH+dEESJe9YwdeAnWXNV3yvboD+miYA3zXGNTr08DRmQ==
X-Received: by 2002:aca:1109:: with SMTP id 9mr1472913oir.109.1631223084362;
        Thu, 09 Sep 2021 14:31:24 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:23 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 3/8] leds: syscon: Support 'reg' in addition to 'offset' for register address
Date:   Thu,  9 Sep 2021 16:31:13 -0500
Message-Id: <20210909213118.1087083-4-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
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

