Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0501DA605
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 09:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407941AbfJQHMm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 03:12:42 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:38368 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407942AbfJQHMm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 03:12:42 -0400
Received: by mail-wr1-f51.google.com with SMTP id o15so583946wru.5
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ycUh96qu7Qeb2/OqBRaIXG5bF+f+x1C5nZ4WXE/7KGs=;
        b=ETXvlQBJ3Y5EkrhzyFRZRu+ng3aMpSuYl30Vc47qL1j2DslM1Vk1igbKojGQ/3yaug
         tUwSfQLld8axTYQjQYdhv7j3D5AnXc/O1kUfYKmtBDthY7Y3O4tREApuGP283V82ibwI
         6gVRo8cKQkB77NTN2fuZJjNkBjuSNDdkkCY0cWAoXMQV6lw3ZlwlAwBIm6e1Tv4ffYyH
         QS9tqCiiZsOWtxuAOp24wmYfxDFIHnIb0XSZAPLTdJO+ehPbE090wF8hsdAwvx2IgW8s
         hwKeqRqTG62NRRgtIokbPkim6SilSiJsr3Q8jOVgoRoHCLfuG+C+GofArRlH5tdI+ODF
         9nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ycUh96qu7Qeb2/OqBRaIXG5bF+f+x1C5nZ4WXE/7KGs=;
        b=MzxpXo+cE7B0KtWDiQbnycHbnQ1bcjYfBff/RIC5+HhblXYa7ArdlUz9N1799B3f6M
         QyPORXBwFaawmQq3u5C3IMf6+9qJpH6nQgdXcIUgLWNgb39k81+KU5dURxWVcjHlQdnK
         48To41gzIClS6H/GcxDruh1eYlnMEvBWHeDbiJE/CQVGDHUfLF5pPji4rqt6M2vXq73k
         BxoSUmS19orf1E+A5z5FwIwl5Axhgo1R6AmTTrEqjOzQzpEI0M6CEvjuvbmcIHg6dALY
         5mAT0x9b0sAU89h9R9oJKFWVDXIMWH3SCbY8VThyU3P9N+x9Dxg8ECCxyQWeLQPgaek/
         uPpA==
X-Gm-Message-State: APjAAAVs+eG3O/xdZSflIM3Bej9ag1cHXXMT5xa0r7rBjZ+9fb20JU/f
        aq4gz4fgT+A2fpwHdaJBOffNxw==
X-Google-Smtp-Source: APXvYqyuEmEGEmZzcCODblXwV4dNYq8zprqYQKx4JnNQqfOFIAWHDrLQ+JHpjgaTLWfh5BR86lOdcA==
X-Received: by 2002:a5d:5587:: with SMTP id i7mr1371578wrv.289.1571296358768;
        Thu, 17 Oct 2019 00:12:38 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n22sm1156689wmk.19.2019.10.17.00.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 00:12:38 -0700 (PDT)
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
Subject: [PATCH v3 0/6] dt-bindings: max77650: convert the device-tree bindings to yaml
Date:   Thu, 17 Oct 2019 09:12:28 +0200
Message-Id: <20191017071234.8719-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series converts all DT binding documents for MAX77650 PMIC to YAML.

v1 -> v2:
- use upper case for abbreviations in commit messages

v2 -> v3:
- pull all example fragments into the binding document for the core MFD module
- fix all dt_binding_check errors
- add references to submodules to the main binding document
- drop the type for gpio-line-names
- drop the description for the interrupts property
- completely delete the previous txt files

Bartosz Golaszewski (6):
  dt-bindings: mfd: max77650: convert the binding document to yaml
  dt-bindings: input: max77650: convert the binding document to yaml
  dt-bindings: regulator: max77650: convert the binding document to yaml
  dt-bindings: power: max77650: convert the binding document to yaml
  dt-bindings: leds: max77650: convert the binding document to yaml
  MAINTAINERS: update the list of maintained files for max77650

 .../bindings/input/max77650-onkey.txt         |  26 ---
 .../bindings/input/max77650-onkey.yaml        |  35 ++++
 .../bindings/leds/leds-max77650.txt           |  57 -------
 .../bindings/leds/leds-max77650.yaml          |  58 +++++++
 .../devicetree/bindings/mfd/max77650.txt      |  46 ------
 .../devicetree/bindings/mfd/max77650.yaml     | 151 ++++++++++++++++++
 .../power/supply/max77650-charger.txt         |  28 ----
 .../power/supply/max77650-charger.yaml        |  34 ++++
 .../bindings/regulator/max77650-regulator.txt |  41 -----
 .../regulator/max77650-regulator.yaml         |  31 ++++
 MAINTAINERS                                   |   4 +-
 11 files changed, 311 insertions(+), 200 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77650.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.yaml

-- 
2.23.0

