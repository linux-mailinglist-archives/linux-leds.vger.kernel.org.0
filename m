Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C59C170144
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbgBZOds (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:33:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43192 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727471AbgBZOdi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:33:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id c13so2532184wrq.10
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=zlZyK3svN4WBZKEOPHCSggdPRdTBurhSqa9+zLUZBzs=;
        b=g0A0bJhBhkX0HoST7bDkms4BVbZ6uw0t+zDPrWtG5s9fvzviAZAx24pvQFm+c4Ydri
         weN0d3ghPwndlSDWzGF34jUm7esyVBfKUH1nY69vY8cy5YuPRkwVuRD+Gznxk5+hLfF0
         hwU/cBvK/mENqL3Wd2IYVybWA2u9e9NISQ9HhN9FL9OkXUEsJHeNb78shv/YpV57bXTT
         oviTbv+1R5I+CAwPY0JPPIRucAkbKNRX+FP+5FsipVal4uwAlkyRvoC4nSIROTn0uHi1
         YEtwOJ31y5VMFux/k2iqbak7/bRx/lLFKOvvaWB8UinfBfrQSOuDpD3wzWVB/eVbv9qp
         0Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zlZyK3svN4WBZKEOPHCSggdPRdTBurhSqa9+zLUZBzs=;
        b=JQnUDjEXthH0lvbX8cCVYS6KNQPZWDlVphPFKxABUkUZjTTQ/mCY9JiowMJj3mutOh
         +O1nNSlAmUmjHPxxRJEnmH6ZKfJJvSGFHv9oYFzcLNhTaX2SRhUPpIZXwjHrJ97v4vpo
         1nYpFkHBZPva+Q9KSvqpDrqMSROrRHZj7y65W5+NYOzycKS4BdjJgFea9vJAkmdsQsum
         3R6ZfWnjOEWVdVmKbpbfqK+xf0DjvOrmTp75v4E4+h091GGXHr4nWTfQ0D/Rc8i/8mn4
         RYXsczsWV/C33m70C5zv5VJ3bumcO5wKaJidVok0dUX6M4L3b4HVzy1b0DcdI6D0H6Vw
         S7yg==
X-Gm-Message-State: APjAAAWfpu7wg4gs4bpYQjMWwjJsZ1NrpUqRmR+IDBN0Yj0Lc4HpToe3
        EHIZ4wKeGMZ9rxSbEAsu2jgfCA==
X-Google-Smtp-Source: APXvYqzoa1aSdZQU0DPuoUSUZIdqy4ht2oFqWEkDi4IRjOwzpFDAmZ4HCqS1k5yoVlbtQ6fA8k4/Mw==
X-Received: by 2002:a5d:538e:: with SMTP id d14mr6118603wrv.358.1582727614391;
        Wed, 26 Feb 2020 06:33:34 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10sm3204198wml.18.2020.02.26.06.33.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 06:33:33 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH RFC v2 0/3] leds: add support for apa102c leds
Date:   Wed, 26 Feb 2020 15:33:09 +0100
Message-Id: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series adds the driver and its related documentation 
for the APA102C RGB Leds. It is based on the Multicolor Framework and
must be applied on top of the Multicolor framework patches located at
https://lore.kernel.org/patchwork/project/lkml/list/?series=427513 .

Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.

Patch 2 Documents the APA102C led driver.

Patch 3 contains the actual driver code and modifications in the Kconfig 
and the Makefile.

Updates since v1:
- Moved the apa102c line in the Makefile to the LED SPI Drivers part
- The driver is now based on the Multicolor Framework.

Nicolas Belin (3):
  dt-bindings: Document shiji vendor-prefix
  dt-bindings: leds: Shiji Lighting APA102C LED driver
  drivers: leds: add support for apa102c leds

 .../devicetree/bindings/leds/leds-apa102c.yaml     | 154 +++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/leds/Kconfig                               |   7 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-apa102c.c                        | 291 +++++++++++++++++++++
 5 files changed, 455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
 create mode 100644 drivers/leds/leds-apa102c.c

-- 
2.7.4

