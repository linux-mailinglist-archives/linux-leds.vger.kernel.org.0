Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1CD295361
	for <lists+linux-leds@lfdr.de>; Wed, 21 Oct 2020 22:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505174AbgJUUMG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 16:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505131AbgJUULu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 16:11:50 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09279C0613D4
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:11:49 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 16so3435988oix.9
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFNQ+PC2ugn0ZH4XH+Yai9nfPHIHh9+q2qTiKV5XAG8=;
        b=aqYmhFx9BHVizqNDFb6BG2m5tnEfevj676TZ9bpuleaMRde1k9xWNV+wakhrM4lfAf
         LQisUNSFT3kNIQTYxbdpWuN/y5v1Vwz6gVndOPD7ZKXwk1/6Gb9FFk08j1NMucWxmN9p
         5/t15bTw0eOYLHeW2aXbxDqMX9I+Wr8KAh4OHY7moFOOS+9EKLUSaitpRCzvt7YkMuaU
         IznhxycJbjcyMt0jlKq6HMEVTTRVKuG8W36QlJib8zlAROiP1nyY9JY2VneoEQ5J5FbG
         v16zfFvWPUsXUFBXBJZ48F/euM2HYf7ttqP6/6kwJBEwF2jwa0j4pr5zcB/uGiVqUXhJ
         bl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFNQ+PC2ugn0ZH4XH+Yai9nfPHIHh9+q2qTiKV5XAG8=;
        b=jWEzCeNNON7pPFbaE2SqwOF3I0BUHttxqOLRqCstRtZ6C0idg9YcPo/WNw85NObCPU
         4JEKA/15qRrRVZATi4a5doSoIdnwwvr64+IukW2u+4thk/wE3kSCVhR27nsHngUfrmxQ
         h6wdDe/6WRKWMFybowqSDx4vi1UJVU+I/93lKebvI3CFwqbQKcrYHJWqAx9/zoI17rPu
         ItJ9GXQbHy3Nb8QQ3vXlCdlVtuISW4bVCfqm9w802LtBr0OoEh91ST70VHbqClEVzQVq
         9pEcsRz7XtHf9Hdj9UznqQT1NUb+CjQcrSZsJCry2CQMl7A04Z08IAy6gwD20M6w6sQq
         zqqA==
X-Gm-Message-State: AOAM531meMelsueou643FK20eqH1rsJLs1DePwj9En/Yd5s72pIInizi
        dr4DYov/NFDM4O6CeY2F0iJvuQ==
X-Google-Smtp-Source: ABdhPJy9RuxoB4C2z7/dCyMDWvpZbU2MPiLTAl2SFifNjPspHhgQndQrDVvF5JxrEHSiIetovgujlA==
X-Received: by 2002:a05:6808:3bc:: with SMTP id n28mr3224777oie.171.1603311108171;
        Wed, 21 Oct 2020 13:11:48 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t5sm838166otl.22.2020.10.21.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 13:11:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v6 0/4] Qualcomm Light Pulse Generator
Date:   Wed, 21 Oct 2020 13:12:20 -0700
Message-Id: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series introduces a generic pattern interface in the LED class and
a driver for the Qualcomm Light Pulse Generator.

It seems like it's been almost 3 years since I posted v3, which was hung
up on the lack of conclusion on the hw_pattern and multicolor support.
Now that those are concluded I hope we can make some progress on the LPG
support again.

The dts patches are included in the series as "examples", ultimately my
expectation is that the dt binding and driver patches are picked up
through the leds tree, while Andy or myself take the dts patches.

Bjorn Andersson (4):
  dt-bindings: leds: Add Qualcomm Light Pulse Generator binding
  leds: Add driver for Qualcomm LPG
  arm64: dts: qcom: pm(i)8994: Add mpp and lpg blocks
  arm64: dts: qcom: Add user LEDs on db820c

 .../bindings/leds/leds-qcom-lpg.yaml          |  170 +++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  |   49 +
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |    9 +
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |   20 +
 drivers/leds/Kconfig                          |    9 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-qcom-lpg.c                  | 1190 +++++++++++++++++
 7 files changed, 1448 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
 create mode 100644 drivers/leds/leds-qcom-lpg.c

-- 
2.28.0

