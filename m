Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58508417F5
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 00:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407036AbfFKWM2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 18:12:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54133 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405700AbfFKWM2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 18:12:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so4512949wmj.3;
        Tue, 11 Jun 2019 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bVPCEvUm37j5/nMXvu1GBJ1OW7kAlgBx9khSuStibkY=;
        b=lfR9/mTwpnZX73L52BGCnsG5fRJ+Pzd2jKMAxVB5z2xvoY8ejjn5UKnpskv3CIe5yi
         EGlXlqwoJFQ9iIytAbVdWMpYE3Shmg/oEi2bDje32jElR/8xL3vAj6l0GN90yaM+Xj3E
         pdiCgJCXPTRVUKFH17jzoG9WB7TXamMNFVLTSRcgG0wxnCjriSby1mPRWR6ASgwWFrAo
         Jnl0yXZSM5MNWiG3pXbvb3yzi+8eXxDdZEn5/REahMnVsMTEFctF+w43if1Qq5TcvoSv
         Fsa3Gz3WWvo3U14YnWvoUN/SnDmqf9l+VbhBD2q9NwMhx6vUfebS7Xpu1leX93RQN9sP
         XrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bVPCEvUm37j5/nMXvu1GBJ1OW7kAlgBx9khSuStibkY=;
        b=Yq5UK5DCaZTjK/ykKlwXCeO2RbwPWpnar7y7lbHZq0rgnJ/CNiSR1Dg+nHTvwWT4jk
         +LuHn6B2HYYPf8z/2Vm5IATqWwA8FaFVFJCfZNQQl9Uyiy1N+PLj1qHydmwGfpYKZHWI
         EN4enO1AU1gn+lEaXenvf9qsJZ+w6GqFirwZOh+CfJcgQ0CmuYnJ5SXG4rDs0c6nF+m9
         kIfhrSRn/vP7CluDhO9nORvtoKqQiG2a1N/mTMi8uYlQrw+HGOVINChTu2s3YmEXTbOB
         LDS6Lm1EQP3xzF2vxnu3WpmJMwPkBzW5CKuQi8hTmNxK6gr8XyfthzqAuyyrhk12u/en
         deRw==
X-Gm-Message-State: APjAAAU4KGDda/ni+j1V+ZwfxAuQAZ+32dbQQYVnTnCzsNiuNHnUBdb4
        S2XT6h3hpnj1QTDAYYtIufI=
X-Google-Smtp-Source: APXvYqwYlP0YynAPZ2YAJreCMUb4Ui68+N0NLGh1D1BoaKNrd9SzYf0GioDvLADzWxo+qnY5Nnu3YQ==
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr12733670wmj.149.1560291146429;
        Tue, 11 Jun 2019 15:12:26 -0700 (PDT)
Received: from myhost.home (bgt97.neoplus.adsl.tpnet.pl. [83.28.83.97])
        by smtp.gmail.com with ESMTPSA id g17sm15738610wrm.7.2019.06.11.15.12.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 15:12:25 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     broonie@kernel.org, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com
Subject: [GIT PULL v2] Immutable branch between LEDs, MFD and REGULATOR
Date:   Wed, 12 Jun 2019 00:12:17 +0200
Message-Id: <20190611221217.12335-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers

for you to fetch changes up to 11e1bbc116a75d4a93122ea0a3b2be814922d864:

  leds: lm36274: Introduce the TI LM36274 LED driver (2019-06-07 20:40:07 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
TI LMU LED support rework and introduction of two new drivers
with DT bindings:

- leds-lm3697
- leds-lm36274

----------------------------------------------------------------
Dan Murphy (11):
      dt-bindings: mfd: LMU: Add the ramp up/down property
      dt-bindings: mfd: LMU: Add ti,brightness-resolution
      leds: TI LMU: Add common code for TI LMU devices
      dt-bindings: ti-lmu: Modify dt bindings for the LM3697
      mfd: ti-lmu: Remove support for LM3697
      leds: lm3697: Introduce the lm3697 driver
      dt-bindings: mfd: Add lm36274 bindings to ti-lmu
      mfd: ti-lmu: Add LM36274 support to the ti-lmu
      regulator: lm363x: Add support for LM36274
      dt-bindings: leds: Add LED bindings for the LM36274
      leds: lm36274: Introduce the TI LM36274 LED driver

 .../devicetree/bindings/leds/leds-lm36274.txt      |  85 +++++
 .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
 drivers/leds/Kconfig                               |  25 ++
 drivers/leds/Makefile                              |   3 +
 drivers/leds/leds-lm36274.c                        | 172 +++++++++
 drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
 drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
 drivers/mfd/Kconfig                                |   5 +-
 drivers/mfd/ti-lmu.c                               |  23 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/lm363x-regulator.c               |  78 +++-
 include/linux/leds-ti-lmu-common.h                 |  47 +++
 include/linux/mfd/ti-lmu-register.h                |  63 ++--
 include/linux/mfd/ti-lmu.h                         |   5 +-
 15 files changed, 1135 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm36274.c
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h
