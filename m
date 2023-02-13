Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6186942B6
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 11:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjBMKUz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 05:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjBMKUy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 05:20:54 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF391352D
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:20:36 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id sb24so6597333ejb.8
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3vaGrXiWBeA+wgHeFEWXZ9ONYMnolULpnVSOp1DWHg=;
        b=iIAWNSnqM/3Rm9Q95iT2VJ863bmvtr48KYPmeTrx6ktIkgM0EPBnOrUv+sgApjejSq
         G9wIHiTKjTNsi5yK2t4cy/jRJ5QcUjaSPLEgm4gkas/vNgbUBTOa2e0WIYaxYpLDTj7W
         bv1xzLuXPwUntyjT1SCP22sjcjsR/OfI6iWVKdmurRR3mXsCxZLnlCIJL9IwloiTZXXc
         u4gkM1+Gi4APlM+YjDxnXijMOdlEI0mP431eIboISgRTKWcdtcQ4WNVPW4wyfexT+t49
         y3v9bauQADzUTmjmh/BBX+8JAqR8ZrQHSV6bRZYFkHfbTPXjDcInTZc1JRuZRXEMJTQf
         dmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3vaGrXiWBeA+wgHeFEWXZ9ONYMnolULpnVSOp1DWHg=;
        b=mTupeP91eCTmS2nEcfbCIkBm93DqpPiym9N/VcuCH4tAo4OYH9kjkFK/Zd41sBYbb7
         gzrg8k+sf8vTQX9D4YK2eqzdP7ssI2ZsKfhBn2mCBzGxsdqulOpZhpxbLFmS+HIdwhid
         UwmVS9F0O5Lbh6SRnBkGe9CQrVstmAr7AZZ+afgZqa2EUwe1m03uaGo2I/PgS5vDga5M
         wIVfI03U94DPVo5wjXN3GqpCFxRz9WI9gIUvkBwGW/3p2ANjmkIj966DeGxQyvYpdF/N
         tGpkUeywNvrEPsSXQZuNEho9YeaiKYvsicptaJUv9B6RXdsJ5/eujbsVJNxawYr8GeMT
         itrw==
X-Gm-Message-State: AO0yUKVs2GeMSvQ4FMda/o1yUB93A2sNoN0TGjv0v86G8iXNE12XCJPf
        /VIe0D7uigU3fPkwlYNcALU0Cg==
X-Google-Smtp-Source: AK7set/XkRwvWkoJuU5waSfci0JrdYtH2mXbuMRbCZFbYXbVTj2YFIvDFbLLwYYTlpT1wgHq8wWnxg==
X-Received: by 2002:a17:907:60cf:b0:8aa:c5d9:cabf with SMTP id hv15-20020a17090760cf00b008aac5d9cabfmr23508155ejc.3.1676283632757;
        Mon, 13 Feb 2023 02:20:32 -0800 (PST)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b00878003adeeesm6564552ejz.23.2023.02.13.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 02:20:32 -0800 (PST)
From:   Maarten Zanders <maarten.zanders@mind.be>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Maarten Zanders <maarten.zanders@mind.be>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] leds: lp55xx: configure internal charge pump
Date:   Mon, 13 Feb 2023 11:20:25 +0100
Message-Id: <20230213102027.29961-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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

