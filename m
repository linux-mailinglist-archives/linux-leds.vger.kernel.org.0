Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4DF2567918
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 23:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbiGEVBw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 17:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiGEVBv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 17:01:51 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80894BFB
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 14:01:50 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 24B0D40A9E
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1657054908;
        bh=/+iqepEXJiQtf1kCLKBlcRYR4nyv6+zJPzgNc4qYD7Q=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VmaP1NK0tkVCHB9rqv7w0ZrbbRCvTV+l544xS9i/w0WDfzSWQY3Z2EYqrNejiGhDI
         276c+QnkwYpWE5mJmtEyGOq+L2ZPVEvB2SJ/bNk2piXVJCgBlOa4qJhA4xwKpx8ek9
         qyX8y9XJIJGXRsk9EQiaZ1P+vbed8Sa8OD1q+LUFevuTH46lcK7LyZ8WsBpXuHAiEY
         XYGmL0L5EBBAdWnRQmo8n2+gBbRNPqZjOFkRQxuwRKsZ5WBH7N4fFRazxFI5NUEcCN
         waDH+9y5ZLKfrF/ZDiMIBEp+2UeJ+QYxRblLIwwlncMvsnYvC/PlDNSGRvLVF/BDtu
         lwfyxBiIPmZpA==
Received: by mail-wm1-f71.google.com with SMTP id 6-20020a1c0206000000b003a02cd754d1so5729210wmc.9
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 14:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+iqepEXJiQtf1kCLKBlcRYR4nyv6+zJPzgNc4qYD7Q=;
        b=utRqutCDVEJ2k4+9lNeMBgoBRPohGSCMjhczLB1VpGNRv1kCUK3oqzuICc0Apq7FdU
         zaULbKEE0BHYhXUFzo8o9FOj0DzCrFZZ/97ZnL3r3EkjGQOpKwTYFUShXS49pz873EiS
         t7Sy4QwQJbQGz6pfmc56BZ1smeZPkekS59f4FYQMx3Dl4si+50Nu4vm8PcET1bd7m6O+
         FMg1Cxl7ByPNUJ5ws75zRDEtc4iei33MUnL2iOTtt7F2t+p2QJA0gsvojzAYfKFYbtj/
         5YxJcsdqA7WbW0wDFy82UmvKi4OXKn4pL1w9pR2eWbc1tYxjJH1Y4XJwjgSQLIK88TOQ
         h+Ag==
X-Gm-Message-State: AJIora+1s9s5gOvcxHv08fYAL4guhpRUZFfUmkujATyrpUC71KIvktGI
        cY79CCXMGj1bWIopTiXzPr9uc3eH+IgmRhYrTTsW0K7TdzNfkZLaKX4MSncEITcr2hERbEbyDik
        Yu3Tl3SwZrK9qtXqD9PTP9CRNZyUwA7k4yKnjk+Y=
X-Received: by 2002:a5d:5f05:0:b0:21b:8ca0:6d3d with SMTP id cl5-20020a5d5f05000000b0021b8ca06d3dmr33987904wrb.382.1657054907934;
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voNkjmJLsItk4qX2FcCqMMV0I2vwoygxRWgEn1u2iRJAbKSZJmuQVNG8KjvMDWpNkZS4aZLA==
X-Received: by 2002:a5d:5f05:0:b0:21b:8ca0:6d3d with SMTP id cl5-20020a5d5f05000000b0021b8ca06d3dmr33987869wrb.382.1657054907727;
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Vincent Pelletier <plr.vincent@gmail.com>,
        Bin Meng <bin.meng@windriver.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Ron Economos <w6rz@comcast.net>,
        Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen L Arnold <nerdboy@gentoo.org>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Mark Kettenis <kettenis@openbsd.org>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        David Abdurachmanov <davidlt@rivosinc.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/4] dt-bindings: leds: pwm-multicolor: Add active-low property
Date:   Tue,  5 Jul 2022 23:01:41 +0200
Message-Id: <20220705210143.315151-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the active-low property to LEDs that are part of a multicolor LED
just like the regular PWM LEDs have.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index 6625a528f727..8d614eaf5c5e 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -33,6 +33,10 @@ properties:
 
           pwm-names: true
 
+          active-low:
+            description: For PWMs where the LED is wired to supply rather than ground.
+            type: boolean
+
           color: true
 
         required:
-- 
2.37.0

