Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572A04541B6
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 08:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhKQHZO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 02:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhKQHZN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 02:25:13 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD352C061570;
        Tue, 16 Nov 2021 23:22:15 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id m24so1346555pls.10;
        Tue, 16 Nov 2021 23:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7jRgBWTRy1eLb6DRqg23yOdyOHyiRAeibkRflYaMCB0=;
        b=X2XhAkOQ6fIdWuQf0YFcTjb8AQJO2IJThIq97n19kyy6wUbIn7VdonBtNj6HBSFxJV
         ORh46IwC+kXXqvCnmFFzUtlimHlFDFMxZVtqUNkqbRYJH5g9D8zEn+lWSG4stWQoEKmx
         GTbevLFWcFTIKtLEYSdqcWa1td3nT/neMp7EfAOdpC258jCV7HeNN2tqpRnfMl1LmnH2
         h5mBeBULZ4/feLG+pBpX7j/kFVQ2FIVLyB7OmU5SGU4577FlpLRJRMdC4yvZgy2rFcrF
         l5SZvs4YmTJq6PjCC6oAFCUPm51KXIc5I/qucAUzpYHZzTYMoiLQPt+AHYtSWJWhaRhr
         cTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7jRgBWTRy1eLb6DRqg23yOdyOHyiRAeibkRflYaMCB0=;
        b=mnB+eMQLTZB3RTgtLWOjuUlW0Baa1qVD2ZI/ggi9muJJCJ4IZFldbecLkgcEb7u6zX
         8KwwJ5AqYpgMd95y4Rqf9lnLFpLgXlr2LN06eBcGjVCYmC8KiGdYxCumPig6rR2nO8Xt
         iG7Z2jBFLMOGVSSJEOdS49ouS0JvDsPnFsqqWEL5eRhuyjgfCdwt1jkL5Ja/+VzIUG2t
         AliTsZmahRPDDptbYxoc1/FaoncXUlYuEj1HkN9Wa3Rz6vTIvL5+Pb6VjsdQqEV5auQ8
         u/Nq7D1RcIQUFuHG94KewnnfJin1LVmx8+9K/fStvEnpsM0MFhgMkO0uuPXAcKqbAH+S
         Tc/w==
X-Gm-Message-State: AOAM532Q4RPbSe48nhMB76eIq7AvYVYYrdvXOQ0IhgsyisaJGURt2Kxc
        3EgUQ9ub+x1nUHCdL9RYO00=
X-Google-Smtp-Source: ABdhPJzvfQBytyPSPR+HGwlMO6bXHPwbmKUSuv3ywsWOEwC9hwenFulm7iIIC+WawwzXU2Y+GZTyvQ==
X-Received: by 2002:a17:903:18d:b0:142:8ab:d11f with SMTP id z13-20020a170903018d00b0014208abd11fmr52691800plg.47.1637133735254;
        Tue, 16 Nov 2021 23:22:15 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:488:df8b:ccd3:9aaa:2280:e065])
        by smtp.gmail.com with ESMTPSA id k91sm4445325pja.19.2021.11.16.23.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 23:22:14 -0800 (PST)
From:   cy_huang <u0084500@gmail.com>
To:     pavel@ucw.cz, robh+dt@kernel.org, matthias.bgg@gmail.com,
        gene.chen.richtek@gmail.com
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, wilma.wu@mediatek.com,
        benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH] dt-bindings: leds: Replace moonlight with indicator in mt6360 example
Date:   Wed, 17 Nov 2021 15:22:06 +0800
Message-Id: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Replace moonlight with indicator in mt6360 example to prevent the below
build error:

Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385:
Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
Error 1

Link: https://lore.kernel.org/lkml/CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com/
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi, Gene:

I saw you have removed LED_FUNCTION_MOONLIGHT in v14.
But you may forget to remove it from the binding example.

Please help to review this change.
---
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index 2353155..b2fe6eb 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -133,7 +133,7 @@ examples:
      };
      led@3 {
        reg = <3>;
-       function = LED_FUNCTION_MOONLIGHT;
+       function = LED_FUNCTION_INDICATOR;
        color = <LED_COLOR_ID_WHITE>;
        led-max-microamp = <150000>;
      };
-- 
2.7.4

