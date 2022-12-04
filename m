Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BC0641B13
	for <lists+linux-leds@lfdr.de>; Sun,  4 Dec 2022 07:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiLDGQA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 4 Dec 2022 01:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiLDGP7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 4 Dec 2022 01:15:59 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1401C1ADAA
        for <linux-leds@vger.kernel.org>; Sat,  3 Dec 2022 22:15:58 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id a19so10034535ljk.0
        for <linux-leds@vger.kernel.org>; Sat, 03 Dec 2022 22:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvehFUDvmlwbe0bLOZWtJlblAYTrgpn+Xb3UZ8w37ns=;
        b=oFKZwFPq2sFRHO88iwMuefuNNHQDKZ449Z7MB/ubmAj4d40k7KWf4mdsv6cS+/bc+Q
         U1axE/MjHpWgG6xs1n9MEuKKHMUUbiOw/+9RPkFTY2qKSE72a4YLzZdPjzbTsseSjkch
         0hX3q8eFuaYbH4R3naoJcds82rhJpeOJYEZNXZGfmijnHOiqujI1nxXCNv2gbYiZUNtE
         nk5yDjQ3I9altrwHGvavmJIPCYMYXl5rYypUUp1NuwJ3d0BL8UWiS6FgjdIepYFTFs9g
         nMVR4fH6hVSViTwcpa0PW44uB/b11aWOYms251k4jhRd9hEx7CSKDJ9GlKdK2WUC1El9
         AxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvehFUDvmlwbe0bLOZWtJlblAYTrgpn+Xb3UZ8w37ns=;
        b=YzeXBHy497Q1zn4kPnaTy8Ur8Ro5D7ijsnYl0pKoXbX/nghCzSPWI4nFyz5xB6MMVy
         MLd/O+d5KBYD9n08sPS7MGBAdHDb1a2bu5x0GSeH/inZ1sEUWtfdT1MexedHQO8B3YZK
         yUT8j84szuygFu6PfIo7fAZyPnOTon/OANudRDZFwBNUlWjFiVZIeS/KJfnZkj6NqJLn
         mpqO9eKmduaYfqwszGBzg3ATjS9wcmgsHt0saFj8jvZE5Rl1/6m4fP6VHTaWmQ/SA5I3
         hBZGT+sUI87QNc9h/dYOOWhOkyZUtK/zL5rSt4Ult4pdjbkLDeR61/yNtYkkHyfXmOyy
         5maw==
X-Gm-Message-State: ANoB5pliefV/nuR7giX4oImRRSm97AzW5EQz05FhMbQRIlJypeyAp9Sc
        aNSUPtDdeuLSA+Eo6HPS2dQ2TA==
X-Google-Smtp-Source: AA0mqf54caa7v+m0jl8ZO1ZC99ocLHSUkpP2NT27/UzSJUdcd2pn7cLhl2mxOKsWYSr6l0QV47pDsA==
X-Received: by 2002:a2e:a224:0:b0:277:309:f1ad with SMTP id i4-20020a2ea224000000b002770309f1admr18563059ljm.244.1670134556412;
        Sat, 03 Dec 2022 22:15:56 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512110c00b0047f7722b73csm1650725lfg.142.2022.12.03.22.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 22:15:56 -0800 (PST)
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
Subject: [PATCH v2 0/4] dt-bindings: add missing subdevices to qcom-pm8xxx schema
Date:   Sun,  4 Dec 2022 08:15:51 +0200
Message-Id: <20221204061555.1355453-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the DT bindings of the Qualcomm PMIC devices sitting on the SSBI
bus.

Changes since v1:
- Rebased on top of [1]

[1]: https://lore.kernel.org/all/20221201131505.42292-1-krzysztof.kozlowski@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
  dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
  dt-bindings: iio: adc: qcom,pm8018-adc: allow specifying MPP channels
  dt-bindings: leds: Add 'cm3605' to 'linux,default-trigger'

 .../bindings/iio/adc/qcom,pm8018-adc.yaml     |  2 +-
 .../bindings/input/qcom,pm8921-keypad.yaml    | 93 +++++++++++++++++++
 .../bindings/input/qcom,pm8xxx-keypad.txt     | 90 ------------------
 .../devicetree/bindings/leds/common.yaml      |  1 +
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  | 26 +++++-
 5 files changed, 120 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
2.35.1

