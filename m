Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C95463F904
	for <lists+linux-leds@lfdr.de>; Thu,  1 Dec 2022 21:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiLAUV4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Dec 2022 15:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiLAUVv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2022 15:21:51 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E75BFCDC
        for <linux-leds@vger.kernel.org>; Thu,  1 Dec 2022 12:21:50 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f21so3382030lfm.9
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 12:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfNchStOodffna+QEO7r4Jld3Hr/B9qNIR7JQlyzfxQ=;
        b=p4P2d8OSbUgdP2VVyowwrwu7Xc8F6BjRnxGjuGAXGj62QqRo3ZNrSIfY8tNlnChpdC
         D5KeOxtch/QNR2GyFS2GTBjjSTK2cEAVatDJBF5My94ZBxnOuFacUqR1T7ot+H+K2DhU
         Rhd1viaubaFS+kD/6sUaKF8oGfWh1B4V1SbWy4PKkordkiWd7h5mqypI4CPE+BTRAQCq
         fHrNrdNGZvQ2FqmuURjWzbSnRzDtEQDJ7AvVdU9oNgNP4JIcjbrWEm7b0Iv7R16SQ00v
         OncbCxY7BzAPfj/LCTsE26Ug06Bu2hF6o3bLHaS1kvt2taVgT9ymNrvR3x6EjrKnZgWE
         SvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfNchStOodffna+QEO7r4Jld3Hr/B9qNIR7JQlyzfxQ=;
        b=DFazlINyfiF0fqfHBMyCI532co5ITO3UUOlyBfbI357M31esnLCUk5jC0qgu009CrE
         WNb6AU7uQNkwrx3zXpptSDKraVllPPsJiJ3LfBh4SZq9emuGbMcXBdCuTPJS6rjbHoW0
         GQSnGmuIMtgBE7wRq+MonnOQqpNODqsP4SBSnvrTUwsy9F+4geZPq7uNnsUWPASxB4EB
         HBniByjQ342yOpIiWEsV51U7HN1hFcSuwPFKPGXyF3DShdaiqFeacmc9gLUntJhpMh0j
         L3nrFv4mLuVyoIPdBQa9W+Ixx06NepBFW1rKRY6LsjNVFLKvdiTU9rx0BCPk6ITBK2Pp
         bupQ==
X-Gm-Message-State: ANoB5plEjEAXg06T8ULqG6omxxVh8NkDvyNbwIiMCSHmj2BYC90mYWCL
        v/UYFFmK9IDhNH2yYM+zfVKoDA==
X-Google-Smtp-Source: AA0mqf6H11UBLfKd8mKqq+LR4M/k8FvPT8UU7L5t4ofItFdye/nTHmSNNJfYyTKxnR0WAhffP+KqFA==
X-Received: by 2002:ac2:4bd2:0:b0:4a2:61b0:8d28 with SMTP id o18-20020ac24bd2000000b004a261b08d28mr16310618lfq.600.1669926109903;
        Thu, 01 Dec 2022 12:21:49 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l30-20020a19495e000000b004b514b27c86sm769679lfj.13.2022.12.01.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:21:49 -0800 (PST)
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
Subject: [PATCH 5/5] dt-bindings: leds: Add 'cm3605' to 'linux,default-trigger'
Date:   Thu,  1 Dec 2022 22:21:44 +0200
Message-Id: <20221201202144.448694-6-dmitry.baryshkov@linaro.org>
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

