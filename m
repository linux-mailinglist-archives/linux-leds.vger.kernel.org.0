Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE740102865
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 16:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfKSPqT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 10:46:19 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40311 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfKSPqT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 10:46:19 -0500
Received: by mail-qk1-f194.google.com with SMTP id z16so18206079qkg.7;
        Tue, 19 Nov 2019 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zs0qtVqeQ3xQBYktSESGlP6UO3aKjJ10cQ/av650v4s=;
        b=KF2yFhky8rbMOiX6sRjOdSvysjr6FPV/LibdqcdGEq+utA4XFoeXwl2RD2JlaxHO0G
         ZBnOl7dNjKCFcFhrFDiGhHBDAWQ6x+XWEFwoPfjhfLHdOADHYf92lNiTGOkDUCPROs3S
         Pa8K/6I/tiapKhxcMN2XSJEVze5nkGQNgv8mECTPzFgGogiIQgvCwfC2C+N1hLlEDlPh
         0jMJkxmsAcMyRuc4TGInXm/Z8jMqhz7xjS0l/Yki3OUJepConoYwo/rogTijnB1xuJWm
         WXTQ64uvTzzUixxctUz9lVqf7aNGZj+IFqiBy85/AHPceMfbBMpgx0zl4Jr1MckyIviP
         vgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zs0qtVqeQ3xQBYktSESGlP6UO3aKjJ10cQ/av650v4s=;
        b=Mf2syorBUQ9vuWu+hCeRrL9l5vVRh05G3aXRogeMMLA0bBXjcwUVBoAP6SQ5rI4wmT
         bpO8aNgZTTGMdejNgQ0sx1hISFmVDrIGB78rFULdqkkqEkYnMuiUZgGnihERI3JG2ZfL
         CnXpDcEsnXzLjctCwpU2lZNgfZTg+RIqz9HxZRBkZJtG0zcRehEsaLmI/woIvMfxTCur
         bWrLBUEBQD9cuuz0DIS19FkjMhPMSi7B14KWTLSzpgXD8m/+XRrfLDAT/foY8nQm4O7k
         o6j4z+v37I56TyLQQgH0Nlevp9ii7W8kON9fm4S3EW0+CAbfJNd8dz8Ta7YWLnVrPJ8t
         gsVw==
X-Gm-Message-State: APjAAAWJP0tOgadgJNdyoxRgW6Ky40KGOgjCGsOBGzNIu3IMyeAvbD+A
        aNxH/fLwdwjDjEIOu78fT32CYOxQ
X-Google-Smtp-Source: APXvYqwxJYMr9GDkoPi2ya3w2VSEr3Ardp8OON6AY639MSi6FIuRX4W5X1m5nBSS+cZqiE01lOiA8Q==
X-Received: by 2002:ae9:e201:: with SMTP id c1mr29824966qkc.416.1574178377910;
        Tue, 19 Nov 2019 07:46:17 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 50sm12949919qtv.88.2019.11.19.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:17 -0800 (PST)
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
Subject: [PATCH v2 0/4] tps6105x add devicetree and leds support
Date:   Tue, 19 Nov 2019 10:46:07 -0500
Message-Id: <20191119154611.29625-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v1 -> v2:
	Select chip operational mode by looking at subnode name, _not_ its
	compatible property. Suggested by Mark Brown.

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

 .../devicetree/bindings/mfd/tps6105x.txt      | 42 ++++++++-
 drivers/leds/Kconfig                          | 10 +++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-tps6105x.c                  | 87 +++++++++++++++++++
 drivers/mfd/tps6105x.c                        | 34 +++++++-
 drivers/regulator/tps6105x-regulator.c        |  2 +
 include/linux/mfd/tps6105x.h                  |  1 +
 7 files changed, 173 insertions(+), 4 deletions(-)
 create mode 100644 drivers/leds/leds-tps6105x.c

-- 
2.17.1

