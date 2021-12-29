Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A8248158C
	for <lists+linux-leds@lfdr.de>; Wed, 29 Dec 2021 18:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240989AbhL2REd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Dec 2021 12:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240941AbhL2REc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Dec 2021 12:04:32 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AE1C061746
        for <linux-leds@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z29so88517395edl.7
        for <linux-leds@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=N176GTGT9uTNBM/lNHY3viroE2j7RNyzIAGjMDuxaY+V0D1fgSqOgdkj7epPgiTGPt
         JWs++rwSKtKOm00NQTTSStWwOJAStrOxAXAt31ULVJ2KERgnhgR6pvu0ofJFWHOL6N/N
         gvr3SgzulkVNvRJqBhZzf/7YojmoO3mNH9a7R3l+a8wI9KrZ1dEIgJqJAwb30a8rUpdF
         EpGRJhVSJBas722q8AlK2fVsJHVnE77VwOG1RrcE/pXZm1zV2Fa8/fxGVRDDpVrVz0sn
         oDd+5LJnq3SQELHBtEqC8W6AivL8O+5qMg8275X6Lb02g/2IBnn5DoF/JKj1k7nj1cmk
         kGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=DPi/movLaWbwiE6dfc9ClvHRKwuaUNLr0vWiCKggdd1XHwiJH8StVWf9M8Y8Cf8wvF
         4Mw8oRBfNd9Ddupf5QV/JTxYeiVL5xdWLCHFVHVbsM4MJsafGRFlJgfel7b14VZkcZte
         K5pjQNf7Hbc02J8MnUTIO11M9UAnaf42x0qjS9QxT5C4AlLReduPP84yofia2B/8ZnPz
         5qlW6zBVsDZOmBYYQrKDkRMy339x6l802NJRB/1mgShCTc097A+r/TERkf9fKf3ukNTK
         F+XU6B8IRljFMzqP+s8h2bV6ApaEjpseFrYub4c9z2fahZRGEifvSBDgVcZx8IDo6r3X
         3MyQ==
X-Gm-Message-State: AOAM533VrJYVRZXsFFAUfsFviHg31mf1yDj/qnHdD7rDBd5ZpdOYuhVr
        slphflmHIWFbihO5yAI6BzRWNg==
X-Google-Smtp-Source: ABdhPJx7fmCGVyYTONde3Afz2YEg3Ytza6u1AKO88xPsobuwvKKB+blwvg5emdFPJYP//+ZNe1xong==
X-Received: by 2002:a17:906:5603:: with SMTP id f3mr21611529ejq.272.1640797470828;
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L compatible
Date:   Wed, 29 Dec 2021 18:03:55 +0100
Message-Id: <20211229170358.2457006-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the compatible for the wled block found in PM6150L.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index d839e75d9788..1c24b333c6e2 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,pmi8994-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm6150l-wled
       - qcom,pm8150l-wled
 
   reg:
-- 
2.34.1

