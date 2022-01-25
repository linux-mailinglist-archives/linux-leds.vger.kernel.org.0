Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA3A49BD9B
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jan 2022 22:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbiAYVDC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jan 2022 16:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiAYVDA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jan 2022 16:03:00 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70458C06173B
        for <linux-leds@vger.kernel.org>; Tue, 25 Jan 2022 13:03:00 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id w11so9981057wra.4
        for <linux-leds@vger.kernel.org>; Tue, 25 Jan 2022 13:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mFN8doDOVlUR5NaTfg8DdFnYA6JWFxpYZhNIPaDoCr0=;
        b=m3DFYfOCt/x10sMhvc4yg2q3wXjibY75nx4kWGn0M0qtpaAv4Ad0xSqq+EtJvu0fJE
         1fVCunxNGP3A8qOYVT2S3k7TpJBe02y7LtQlwRcTI0e4V+mYIm7Ou4dZ9PAd3otPgFm1
         KnHRvzZb9xSL5e2aeEw9sqtqtv6gN4pg5Bn5DRPCV3RvVm3iCXNBgyzyNDU/EXQpCNFs
         SyPlUjlS4YoGjqVR5VIHN0iB0in2SfyXGiERCH00JwATZ7UAcMDfJ3bHSk3IQg5Lt9D0
         6Msqrt8viCReBujqQ6gvR/llb6XhjFPwD75gs/aKyLVpy/qAUPe5LaWh39FkSMdJi8/6
         CeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mFN8doDOVlUR5NaTfg8DdFnYA6JWFxpYZhNIPaDoCr0=;
        b=FYYj65frSMY/CFUn/EU24kYJUsIXGyhsRilV9RCxFl9uCOTnIHy+VFSUUFzSl3p8pR
         6ZA68//2EX81XvzyZ79Nka82YBe3C9NiyHbOzJQYNrlF1aMJWeCws5v/JPZ4TrchZEUe
         IzTM00Dhw4+yN0KoNTp2WT1pg/wBPtRR5kMIDRMoLorvWaVl1ei4ytfd/9bEmS1/9z+D
         v6ko0X6x1cfnF1hq1kyDLpe3XF4CgyqwC/c3mLeilXWdHDUxhqXZyvQEypOjMZMKsVD5
         KvHwYSCPwuG7cngLwxfCQ8UKXGbLWbUWJu3L+I2z3E/Jj0nLuxkQe0lFUfVDp2ROSwB8
         64Kg==
X-Gm-Message-State: AOAM530f3chLO5uBQP1hB7xN3gzZjLTEELeuu7zly/YYLaAj84yCIQbT
        2FcWC+kRa3g2KezMftEwVs7rgA==
X-Google-Smtp-Source: ABdhPJz9c365WOZDcEknLVWg4JboS7XBDorcow9moQuMxpo75+j6DZ+HHUkEIrTL4c31adg50sza/Q==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr13337228wrn.225.1643144578990;
        Tue, 25 Jan 2022 13:02:58 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id n2sm20700641wrw.63.2022.01.25.13.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 13:02:58 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     pavel@ucw.cz, jacek.anaszewski@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH resend] dt-bindings: leds: common: add disk write/read and usb-host
Date:   Tue, 25 Jan 2022 21:02:52 +0000
Message-Id: <20220125210252.52998-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The triggers enum misses 3 cases used by gemini DT.
usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
so we add also as valid trigger usb-gadget which was added along in this
commit.

disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
This is a resend of the patch since it was not applied for 6 months
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210508193654.2596119-1-clabbe@baylibre.com/

 Documentation/devicetree/bindings/leds/common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..37f8a6fd6518 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -89,6 +89,8 @@ properties:
       - heartbeat
         # LED indicates disk activity
       - disk-activity
+      - disk-read
+      - disk-write
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
       - ide-disk
@@ -97,6 +99,8 @@ properties:
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
       - pattern
+      - usb-gadget
+      - usb-host
 
   led-pattern:
     description: |
-- 
2.34.1

