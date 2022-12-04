Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C872C641B28
	for <lists+linux-leds@lfdr.de>; Sun,  4 Dec 2022 07:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiLDGQF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 4 Dec 2022 01:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiLDGQC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 4 Dec 2022 01:16:02 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DCA1ADB9
        for <linux-leds@vger.kernel.org>; Sat,  3 Dec 2022 22:16:01 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x6so9965009lji.10
        for <linux-leds@vger.kernel.org>; Sat, 03 Dec 2022 22:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfNchStOodffna+QEO7r4Jld3Hr/B9qNIR7JQlyzfxQ=;
        b=xy+rewDal477F1HElTX6RYKvnSvGR1XzXBGIIGyFrdNzv2XrtLcSAui1ufmK/WUWuj
         hzh2y6U41yFoUxO4sKfzMI8cU0F1LlcKTZpPSg95u21NIvtWQ4r9QiXwuXhZypTqInqO
         JiuJaoWSVxdhJJL6Beu9ukx2BBLgTVvukWS9O+RNqo/ZjUMiddmiRQHtteXFle7sedzC
         H3Ty4dud0vejSW1mWnUk6gNpPkWiNywZUo2rAU1XQ/7uMo+SnUgF89zypSgSI1uAIYIe
         /d8cZxi6I2GS0BdgiecYuDW1fKf6vgPVZ6FuN+p2HsIKpx3ChVeUy2shBG/ZQA8HE9fL
         3v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfNchStOodffna+QEO7r4Jld3Hr/B9qNIR7JQlyzfxQ=;
        b=rEpKJLGGReoWQrTHVYtjZ9bGRkG3SGWTJWLTLu0ieu5XEx3WH/+Ft1XBhy4FTozP+e
         +Nt8ZdTolJ+AXmkzYFSsRuN29BywYcqeoPONq+380YbQ4BlGs/qIuuLccX7rJVgRDBeG
         iWigKrTCoa9b2+dywfWgVpJAnIedgqKec5p9YkCo5NkzpwOkhCB7hsRU7DQS9+F9Nnrm
         ieRH/Fbf4wIMzc5LxEhDiAql7MCgsl93oq8inO8B1VbZUjEE9cr/N+O2XzpH6iLy2IhV
         OO6lb659BKc68X//HzZxsDgD8tH8ZnDsNwl1QspOlCUWSvvyHJQ1kOPDGTqP+OINYr3a
         +rCw==
X-Gm-Message-State: ANoB5plGdUpwWKnQhpheVfbQ8YmvoYgbuHuIyJX4f2zpuZPDkRHzIDYC
        ajNMJ1gpONHjYKXT2xN9Q5mVDg==
X-Google-Smtp-Source: AA0mqf73i1pupn8/hJ6UnDdEtGCXADyuWG1T8UDd6XR4irFQ2WqRE+Y4htTyLREwK1oZK2rgyj+ykw==
X-Received: by 2002:a2e:a5c6:0:b0:277:22c3:afbb with SMTP id n6-20020a2ea5c6000000b0027722c3afbbmr19126253ljp.204.1670134559876;
        Sat, 03 Dec 2022 22:15:59 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512110c00b0047f7722b73csm1650725lfg.142.2022.12.03.22.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 22:15:59 -0800 (PST)
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
Subject: [PATCH v2 4/4] dt-bindings: leds: Add 'cm3605' to 'linux,default-trigger'
Date:   Sun,  4 Dec 2022 08:15:55 +0200
Message-Id: <20221204061555.1355453-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204061555.1355453-1-dmitry.baryshkov@linaro.org>
References: <20221204061555.1355453-1-dmitry.baryshkov@linaro.org>
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

Add 'cm3605' to possible values for 'linux,default-trigger'. This allows
one to specify Capella CM3605 proximity sensor as the LED trigger.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/leds/common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f5c57a580078..4ffb1cdf6845 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -101,6 +101,7 @@ properties:
         # LED is triggered by SD/MMC activity
       - pattern: "^mmc[0-9]+$"
       - pattern: "^cpu[0-9]*$"
+      - const: cm3605
 
   led-pattern:
     description: |
-- 
2.35.1

