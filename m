Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD0929FA41
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 02:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgJ3BHW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 21:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3BHW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 21:07:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AA7C0613D3
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x6so5170391ljd.3
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzF+iD2bQtsVAEAnO2ufhYknySXRFrdpCxNsou50eyA=;
        b=je1ZvvYry/NJgExvAEw0TUT67uPAXNEHkdvRgMqiDF3uVrrHeogsZaPoApMb68NJf9
         0OFBiT/WqDdXCYscYN6HlZwzFVRbZklDMfkA/ZSG/9gOPavBVZlG7NcuwxZReGGS650G
         0J13WH7ozOrQ62sSjGPOeNuZlF99yIcHA5IXJACPgOrQ7ijHnqeUmJ3Mh17/QAHgtMSk
         aobnEO/qWNmJfnKKmwU5jSQuMISh6J5HKJm7UTn6lpv+C3PqFx4wdvuy3k9WNYgNUngh
         l0A2LD/Shm/gH4Qyuc3yNnIK4HZ4o1BegAlGWQ06O7vqvVGSQtfegfZCicua2ss6d/Lh
         o9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzF+iD2bQtsVAEAnO2ufhYknySXRFrdpCxNsou50eyA=;
        b=RFTpyBYZv+rKb3Pxr1IlLZihC+U+IX7/3gwxK+XZCMWBfN8NAbeQY5JDog825G8gfz
         GEPYjnKk0g25hKjEm9bouTPqpLMcVnezagGlwjUgbfycgmcs4j1yNNe2T0Q1trUeHwJ6
         YQs3CL6T5V0ClV8TiqMheuFONAFKruLw6oYx42hH/85L9Xh71kKX8kgyivXTs0A6rpAw
         MBZdhOP2hTSidwVxOLCf/oaC9/FvxUOYIvt/ZFSWHINYiBiBv0BbNLbg5m/qefpShI/Z
         uXgish5Q4ggJ6/Q1jGkbnGlcbk5Ide02PqFOHZwJ7+xKLCqujA+rX06WXO8S9X16tAbF
         oTzg==
X-Gm-Message-State: AOAM533ylNrdSTgI7t5wm7M1uCc4lutRqmbU7WLUi/I80UrseQdBCNh5
        etKfzuRSAy4D+7CrbdWDAwKVZQ==
X-Google-Smtp-Source: ABdhPJzbX8Mvkqnvj67XhvIU50pcIFgdBIpv9KZgdQFiTDPX9pqlOfzMvB+26ALvTYx8NS9UQ4u8Wg==
X-Received: by 2002:a2e:b0e4:: with SMTP id h4mr2708905ljl.119.1604020040402;
        Thu, 29 Oct 2020 18:07:20 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: leds: leds-qcom-lpg: add pm8150[bl] compatible strings
Date:   Fri, 30 Oct 2020 04:07:09 +0300
Message-Id: <20201030010713.247009-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add two more compatible strings for Light Pulse Generator blocks as
found on PM8150B and PM8150A/L chips.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 5ccf0f3d8f1b..0474f1d998ff 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -17,6 +17,8 @@ description: >
 properties:
   compatible:
     enum:
+      - qcom,pm8150b-lpg
+      - qcom,pm8150l-lpg
       - qcom,pm8916-pwm
       - qcom,pm8941-lpg
       - qcom,pm8994-lpg
-- 
2.28.0

