Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7164963F8F5
	for <lists+linux-leds@lfdr.de>; Thu,  1 Dec 2022 21:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiLAUVx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Dec 2022 15:21:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiLAUVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2022 15:21:48 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E30BBEE32
        for <linux-leds@vger.kernel.org>; Thu,  1 Dec 2022 12:21:47 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s8so4248099lfc.8
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 12:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgxLIXSYrMYjUegPer5YIUCu5LIhi7RidA6xvUt/MGA=;
        b=ehmmh/A7AZXHICcP0+DZFN7+Hzmir47E++7/mzbTrrGUACR2KUryWHblxK30NfuLAT
         dhxxgrJlWnFD0w1CzkqHyfTqkrKlcMy9HQ/tJYKfxgcGNbsvkjoiAfWDAHbU65uv7jQK
         0HMv1riJJH/ksTQWCweo2uNZFhq/3DDILzULEoNHllzybtoyqQcbsxAlVtO2fn6Udd3a
         ASBuzOPn8aP92hPLkKq0dojUqh3rZdqh+1IXsD23v2zHVXkZ9jdC3Bbe6sUDCp3Gy0kC
         hVzkELctdbM/VXb65d2m/dh6WA57L79WtjnIt/dlwt8UaGesEKQ1TbYXo2xf6TPFQXgs
         1QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgxLIXSYrMYjUegPer5YIUCu5LIhi7RidA6xvUt/MGA=;
        b=PFD9TQiBQXqoEQaVDRlmTogblj1ZXNAcK+bzpXKhWWWZhfztAnl3soxUfEV812GnP9
         x/X389PDQCLsntLY+/ZX9TwIfpO1aMwTxlTX6dsBCaiozYzMkH1dwNN/bMSSYnRTwrgf
         m4ghWZoImd7299GGTjgP1P6884YEivTNsf7om4wM0VStkNTnqoOY4Zw7A6isoMSJ3IzO
         wh4Ygs81V5Ahc+JANtwj8tIoxmVOoyfDgfGMZyOZJRW6LgcPntNRGGph2wlIPQBPVHXF
         3PRjeUlck5JNub+Xrg4KDDmgbUYNpyulQ8iQPUUeL1qJBLsjv+sLj6oJczlR/O+4nbhx
         Xf0A==
X-Gm-Message-State: ANoB5pmE4saRWLeWiCaJQtEAFckzPhadsUroWhz64bk5+T28FdGVfju8
        XLMmOtieY3GohEFemO+/Dpoyew==
X-Google-Smtp-Source: AA0mqf7pH9d70K2TFMfZmsQoWtSOUq1EbKoX67BaVPOnNPF5+I3MFhdMABXbIEc+/6/sOu7j/Y12CA==
X-Received: by 2002:a19:4312:0:b0:4b4:b5c2:64b1 with SMTP id q18-20020a194312000000b004b4b5c264b1mr22596434lfa.524.1669926105839;
        Thu, 01 Dec 2022 12:21:45 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l30-20020a19495e000000b004b514b27c86sm769679lfj.13.2022.12.01.12.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:21:45 -0800 (PST)
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
Subject: [PATCH 0/5] dt-bindings: add missing subdevices to qcom-pm8xxx schema
Date:   Thu,  1 Dec 2022 22:21:39 +0200
Message-Id: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Update the DT bindings of the Qualcomm PMIC devices sitting on the SSBI
bus.

Dmitry Baryshkov (5):
  dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
  dt-bindings: leds: pm8058: convert from txt to YAML format
  dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
  dt-bindings: iio: adc: qcom,pm8018-adc: allow specifying MPP channels
  dt-bindings: leds: Add 'cm3605' to 'linux,default-trigger'

 .../bindings/iio/adc/qcom,pm8018-adc.yaml     |  2 +-
 .../bindings/input/qcom,pm8921-keypad.yaml    | 93 +++++++++++++++++++
 .../bindings/input/qcom,pm8xxx-keypad.txt     | 90 ------------------
 .../devicetree/bindings/leds/common.yaml      |  1 +
 .../devicetree/bindings/leds/leds-pm8058.txt  | 67 -------------
 .../devicetree/bindings/leds/leds-pm8058.yaml | 81 ++++++++++++++++
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  | 30 +++++-
 7 files changed, 205 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.yaml

-- 
2.35.1

