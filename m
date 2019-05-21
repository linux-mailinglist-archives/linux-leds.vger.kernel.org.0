Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8109C258DF
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfEUUav (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 16:30:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44944 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfEUUau (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 16:30:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id e13so17060781ljl.11;
        Tue, 21 May 2019 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WUawgPLf+Rw313N868wKNOBERFRKEk29xam6dcs6XGA=;
        b=ZtuX9+qh9EUc5+ieexcQA9lBop9ZPpbPq7fQH2JUz3ARKiG+MKJ9zHhmouZgHcFUcJ
         koFYoNeZE2ptHlEfSMph8riQ8HrYmtevLiZBFFG8hJeW0am5nxiQGVg0B+MzV6umYr4b
         9cj16D9gLZ8YC0hEy21TAoBYrgyeUKYquslokOvTqBya5tz4xBNNizcPH6hZBQpk4h6t
         XAyXv+xk+Eg/GkUTaPVvdsrFfP36C9ihQz79N26N5Nbl0EkPmAR/+6xuyrEfnPCqCZ5E
         /PmTFGtXLIjprV2XA8luINkTzLD6WMVZkUT7NgPzz1gkcDlWBEV+3gCezuMd1o/q8OBJ
         7+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WUawgPLf+Rw313N868wKNOBERFRKEk29xam6dcs6XGA=;
        b=mcELEasgDKiFwy3Te/Rtk2pW7WwmwYoOm3Rc+ejtsrJueJE7+VVLay4RDPIDOkfp8y
         rkU5uToGDMJtaiWlzzJ5W4MuHZdUNBPKHahCn/3HX8vqS3YOixuhEHKg2Ztrn3r7l/q0
         krInKILy5qob8B6+ACLXDv0wYjqxFxQgyEoW1J4tGvzvtlvnY/BSkN3GZxZ+jWtW8wxP
         hgTnfP1zQz38IFRiFZ4LQlGq9lhonV1D4q3CYwZ/tUjWRcuI/Hhns1kWEkmeXmfoQrCK
         V0Q2a4c4H1z/2czqNunB/pfC/SuguXjQtzX8jroL0MfNhZyFkvy+mgcP+5rkfSh3+LJh
         uasg==
X-Gm-Message-State: APjAAAXTRC6AdaIfNAkOE/HWWim3OFLbY2f6lExEsnWktKMEIlVd7i5X
        edNVQtyBVud9fLmMTlos4gDHzSw8
X-Google-Smtp-Source: APXvYqzz6BSeUu7RfnEGgWCGg1P9u4nAxBewICLvzMqN00zxdzwPjLRoXdzOTPizYVLyZFkMFN9LGw==
X-Received: by 2002:a2e:7d02:: with SMTP id y2mr15822012ljc.62.1558470648765;
        Tue, 21 May 2019 13:30:48 -0700 (PDT)
Received: from myhost.home (dkv215.neoplus.adsl.tpnet.pl. [83.24.25.215])
        by smtp.gmail.com with ESMTPSA id y25sm4911170lfy.59.2019.05.21.13.30.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 13:30:48 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, lee.jones@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, jacek.anaszewski@gmail.com
Subject: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date:   Tue, 21 May 2019 22:30:38 +0200
Message-Id: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers

for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:

  leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)

----------------------------------------------------------------
TI LMU LED support rework and introduction of two new drivers
with DT bindings:

- leds-lm3697 (entails additions to lm363x-regulator.c)
- leds-lm36274
----------------------------------------------------------------
Dan Murphy (12):
      dt-bindings: mfd: LMU: Add the ramp up/down property
      dt-bindings: mfd: LMU: Add ti,brightness-resolution
      leds: TI LMU: Add common code for TI LMU devices
      dt-bindings: ti-lmu: Modify dt bindings for the LM3697
      mfd: ti-lmu: Remove support for LM3697
      leds: lm3697: Introduce the lm3697 driver
      regulator: lm363x: Make the gpio register enable flexible
      dt-bindings: mfd: Add lm36274 bindings to ti-lmu
      mfd: ti-lmu: Add LM36274 support to the ti-lmu
      regulator: lm363x: Add support for LM36274
      dt-bindings: leds: Add LED bindings for the LM36274
      leds: lm36274: Introduce the TI LM36274 LED driver

 .../devicetree/bindings/leds/leds-lm36274.txt      |  82 +++++
 .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
 drivers/leds/Kconfig                               |  23 ++
 drivers/leds/Makefile                              |   3 +
 drivers/leds/leds-lm36274.c                        | 174 +++++++++
 drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
 drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
 drivers/mfd/Kconfig                                |   5 +-
 drivers/mfd/ti-lmu.c                               |  23 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/lm363x-regulator.c               |  56 ++-
 include/linux/leds-ti-lmu-common.h                 |  47 +++
 include/linux/mfd/ti-lmu-register.h                |  63 ++--
 include/linux/mfd/ti-lmu.h                         |   5 +-
 15 files changed, 1112 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm36274.c
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h
