Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8D05C168
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 18:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbfGAQqn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 12:46:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41922 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfGAQqm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 12:46:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so14606975wrm.8;
        Mon, 01 Jul 2019 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=c3//MA/Cr82sdIDNuwbYaxW9M8hPn0hK4In2v8Q7bb0=;
        b=Hvx2+nxv1oVxpSfs8b/PRBTZX48qL3G4GFhgANMWnLxeaCGxzxqu+C6v9PrY4H4b7I
         a86txvKXqOd5ntnVbU4pDqXCgB20OnrxiZqYuakCChZGA9CCbSR4SEc+6YCGOGR3NB1K
         ZG2lY3id8ZFyd1N7H8MvotZaX6fEZuUoaDKrYY38QGDJasTUSLNQXZy3t/3d1gnYm54U
         RuYF/nom7JkiZFJe2yaXZ2iDOSmsTX6ciDJnIkFkYrd+28dVCASokKOeFqKYPW/GAeNg
         iz1qixgPv8U62juuxn7KCrLY8L+cD9LTfkikDu8PpY2bt9ahaMwM1b5ORWwld3aotOX6
         Gc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c3//MA/Cr82sdIDNuwbYaxW9M8hPn0hK4In2v8Q7bb0=;
        b=FqR8JK64ZdnSXO7yONWrQujwTC+uBqhLfWXTuQmAcxwAA36A5L1wrnLeui9HmKcN1v
         TJqva6lKMyGP3CVPjDQruJOKuP/B+I1krboS0qN2imvI31iXvny845s4esr9oIdwJVrX
         EKLwbQVaBYeRcyA4no37RekHQLpBBXT/Aplje4dX6FXjZ218OAFz1kjJ5bVU5uG26mD/
         J8reyeH9aMNTOKssFHLi8lyg2MgLkLhGY0O1BfzRbZGjBhT84mWU3+Ry8R7+fgvUHqeC
         JYf0/UC5dWQkn+FPu+KihZ4trTVCfTferJ3yN12eExvyiXb9Z8DSVMTtsYNOSpcALxrD
         LTtQ==
X-Gm-Message-State: APjAAAWCRFpoat4Mqeqhac8B4X5efB63gHbM33gWlq4z3aWqP7YK1+h/
        +nt8X6kXedsn8BO6Y/Rrt6OKVHMI
X-Google-Smtp-Source: APXvYqyTaKW4k8uDJSU48/u3lJ5Z1OJa6/CNyJfmud31oe9NsNw6Nl9uefodvM3k3+InM5+2zv0FuA==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr20123783wrw.306.1561999599803;
        Mon, 01 Jul 2019 09:46:39 -0700 (PDT)
Received: from myhost.home (ckl210.neoplus.adsl.tpnet.pl. [83.31.87.210])
        by smtp.gmail.com with ESMTPSA id y6sm10823368wrp.12.2019.07.01.09.46.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 09:46:39 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        mchehab+samsung@kernel.org, oss@c-mauderer.de, pavel@ucw.cz,
        wsa+renesas@sang-engineering.com, yuehaibing@huawei.com
Subject: [GIT PULL] LED updates for 5.3-rc1
Date:   Mon,  1 Jul 2019 18:46:33 +0200
Message-Id: <20190701164633.6133-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

I'm sending early LED pull request for 5.3-rc1 since I will not
have access to the Internet for most part of the next week.
Please pull.

This time we move lm3697 backlight support from MFD to LED subsystem
and on top of that we add support for LED cell of LM36274 to the ti-lmu MFD
driver. All these, supplemented by the need for changes in lm363x-regulator.c,
required by LM36274, entailed the need for immutable branch between
LED, MFD and REGULATOR subsystems:

Merge tag 'ti-lmu-led-drivers' into for-next
leds: lm36274: Introduce the TI LM36274 LED driver
dt-bindings: leds: Add LED bindings for the LM36274
regulator: lm363x: Add support for LM36274
mfd: ti-lmu: Add LM36274 support to the ti-lmu
dt-bindings: mfd: Add lm36274 bindings to ti-lmu
leds: lm3697: Introduce the lm3697 driver
mfd: ti-lmu: Remove support for LM3697
dt-bindings: ti-lmu: Modify dt bindings for the LM3697
leds: TI LMU: Add common code for TI LMU devices
dt-bindings: mfd: LMU: Add ti,brightness-resolution
dt-bindings: mfd: LMU: Add the ramp up/down property

And here is the summary of this LED development cycle:

1) Add a new LED common module for ti-lmu driver family

2) Modify MFD ti-lmu bindings
        - add ti,brightness-resolution
        - add the ramp up/down property

3) Add regulator support for LM36274 driver to lm363x-regulator.c

4) New LED class drivers with DT bindings:
        - leds-spi-byte
        - leds-lm36274
        - leds-lm3697 (move the support from MFD to LED subsystem)

5) Simplify getting the I2C adapter of a client:
        - leds-tca6507
        - leds-pca955x

6) Convert LED documentation to ReST


There is also the following in the diffstat:

        - leds: avoid flush_work in atomic context,

but it was sent as a fix for 5.2-rc3, and I just didn't want to rebase
onto that because of the immutable branch that is based on 5.2-rc1.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.3-rc1

for you to fetch changes up to 2605085fba22792f3d4a6b856c7c5a05492d1fde:

  dt: leds-lm36274.txt: fix a broken reference to ti-lmu.txt (2019-06-28 20:57:36 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 5.3-rc1
----------------------------------------------------------------
Christian Mauderer (2):
      dt-bindings: leds: Add binding for spi-byte LED.
      leds: spi-byte: add single byte SPI LED driver

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

Jacek Anaszewski (1):
      Merge tag 'ti-lmu-led-drivers' into for-next

Mauro Carvalho Chehab (2):
      docs: leds: convert to ReST
      dt: leds-lm36274.txt: fix a broken reference to ti-lmu.txt

Pavel Machek (1):
      leds: avoid flush_work in atomic context

Wolfram Sang (2):
      leds: leds-pca955x: simplify getting the adapter of a client
      leds: leds-tca6507: simplify getting the adapter of a client

YueHaibing (1):
      leds: max77650: Remove set but not used variable 'parent'

 .../devicetree/bindings/leds/leds-lm36274.txt      |  85 +++++
 .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
 .../devicetree/bindings/leds/leds-spi-byte.txt     |  44 +++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
 Documentation/laptops/thinkpad-acpi.txt            |   4 +-
 Documentation/leds/index.rst                       |  25 ++
 .../leds/{leds-blinkm.txt => leds-blinkm.rst}      |  64 ++--
 .../{leds-class-flash.txt => leds-class-flash.rst} |  49 ++-
 .../leds/{leds-class.txt => leds-class.rst}        |  15 +-
 .../leds/{leds-lm3556.txt => leds-lm3556.rst}      | 100 ++++--
 .../leds/{leds-lp3944.txt => leds-lp3944.rst}      |  23 +-
 Documentation/leds/leds-lp5521.rst                 | 115 ++++++
 Documentation/leds/leds-lp5521.txt                 | 101 ------
 Documentation/leds/leds-lp5523.rst                 | 147 ++++++++
 Documentation/leds/leds-lp5523.txt                 | 130 -------
 Documentation/leds/leds-lp5562.rst                 | 137 +++++++
 Documentation/leds/leds-lp5562.txt                 | 120 -------
 Documentation/leds/leds-lp55xx.rst                 | 224 ++++++++++++
 Documentation/leds/leds-lp55xx.txt                 | 194 ----------
 Documentation/leds/leds-mlxcpld.rst                | 118 ++++++
 Documentation/leds/leds-mlxcpld.txt                | 110 ------
 .../{ledtrig-oneshot.txt => ledtrig-oneshot.rst}   |  11 +-
 ...ledtrig-transient.txt => ledtrig-transient.rst} |  65 ++--
 .../{ledtrig-usbport.txt => ledtrig-usbport.rst}   |  11 +-
 Documentation/leds/{uleds.txt => uleds.rst}        |   5 +-
 MAINTAINERS                                        |   2 +-
 drivers/leds/Kconfig                               |  35 ++
 drivers/leds/Makefile                              |   4 +
 drivers/leds/led-core.c                            |   5 -
 drivers/leds/leds-lm36274.c                        | 172 +++++++++
 drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
 drivers/leds/leds-max77650.c                       |   2 -
 drivers/leds/leds-pca955x.c                        |   2 +-
 drivers/leds/leds-spi-byte.c                       | 161 +++++++++
 drivers/leds/leds-tca6507.c                        |   2 +-
 drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
 drivers/leds/trigger/Kconfig                       |   2 +-
 drivers/leds/trigger/ledtrig-timer.c               |   5 +
 drivers/leds/trigger/ledtrig-transient.c           |   2 +-
 drivers/mfd/Kconfig                                |   5 +-
 drivers/mfd/ti-lmu.c                               |  23 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/lm363x-regulator.c               |  78 +++-
 include/linux/leds-ti-lmu-common.h                 |  47 +++
 include/linux/mfd/ti-lmu-register.h                |  63 ++--
 include/linux/mfd/ti-lmu.h                         |   5 +-
 net/netfilter/Kconfig                              |   2 +-
 47 files changed, 2355 insertions(+), 873 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
 create mode 100644 Documentation/leds/index.rst
 rename Documentation/leds/{leds-blinkm.txt => leds-blinkm.rst} (57%)
 rename Documentation/leds/{leds-class-flash.txt => leds-class-flash.rst} (74%)
 rename Documentation/leds/{leds-class.txt => leds-class.rst} (92%)
 rename Documentation/leds/{leds-lm3556.txt => leds-lm3556.rst} (70%)
 rename Documentation/leds/{leds-lp3944.txt => leds-lp3944.rst} (78%)
 create mode 100644 Documentation/leds/leds-lp5521.rst
 delete mode 100644 Documentation/leds/leds-lp5521.txt
 create mode 100644 Documentation/leds/leds-lp5523.rst
 delete mode 100644 Documentation/leds/leds-lp5523.txt
 create mode 100644 Documentation/leds/leds-lp5562.rst
 delete mode 100644 Documentation/leds/leds-lp5562.txt
 create mode 100644 Documentation/leds/leds-lp55xx.rst
 delete mode 100644 Documentation/leds/leds-lp55xx.txt
 create mode 100644 Documentation/leds/leds-mlxcpld.rst
 delete mode 100644 Documentation/leds/leds-mlxcpld.txt
 rename Documentation/leds/{ledtrig-oneshot.txt => ledtrig-oneshot.rst} (90%)
 rename Documentation/leds/{ledtrig-transient.txt => ledtrig-transient.rst} (81%)
 rename Documentation/leds/{ledtrig-usbport.txt => ledtrig-usbport.rst} (86%)
 rename Documentation/leds/{uleds.txt => uleds.rst} (95%)
 create mode 100644 drivers/leds/leds-lm36274.c
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/leds-spi-byte.c
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h
