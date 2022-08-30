Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41445A5E45
	for <lists+linux-leds@lfdr.de>; Tue, 30 Aug 2022 10:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiH3Ign (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Aug 2022 04:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiH3Igl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Aug 2022 04:36:41 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D22C57A1
        for <linux-leds@vger.kernel.org>; Tue, 30 Aug 2022 01:36:39 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m7so5610274lfq.8
        for <linux-leds@vger.kernel.org>; Tue, 30 Aug 2022 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=uVZ8ew7rMZ8IHFTKM9FXk4byV8RURYoGvs0OQCurCgc=;
        b=W4JYh2QK+bLseI2w4yMdQdYAKdUmo5ND7SD2Z/CQBt+4i/5Wfk3C7LduyX3wamQ6UQ
         OvPGEpfOVQUHL8J3DiERM1Gq8q+mtVjC9y4p/b7jmTKXcRX2abxyOIkC3JZ555qbW3BI
         GMMwj4OLqm/Onxbbd4xAGyPGw4wPWopYK15jAs7X1RMmzEry8DsYL4+xLMJn6bB2YkCm
         8cRODvIZUsFY1wQIrMCdLXcGdZ7/gllP/VF4l79c1mEUsIO6WE8fGW/AN81axUkQlR0c
         By23z7inCgsN6ms9DMXt3OdWGIet1dkMf/C87qU3MIhuphELvftGetXcISF7zcVZSDct
         8uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=uVZ8ew7rMZ8IHFTKM9FXk4byV8RURYoGvs0OQCurCgc=;
        b=AWgyQTRREKhkAqtl6+xOlDXrEG0DF/lQYT0Y8oKcP7ZGuwr1Yctb0O57SKzte8dymf
         1Y2s/gzMJXhscR5vo+IM2Ba4Jh+TkGglcOVzdWPjFNWmEotRELCshONhScNqOEYHauFp
         6hm0PNbJQTTd7DS3gRXYN5PQbECUHqMkyKWYsxO56Ov2hcjG0eRtip/Cu2CkuQbnLk44
         ZOB11YfgierKNjODd/J+gLe59C7/+0I2+7NbboyFDyXl3/6I2DqJeUH2NrzuUHJj72AU
         DpbsJH/zSVGYfIngVwQXdPMxUsokEMbX8R6bS5KYnduP2ViDZB40ZSJhKpw4Xdtl0iIg
         6P6A==
X-Gm-Message-State: ACgBeo1+PwTpvJivIm2yNaSJvY2/J2T5Uf0uUnO+HWuEQa+c3JV8vGvK
        pkiZimfED2h/E3WfqfQMNgE5Dg==
X-Google-Smtp-Source: AA6agR6YB/M0m3LUhKM3VQKpGKf5+Qir2sFpNqkaf+/7xq8Vlgf/3W/CFg+unjTaWVN93BRsdCrsKw==
X-Received: by 2002:a05:6512:3e0e:b0:494:75a1:aec2 with SMTP id i14-20020a0565123e0e00b0049475a1aec2mr1413587lfv.7.1661848598300;
        Tue, 30 Aug 2022 01:36:38 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512221200b00492f294f06bsm245203lfu.110.2022.08.30.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 01:36:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Olliver Schinagl <oliver@schinagl.nl>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] leds: MAINTAINERS: include dt-bindings headers
Date:   Tue, 30 Aug 2022 11:36:25 +0300
Message-Id: <20220830083625.281462-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Include the Devicetree binding headers in LED SUBSYSTEM entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fd6a1721e69..ebc140e71b49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11458,6 +11458,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
 F:	Documentation/devicetree/bindings/leds/
 F:	drivers/leds/
+F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 
 LEGACY EEPROM DRIVER
-- 
2.34.1

