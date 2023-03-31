Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB106D1F5C
	for <lists+linux-leds@lfdr.de>; Fri, 31 Mar 2023 13:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjCaLq2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Mar 2023 07:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjCaLq1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 31 Mar 2023 07:46:27 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D187D30ED
        for <linux-leds@vger.kernel.org>; Fri, 31 Mar 2023 04:46:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so9823271wmq.3
        for <linux-leds@vger.kernel.org>; Fri, 31 Mar 2023 04:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1680263182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YgtMY8rBbFDXVJjPME76ymsc8nBCpDUqB96SgLmnX0=;
        b=MB9rgx3XhD1mfFiXKUGIW3KhFITgeb+tY0pPl5VRrhpIR0dlmMfO4uJ1PcZJUDoGKv
         93eMs1YJoDKjlFCFsXB96OmSQXUO+gHr1EgepyHZM1g/tHnNzgWn/ukOtc9/wodqN8F1
         UkiyTFi80AiS4leZuxkoIc2ygYvqSAKKNbNwZEeNt7efMxflB0k+tKPdQrcixgQz8So8
         miM4bQ55wuzxfclz2eK+b9t8WdWY+ngUERXNIeuaiOJDBbfY0eJAsCcLtdNkmmv2u3bH
         Uf5sgScMIm9alve0IT59ltkV2eVorsZZ5+IYNAYLp4t5pV7y3y2/18yRzFaWApUJIJMd
         VKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680263182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YgtMY8rBbFDXVJjPME76ymsc8nBCpDUqB96SgLmnX0=;
        b=YkTz5TQ4HUNHJQPvP1g2QH7AFXu2n9skYUwADt1amzmxJ2yCHUhkLuwlgmVa8yQ61i
         5Aud7aK8F7vlRi4HF5f9UN6/BB7/rTnrpTJndcyexMtOSpTmdw76GTV+GjQ7utk0afO2
         3vbO8Yh4MT9QccDZmJsqlJDXtAlwtwsPXpsCSBRVmlHmHpbdjoASXLAIJzL6tzaaZs2k
         ghtHaVV4NG4WrHvMC4fYWGqGxeOj9vjrCCuvVLj2P1y7me5wqxiDUw/xFdxqtRsZQ6fI
         8taQd14TdMdN83MeFgQA4AUMKpNfini8E53FdFBPQovM66OZqlrMdzan7A9i+/9XRwag
         diew==
X-Gm-Message-State: AO0yUKUT5w567HC7YnE8cH5XqWo7pfO2PvngT3M3tnDIx3d6Z3Bh0R4r
        9vtlJiaacng7RfIwwK9xo82+0w==
X-Google-Smtp-Source: AK7set9s8XEbyQRDwJc1TmeL9lvwv79e3Eemq1LT2vC9tCHSPPFi7fX32F8utV9Q6wBwVJILik8rkg==
X-Received: by 2002:a05:600c:acb:b0:3ee:4f92:907b with SMTP id c11-20020a05600c0acb00b003ee4f92907bmr19975109wmr.14.1680263182009;
        Fri, 31 Mar 2023 04:46:22 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003edef091b17sm2404017wmj.37.2023.03.31.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 04:46:21 -0700 (PDT)
From:   Maarten Zanders <maarten.zanders@mind.be>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Maarten Zanders <maarten.zanders@mind.be>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] leds: lp55xx: configure internal charge pump
Date:   Fri, 31 Mar 2023 13:46:08 +0200
Message-Id: <20230331114610.48111-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

A new option in the devicetree "ti,charge-pump-mode" allows the user to
configure the charge pump in a certain mode. The previous implementation
was "auto" mode, which remains the default.

v1 of the patch implemented a bool to disable the charge pump and had some
issues in the yaml binding.

v2 implemented all options of the charge pump as a string which was too
complex to parse & check.

v3 replaces the string by constants.

v4 resend with changelog (notes) in each patch

v5 dual license in dt header, change property type to u32

v6 change license type, simplify DT parameter check

Maarten Zanders (2):
  dt-bindings: leds-lp55xx: add ti,charge-pump-mode
  leds: lp55xx: configure internal charge pump

 .../devicetree/bindings/leds/leds-lp55xx.yaml  |  8 ++++++++
 drivers/leds/leds-lp5521.c                     | 12 ++++++------
 drivers/leds/leds-lp5523.c                     | 18 +++++++++++++-----
 drivers/leds/leds-lp55xx-common.c              | 14 ++++++++++++++
 drivers/leds/leds-lp8501.c                     |  8 ++++++--
 include/dt-bindings/leds/leds-lp55xx.h         | 10 ++++++++++
 include/linux/platform_data/leds-lp55xx.h      |  3 +++
 7 files changed, 60 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-lp55xx.h

-- 
2.37.3

