Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C589353EB32
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jun 2022 19:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbiFFLyZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jun 2022 07:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235790AbiFFLyY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Jun 2022 07:54:24 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652A666AD0
        for <linux-leds@vger.kernel.org>; Mon,  6 Jun 2022 04:54:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 25so18205148edw.8
        for <linux-leds@vger.kernel.org>; Mon, 06 Jun 2022 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjWmoz9cQsNqwcd1YmuM2n5AszTR120N285mNHmroEM=;
        b=VunPuw6TATfi6N4bnaxxoDDho8xLTfaI9hzVih2f/sGq6toTGBhx3s+Iy1YeX6UGER
         4IdqfOn7OkHRaJGEbgflnJlAYYtGLhlI3qRKAsyOBjCG+tdVry9OXOrTZLDPNcGsslWy
         MyuZXNaMcQoshRmqS98lvRJ9j0pU+SHW4aPAaYIdOMpWv1cJq0Ir7+t6gUILi/fd2T03
         uBPlcergK94j1bBozOR83c3xSsk13A4cYJ2k7Tl0OcAXfpnVU8NXnhWgQ1GJNu4t6zji
         nxqaa0Wfn6wTvadG7nNJovR3vML+F9SmhD8/he4MAUgs+guZP8UGaRXx/n77tu1Qe06b
         8IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjWmoz9cQsNqwcd1YmuM2n5AszTR120N285mNHmroEM=;
        b=fr4mKBU7v657UBVmVsab2l2m8inBnb+rvJYMOIuwKUcz73CzWK3HqFGs/xNIfF6cG6
         H1jHB1wHy+sKDzz2UarMuR3FtSwCX1spu6AtH13ANJVVOpkq/RSKXEi8OPVe7/FKrrCB
         9n0CAzJ/7Lo0lQmFkvBpbCkqOHsrYkIYo128qh4U4Kxy7GKhEPVCfX3EsBwF0S5KdCbB
         7ILtEZ+Ohdxiz9rQ8x6gGxhfyTI2Utz8tXtpzl5aaS/QBMNb2Pdk4mDYBqwe/v6Vt5uR
         7T135FH8H0C0jCedeqYDWt0wN9/IsIynw1i18GMdNF0CnBBjPx6szOQR1ZcLryNixEAf
         iehw==
X-Gm-Message-State: AOAM5317H3xasJYRVCAmZuvK3Rk7dXOKPAzh45xP3lAhcb1bL/g4GGFY
        UxwgQwct6JEoH2dRNaIqFDl8PvVs8h8rQ9vw
X-Google-Smtp-Source: ABdhPJwiAfM36gsPY16htZrbZS62DE9GF824R5AAKC0D/QGbsuT1exmbZ8UCLLHy1KNfGu0bGAnGCQ==
X-Received: by 2002:a05:6402:4381:b0:42e:271e:b3ba with SMTP id o1-20020a056402438100b0042e271eb3bamr20938474edc.103.1654516461998;
        Mon, 06 Jun 2022 04:54:21 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i15-20020aa7c70f000000b0042bc97322desm8782639edq.43.2022.06.06.04.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 04:54:21 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-leds@vger.kernel.org
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 0/5] mfd: max597x: Add support for max597x
Date:   Mon,  6 Jun 2022 13:54:01 +0200
Message-Id: <20220606115413.3875433-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.35.3
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

max597x is multifunction device with power switch for output voltage
control, voltage/current monitor & 4 leds.

max5978 has single power switch wehereas max5970 has dual switch.

Additionally the chip also provide fault protection like over voltage,
over current & under voltage protection.


Marcello Sylvester Bauer (1):
  dt-bindings: mfd: Add bindings for MAX5970 and MAX5978

Naresh Solanki (2):
  leds: Add driver_data for led_classdev
  mfd: max597x: Add led support

Patrick Rudolph (2):
  mfd: max597x: Add support for MAX5970 and MAX5978
  mfd: max597x: Add IIO support

 .../devicetree/bindings/mfd/max5970.yaml      | 151 +++++
 MAINTAINERS                                   |   7 +
 drivers/mfd/Kconfig                           |  18 +
 drivers/mfd/Makefile                          |   3 +
 drivers/mfd/max597x.c                         | 594 ++++++++++++++++++
 drivers/mfd/max597x.h                         | 117 ++++
 drivers/mfd/max597x_iio.c                     | 141 +++++
 include/linux/leds.h                          |   2 +-
 8 files changed, 1032 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/max5970.yaml
 create mode 100644 drivers/mfd/max597x.c
 create mode 100644 drivers/mfd/max597x.h
 create mode 100644 drivers/mfd/max597x_iio.c


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.35.3

