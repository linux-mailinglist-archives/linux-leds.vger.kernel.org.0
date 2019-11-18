Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA601009CA
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 17:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKRQyM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 11:54:12 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:34129 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfKRQyM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 11:54:12 -0500
Received: by mail-qv1-f67.google.com with SMTP id n12so6831880qvt.1;
        Mon, 18 Nov 2019 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0RY29p8OCAPItaI1ueD3TYbt/flhsMbwSYmc7O8tl/M=;
        b=kAppjLoEn+T0AThKTVo5v1wHMbf7qr3o/J14MxqqWA20r4g/DotXfAo9q0l4jUBGKP
         R8eJGyrTIxtezn4RcTdv/uHIh79UfoLj8s3TnNeV2EfMhjNzUhSiQref9WNF5t5RKzak
         KX5juWQeOBJcAvFaGNKvrjHwsfuvqYt3Am5QgGv7oRMjuEiMDZl9rmaNoP7vuDJn0ke7
         Ko90C+vNlRJZlHL+o9n4pFWn/CrKnp4MY5YSzmnx+0m3A9cC49DDdvobcayKLNYRwAbP
         kO5QFvfXO24Z/mncToWpa1revFsB25CK8necDKMXizJxX9ZOHv0mB5l173sWAwzIg7/r
         s2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0RY29p8OCAPItaI1ueD3TYbt/flhsMbwSYmc7O8tl/M=;
        b=mXjcJqYfj5MhRk0oruIKb54MqPwxvXlfUC9/zo0Ik6Rj4zNYg7O0DUU43BcMnjrLlh
         isH2DfIjDs/7LvH4HGC10XEcPJSFmjSpll8INfSTzsvmPlrdm6diaya+6Yalkjz7p8gQ
         CgGVR0NWaHm/7VyfJIkYE0TM0WPHnHP31c7olSl3fK/ewxGhLgxaTqScB9dSj1BZOR78
         jI24LUYy+Z2X9U0T4nR6Gxgibcj9D+GK5xCBFNGxEJrkZeAU8RD4X58esvovM/Qy7ymn
         lj9XD9nyOnctoiHXbY9Qm7wmgDSl2mPcdPk/X2UBd2aG2qJvgjQzM8RPql2aAwhXQmPq
         yidg==
X-Gm-Message-State: APjAAAVuQKE3jjLES8l3VkXTzJLpBQmNfPhrq2gHkbSOr+NMbjuoh2P0
        UJ5TgwlfSH2o9pWxKU340PM=
X-Google-Smtp-Source: APXvYqy8eHYH29PFX5EW/5Rxpb8JjCASf9s8UFZjOHCHXroi+2D/CMOBzaAuwaxfXcjsrGkSMjPT+A==
X-Received: by 2002:a05:6214:22a:: with SMTP id j10mr25800324qvt.154.1574096049203;
        Mon, 18 Nov 2019 08:54:09 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id a3sm8634648qkf.76.2019.11.18.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:54:08 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v1 0/4] tps6105x add devicetree and leds support
Date:   Mon, 18 Nov 2019 11:53:56 -0500
Message-Id: <20191118165400.21985-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I needed led operation for this mfd chip, so I added a very simple
driver for this.

My platform (arm imx6q) is devicetree-based, so I added optional
devicetree support for this chip and its sub-drivers.

Interestingly, the main mfd driver had a dt 'compatible' binding, but
could not operate without platform data?

Sven Van Asbroeck (4):
  tps6105x: add optional devicetree support
  regulator: tps6105x: add optional devicetree support
  leds: tps6105x: add driver for mfd chip led mode
  dt-bindings: mfd: update TI tps6105x chip bindings

 .../devicetree/bindings/mfd/tps6105x.txt      | 32 ++++++++-
 drivers/leds/Kconfig                          | 10 +++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-tps6105x.c                  | 68 +++++++++++++++++++
 drivers/mfd/tps6105x.c                        | 36 +++++++++-
 drivers/regulator/tps6105x-regulator.c        | 10 ++-
 6 files changed, 152 insertions(+), 5 deletions(-)
 create mode 100644 drivers/leds/leds-tps6105x.c

-- 
2.17.1

