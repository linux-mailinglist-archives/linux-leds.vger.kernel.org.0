Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0362C63F90C
	for <lists+linux-leds@lfdr.de>; Thu,  1 Dec 2022 21:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiLAUV5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Dec 2022 15:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiLAUVx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2022 15:21:53 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8057DBFCE1
        for <linux-leds@vger.kernel.org>; Thu,  1 Dec 2022 12:21:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x11so3180784ljh.7
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 12:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOGoCPWDALPa2Pn54w5yy0V+BqkFOIiPQ9fSx1bZOe4=;
        b=QkPgXYPjcWSWFOxI5ebsaCNFMaSTtxcgIpfa3mjByTZbLwPKMFxPwS52osFDkwjWu5
         VTcCFeKD/yI9O8E2t81MLCmFuqngk5XkdF44zWuO61F+xtEmWbz04VakNpX4zLCP7alK
         C3MRC4OMRzm8AlesA9e6YoMoaRf6B23TG44ntUFdyoz0MxkKYc1KG3w16BGQexiyg0/h
         7LEkWNsfz+am7lz7WxttOYlSVSj/N/0+wLvmnU9TJNX+Q1Pgh+SZt8XBmh9OBqv3MtlK
         ipP2/pp/93xxoi5J9Y5BaRtofgnfQ2tvg+fEB+SUou3A3m6+TjhC7FBvoJY6xlRAOFan
         2ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOGoCPWDALPa2Pn54w5yy0V+BqkFOIiPQ9fSx1bZOe4=;
        b=FiljYOTFX9yWU5Ocj6rcxcnUu/VyXTY6V/68R3Q6zJO15/+vFXzjQm4WPlYyUJAJtv
         6DcjubPIGttdz7lXmMgvQ66iLpK2zGMVcl3Zhg65UqMZGzRGy8htQmcNiaFefINkXX38
         s2+dNU9Kwby6LeqfEQCruwQA+5s4o/Dv1jT4RdgHSztK3mcQiVwrzn5BMKSZIo0jbLdx
         4pxNTl7kshezBIz86Yvp2wgjNzwoWkt/df/8pWP/Fa+4G6pexFdgOs1ZLC36vKuyS0nC
         UZg8miSWBj+pZZF0ugttbGJOXEynm9u+fJk7+r6DnepHlX0faPispHD0wnco+T7SbK9u
         +kcQ==
X-Gm-Message-State: ANoB5pnnZI/B6vssHEN3c903p4WS2NnO0nSvthXktreBziNXVbwh7jCt
        szcybMsoeMkZN92WvUR1GmWTDg==
X-Google-Smtp-Source: AA0mqf5TxP6WaF0o+U4NiNXlu8EtcmUEFeSlfgVwckTpt54cPkirMYrGHO0Tj662tdspAcAEphY18Q==
X-Received: by 2002:a2e:b0ef:0:b0:279:be29:cb69 with SMTP id h15-20020a2eb0ef000000b00279be29cb69mr4288321ljl.482.1669926108878;
        Thu, 01 Dec 2022 12:21:48 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l30-20020a19495e000000b004b514b27c86sm769679lfj.13.2022.12.01.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:21:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: iio: adc: qcom,pm8018-adc: allow specifying MPP channels
Date:   Thu,  1 Dec 2022 22:21:43 +0200
Message-Id: <20221201202144.448694-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
References: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Several ADC channels are bound to the Multi Purpose Pins (MPPs). Allow
specifying such channels using the mppN device node (as used on apq8060
dragonboard).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
index d186b713d6a7..fee30e6ddd62 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
@@ -64,7 +64,7 @@ required:
   - adc-channel@f
 
 patternProperties:
-  "^(adc-channel@)[0-9a-f]$":
+  "^(adc-channel|mpp[0-9]+)@[0-9a-f]$":
     type: object
     description: |
       ADC channel specific configuration.
-- 
2.35.1

