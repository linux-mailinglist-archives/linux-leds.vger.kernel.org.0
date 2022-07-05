Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F1D567913
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 23:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiGEVBx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 17:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiGEVBv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 17:01:51 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803A92B4
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 14:01:50 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1591540A9B
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 21:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1657054907;
        bh=bQMwaeYKMT6usnwDyo75UwU6twU1bHQlELRjvpkCaBs=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lK1lQTBf8Tbaa1/LDM+pOCGZOUWU0jDHdZUI8aomWLnlYPFkws2WHrFbJzmg7vrL/
         Uo6Fdp5RdJ/9PVssQQTRd/XJZaGIy6v59KxeSPAtoMEdkb1gogVEdL9JPzQsy8Mb36
         qVXcw3CRVe2nfP9r9Gdn6ho0CwnrK0AwPcR68p2xnreM4TmxunH8Xdf27KPHIUG9yc
         HERR+Uts/3wm1dGXYxEzW++XElnWNUBXKYxij4Pt6S357pyPMfdqBcY5Iyv1nkT9kQ
         yZTokfs+ChLQ90BPp+sBMy7mjKq5illHZtVY7yQDzRaBMYpkv2d6sqtJ9b10MOBh9n
         iNYfdbx0agCkA==
Received: by mail-wm1-f72.google.com with SMTP id r206-20020a1c44d7000000b003a2bfaf8d3dso145406wma.0
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQMwaeYKMT6usnwDyo75UwU6twU1bHQlELRjvpkCaBs=;
        b=sQJGjV1TUfDi4VqgBsY91sqa6Z2f1ZtvVjKCXk97ClOG3MvYMfNvCxtyhkgoJlUeVX
         G+4gf5noEQQQec/WXih/ZHjAJjaBjl9TOqP54XY4pT9vDIkaujhly0GykUvfb4rcuoY6
         ojesU0ELTjn1x/hu7mqktC38ECOWCDiMGmVOrFvIUGXGd0OOTc4Z1UhJ56TfN6BwyKsj
         IH821WnPGC1qp7dgj5um2HBxSH9hsTRfQNzsipSah9XlJaO1SR6hun+OEPBF5yscqOX4
         kfQ+kPPgfeKbvHn3ihpp2tnNNM8qvtAHtsR7/y7rZ3NIinb5kdo27rcAclEeNXDOP97M
         ydZw==
X-Gm-Message-State: AJIora+yWdycYcDezWninsPewXa3VibB4/fdjfWSF3ZgHMVaaSRoW6dg
        9hJV67PfZBKjnRH2+ZvPfpnx5Xb/TrPAcq+v7EdCwEzQTl3Rvr5bbCWcS1ojHMNxUDVJyf44raX
        8XVsqprKkj4Buuuzx/IcG3q4L4Wy7dDgaKgDOFgM=
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr39682331wmb.105.1657054906761;
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZxXj9wYCQn8xRiwSdoNr+XF9lf5AtfECiLDauDGWvaTlvbMHbvHq3GJc+TGPSmAuxJVR2KQ==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr39682293wmb.105.1657054906543;
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
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
Subject: [PATCH v1 1/4] leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
Date:   Tue,  5 Jul 2022 23:01:40 +0200
Message-Id: <20220705210143.315151-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When requesting a PWM it might return -EPROBE_DEFER if it hasn't probed
yet. This is not an error, so just propagate the -EPROBE_DEFER without
logging anything. There is already dev_err_probe for exactly this
situation.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 45e38708ecb1..eb67b89d28e9 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -72,8 +72,7 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 		pwmled = &priv->leds[priv->mc_cdev.num_colors];
 		pwmled->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
 		if (IS_ERR(pwmled->pwm)) {
-			ret = PTR_ERR(pwmled->pwm);
-			dev_err(dev, "unable to request PWM: %d\n", ret);
+			ret = dev_err_probe(dev, PTR_ERR(pwmled->pwm), "unable to request PWM\n");
 			goto release_fwnode;
 		}
 		pwm_init_state(pwmled->pwm, &pwmled->state);
-- 
2.37.0

