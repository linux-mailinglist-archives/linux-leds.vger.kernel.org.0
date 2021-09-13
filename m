Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB87A409D08
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345974AbhIMT3o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:44 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:34504 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242460AbhIMT3m (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:42 -0400
Received: by mail-oi1-f175.google.com with SMTP id p2so15560670oif.1;
        Mon, 13 Sep 2021 12:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S09DONJ4lcwRKCzXlF4Hu+KGIQds8gxD/iFwoouakjk=;
        b=SwRGmBL8x3XGgcxo0tnnQBmBKLlPnZte4RFxcW9bj7+/RebcQfjsLBcIpiLewm2g3Q
         ihnXdQBZiJsTS0/UJYvPz87Kdg2eOB+SEAzqI2nVCvU/uplANlKgBGO+lK2r3eWtyOyr
         q62aiumqm1MhBVYbeajKMbgsZEi2dtarR7jdxlIRKZK9Y5hiaOvnjYkqwVj8yELOs1F8
         X1MBzQY42mXLnsEbv9FXpVKky8jT83os4xmLsMKNjG2uvAxlOkTt21WYwPn9IfEYrcqe
         gautZ+lVEu7kWywg0WGI8qvJYu0RVfhqQKl1kudWc0mS8y9zrq8EMfNXmrpAAWLazp/7
         310Q==
X-Gm-Message-State: AOAM531QKMf3duZ7vSb9/m6i2+2mXZ6AtQusTkzRanqmanmiu6CyR7Bz
        jpy66XBhbo1sDD/CF5hfjw==
X-Google-Smtp-Source: ABdhPJxDqvjVXbnm3PAJ2C419RCGcLNFWtXAKZoTaaa1/P86XWuVMFHQFon2e3+PMaqQ0PbZ6PLHPA==
X-Received: by 2002:aca:4b85:: with SMTP id y127mr9060394oia.169.1631561306234;
        Mon, 13 Sep 2021 12:28:26 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:24 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset' for register address
Date:   Mon, 13 Sep 2021 14:28:13 -0500
Message-Id: <20210913192816.1225025-6-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The ICST binding now also supports 'reg' in addition to 'vco-offset' for
the VCO register address. Add support to the driver to get the VCO
address from 'reg'.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/clk/versatile/clk-icst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index fdd6aa3cb1fc..77fd0ecaf155 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -501,7 +501,8 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 		return;
 	}
 
-	if (of_property_read_u32(np, "vco-offset", &icst_desc.vco_offset)) {
+	if (of_property_read_u32(np, "reg", &icst_desc.vco_offset) &&
+	    of_property_read_u32(np, "vco-offset", &icst_desc.vco_offset)) {
 		pr_err("no VCO register offset for ICST clock\n");
 		return;
 	}
-- 
2.30.2

