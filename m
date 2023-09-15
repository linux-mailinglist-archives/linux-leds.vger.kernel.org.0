Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BF7A27C5
	for <lists+linux-leds@lfdr.de>; Fri, 15 Sep 2023 22:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236771AbjIOUL0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Sep 2023 16:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237336AbjIOULL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Sep 2023 16:11:11 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883EB2716
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:11:02 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fbd5cd0ceso2214546b3a.1
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808662; x=1695413462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYyTWZUt+7ZftFyaVwIF3q4JJIqEmWXzwxBTEgPiLsM=;
        b=Gm/7DNWcj2/iW6rrFbUVD8gHSQ/6HehzILas/KNxRpgl/aL6Iu3R7CMSfcC5fDXIJc
         H9soduPIXge+ZBNXN5A5mkdIuM/ob4653YU3EQax+ki1lMOEgHmMhSOlOyExPuauxkBr
         mbgTf323gqvl8qkDPwdpzQGXB0Ct+XxevoE8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808662; x=1695413462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYyTWZUt+7ZftFyaVwIF3q4JJIqEmWXzwxBTEgPiLsM=;
        b=EC14ldbRYPWc0md4tY8TfibdixuVQ8q1Ycj7yEUH1NU/SJpmvWll5TjzRR5ktuSqpZ
         AO8Ej6ax3l1eQlQ2xxU2IYo6ilGJ3vzQWsr0mlEG0ICaJfSw3i9RwQbsNdCdOdkOJBoN
         4wJ5XRoktnF3VNxFBiMT0A9Adcbx9SQC5iIJ3wx+pxU79aQMb1G4A9qD8zPMQk8j0qpC
         Vpv3STWzLfV1T3A2UUW35O9f6Oke3Q+MevkoUz7ae6o1cNK006DNIlAPFKthXJA0iHNE
         MtxnDKWx8vt3AeCem5O2N4lhswjaP4iLif+Aat3VDhfS/Jv6SlRyXweA28qVCxf2WWkZ
         Mr2A==
X-Gm-Message-State: AOJu0YxG0o+VYHO132jdmVnKTz6PuK481/92dpe5XZGcGBjNLmc4JMzO
        EdHRolbMhAvsjWAMJ+gNXmfKGZgzHLpIeG0mq8A=
X-Google-Smtp-Source: AGHT+IEDSV8awiXKFjTQxmXG7wC3crhSU1Q4icaW4tWquFx3ETht6OwJCXXKcMHQsS6ncCtOGHBRjA==
X-Received: by 2002:a05:6a00:1490:b0:68f:bb02:fdf with SMTP id v16-20020a056a00149000b0068fbb020fdfmr2977913pfu.27.1694808662059;
        Fri, 15 Sep 2023 13:11:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j7-20020a62e907000000b0068a2d78890csm3314062pfh.68.2023.09.15.13.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:11:01 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kees Cook <keescook@chromium.org>, Lee Jones <lee@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        linux-leds@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Lu Hongfei <luhongfei@vivo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH] leds: qcom-lpg: Annotate struct lpg_led with __counted_by
Date:   Fri, 15 Sep 2023 13:11:00 -0700
Message-Id: <20230915201059.never.086-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=keescook@chromium.org;
 h=from:subject:message-id; bh=Y0/PlP/xLr7YzJo0Pem42u6ey7XJQhlxkmcmoeZ54PU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLpURuSmxHS+rma4Nt21+50VRplgQeWjMVGy4
 5Ert+RNpSKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6VAAKCRCJcvTf3G3A
 JoNOEACPpcWy+gFj1WvLs/yXGVwm+2Gvq0+xBvcHPgh27lwiuRDzyaSDcOH1HyLeRU6CRfj8JfC
 L8VastoTJD+lFPvY0bcTP7iDYufp7IIIoESFNM9gVcxhi5ePAsPDfWJyrLCRmN/ze8CNV/pLoGt
 ttmSzhIMWbdUf7h4kr9TxXFKbAZn/67+SINDuTEzNavBEzPV1UQY0+uSz3r+42I9UDJRncQ41SC
 TRi/+T5EYMMc8Q/kMD6OZDjRg4Wxy15h7MLf3TViTVD3tbcoQKXlLdZOeOp6syYfmxr+CNz2GQC
 CYoWHi55rW2yxWhHsowo8Qr195hK2GljTdUKfHRpDxK40cwOeKr0Xvrh45ekbZrT7PbOCRuTOfr
 4kZ7hXrvwKgSvsaKHqIkfm+CfsN9LKHzZSPByCqVj0tG6sPXaVS5lmKaO6H8n8SRcGvgTKO9HEq
 x+qfKZUE9fZyJMygR4FDtfUHF0y/ie2TNLTt26thPSkUv/4X3zJBuwXpuKGQaqTq14Mx0etTHRs
 FE2f5mCgSlugSsepQP+TieqbYz82s0VH6k4XktE9HwXnJAWE81Z74RCWTXwebm/kypoG+63Pb4M
 3Mp2+QClrMKmPRax+Vh5UQy6NSAxTWVreR5CG0iBDxV5wJunbLbl2FXVpkwOwATiTDwF3QcASUl
 JxFT9AM 5o2cLIWA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct lpg_led.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index df469aaa7e6e..7d93e02a030a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -173,7 +173,7 @@ struct lpg_led {
 	struct led_classdev_mc mcdev;
 
 	unsigned int num_channels;
-	struct lpg_channel *channels[];
+	struct lpg_channel *channels[] __counted_by(num_channels);
 };
 
 /**
-- 
2.34.1

