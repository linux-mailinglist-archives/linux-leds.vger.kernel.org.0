Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78018415896
	for <lists+linux-leds@lfdr.de>; Thu, 23 Sep 2021 08:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239563AbhIWG5a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Sep 2021 02:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239581AbhIWG51 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Sep 2021 02:57:27 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4003C0613C1
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:55 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 17so5369803pgp.4
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWkPJQnBYWO0UoAROs+LYuUnTEN18xbOgEvLmjHNQ2E=;
        b=K57hlYfZH/c0u4bvewER/uCp/TROMyen4d88wZUUKGe2ADNnJFfvYrSDkVN3rpGY8B
         cRzDWlULDQ++tMtq3fQXj2s2Pzr6HwRl8TFuxBl2zUxfnkE4cMyjTVk42fk35yrCKqF8
         ggX3PW3hZl4DMXRDp4REcirh431S2mFwl9aH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWkPJQnBYWO0UoAROs+LYuUnTEN18xbOgEvLmjHNQ2E=;
        b=TMInvIe6YOFo5vQ9Sw6+8MTkyDQ+0mCLyuSBCkIWYHStfe0uFm7ea1UsZt4r8wp+dw
         X4Hb6iPTMllb+C0xZWcBBjFUrsic4FtS7klHQWeDvqMTxd5sYcCOdZr7eL+sPksQUx/g
         9p1ZsC1+IYdhokyfWqNNoiGVRBQuX9nE5CsWexRxUzgbXTjAKJp/s4CThA4xTmOEuinQ
         Hrap16mL1DxRzuzPiEbIchy/D/jKyj9wx4epsTiXxcOFm4wasQ83lx9jN7w7Nu1tmMj7
         cgNEQ+dIF9qGMuWLOQEtyV/DXmybVDc24ZDhYRpMmTMSKL52zfeciquY286N+tN+ZEBn
         MmHA==
X-Gm-Message-State: AOAM530fDAB8pOoDoK2Q3BV7pyt52AtD9NCdS6TgCilK80SZMHHSwBMT
        sAPkKVZI1EL0cXDWjSrLw1PWiQ==
X-Google-Smtp-Source: ABdhPJwCK4xrkr0D8IpC8dpfTICDN6wLW8gqz8i9CzG9LE5GxevJC5MMGaQ+ByAp/EgW2BUwIKQzTA==
X-Received: by 2002:a62:144f:0:b0:447:c2d8:f381 with SMTP id 76-20020a62144f000000b00447c2d8f381mr2697344pfu.83.1632380155343;
        Wed, 22 Sep 2021 23:55:55 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:54 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH v2 06/11] ARM: dts: mstar: Set gpio compatible for ssd20xd
Date:   Thu, 23 Sep 2021 15:54:55 +0900
Message-Id: <20210923065500.2284347-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Now there is gpio support for ssd20xd set the right compatible in the gpio node.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Romain Perier <romain.perier@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
index 7a5e28b33f96..6f067da61ba3 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
@@ -6,6 +6,11 @@
 
 #include "mstar-infinity2m.dtsi"
 
+&gpio {
+	compatible = "sstar,ssd20xd-gpio";
+	status = "okay";
+};
+
 &smpctrl {
 	compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
 	status = "okay";
-- 
2.33.0

