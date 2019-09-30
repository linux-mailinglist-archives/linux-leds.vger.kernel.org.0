Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31149C2137
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2019 15:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731073AbfI3NDB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Sep 2019 09:03:01 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:56267 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbfI3NDB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Sep 2019 09:03:01 -0400
Received: by mail-wm1-f42.google.com with SMTP id a6so13297642wma.5
        for <linux-leds@vger.kernel.org>; Mon, 30 Sep 2019 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vNX+Pqr7l6mVyA3yK7rKaQ3s0VflVZgQrJhL3g7/Ip4=;
        b=tIxdis1cAH+RvP4PA/a2sKVUiFk+Cb8ktSu0Khl9Hhsng9haOllbEdr+iuZx3lPSYU
         sDOw0/LmRP8ATtF8hVEim3PnfPDf7quuj2Rn4LNrfdNjQ/WNeOIEa1ZLSpdi01EojiUu
         v2U2CqItDoxwn99A0kVco8fUslg9NmMhNjof/Zm9Hj/7fzahvz+7MW24L6ymTx9cntQ4
         iG8x57C+wJnP1ViTabcJxmaDc9fur1vkKOQ2wJ/uwMiVtM4pZ7eeBQB7jQVZvcfHgs5b
         0igr1XNlgRQ6W1pmNpMM5C3eRZKZW6j9mpzEV/oMcDWMbEP8KJsJw5uVhQ2QYXy4w2Ft
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vNX+Pqr7l6mVyA3yK7rKaQ3s0VflVZgQrJhL3g7/Ip4=;
        b=dCAJSsYI8EKqipT+6fg1zlbC2yYOzScRkd9/zZq08zN3pt1eR0+AIn5BMh7tQAu3oS
         CvlLlyKPyW+AzzCJGEiCnUUtM2TXm7No4cY+6WLWeQLN70Os2+GtT7T8eq/xh0ecJM7u
         lKeqKDxWg4u+uQqOQLlV68xwJp9gjL2VIlG3NrwxLP36P06+pY+j2oXKMOappWAGklvB
         jhHkHOiUL4XHKG+IUGNV61rjkjF/EAKgWfFlwCuGs/FFZzry4Gg5b2aVj1yf9lb94wcb
         WV9dBJVEmNKXUDPHgOagAnV12pkoBA6lZBmE642JNo1lyHPxjMOzTsacEO9L1+yfznt3
         437A==
X-Gm-Message-State: APjAAAVsJRpoxLr3jrO1g6JQkdlSRVMnJt1ocg/vHqMeFJ3QwK6ULb+t
        dbhYjAzDYsQtNOv9PaW1Sv801A==
X-Google-Smtp-Source: APXvYqxK7o4G9mpvoB48Pb3o2/pQXGinDSvX0SV4RdXXaPNltTKFMwrC3kfNsl75Q4BTOzphLXez4w==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr18351314wmx.168.1569848577745;
        Mon, 30 Sep 2019 06:02:57 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id e6sm10654756wrp.91.2019.09.30.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:02:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/6] dt-bindings: max77650: convert the device-tree bindings to yaml
Date:   Mon, 30 Sep 2019 15:02:40 +0200
Message-Id: <20190930130246.4860-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series converts all DT binding documents for max77650 PMIC to yaml.

Bartosz Golaszewski (6):
  dt-bindings: mfd: max77650: convert the binding document to yaml
  dt-bindings: input: max77650: convert the binding document to yaml
  dt-bindings: regulator: max77650: convert the binding document to yaml
  dt-bindings: power: max77650: convert the binding document to yaml
  dt-bindings: leds: max77650: convert the binding document to yaml
  MAINTAINERS: update the list of maintained files for max77650

 .../bindings/input/max77650-onkey.txt         | 27 +-----
 .../bindings/input/max77650-onkey.yaml        | 43 ++++++++++
 .../bindings/leds/leds-max77650.txt           | 58 +------------
 .../bindings/leds/leds-max77650.yaml          | 82 ++++++++++++++++++
 .../devicetree/bindings/mfd/max77650.txt      | 47 +----------
 .../devicetree/bindings/mfd/max77650.yaml     | 83 +++++++++++++++++++
 .../power/supply/max77650-charger.txt         | 29 +------
 .../power/supply/max77650-charger.yaml        | 42 ++++++++++
 .../bindings/regulator/max77650-regulator.txt | 42 +---------
 .../regulator/max77650-regulator.yaml         | 51 ++++++++++++
 MAINTAINERS                                   |  4 +-
 11 files changed, 308 insertions(+), 200 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.yaml

-- 
2.23.0

