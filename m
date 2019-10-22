Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20002E0703
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2019 17:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732198AbfJVPHO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Oct 2019 11:07:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36006 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJVPHO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2019 11:07:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so10841507pfr.3;
        Tue, 22 Oct 2019 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yaqub0K0G3uTD59DLVZoQmqolnqDtWK9ZqA8b+mHC+w=;
        b=c+ITJNWhQ2O5t/Ox7u4TnYnrZ+pZ4y3ctXzGCA2GpdhMAcO4gI0Js++HrdANN0i2eI
         fDC+hH7wjZDOg0FHlaZvD+6SQCBDPF3z9z3nJk7XboDA42J5cNVSJtcH3TCtKErpD2iO
         6VLJjWnXoKGEGj6EuqQ8hGQnmrV6SbzS0AgaE5xCGNfle7cwRL+KpQYATvlVg6p/JcJk
         k5umhMzHByI2dvWbMWbYG32+DS7AONj8Is1CcpPPaRt63Ey/YSX5SUyDF0ZDTp5yoDKE
         XL0ppXailKtSjptMQhN608Z80RLfnBwGCEk9+XgjyjQTYT9grTFzxTeDuige7YsPY/BW
         8HTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yaqub0K0G3uTD59DLVZoQmqolnqDtWK9ZqA8b+mHC+w=;
        b=DG8HgUJxKnXv22QGZp91+/3ikPSa4XH0TVO7M6a5B9jHBF0HkIjB9lfn/0fjE6sS6I
         GimOn2f6x5kCv9Hw5fsL8CTikWpYSFsjBnAQLPUuFlZ6nCaVmGvjgvUiZlQinpwHd+sY
         FfUSADW4CSUEfuG7/Rhq0ctyhi+Z4ml7ctjZEcsVwiLy83MPUpreTA8yxuZjtoxTMFq4
         wAk3gAcm1K9LQx9apSTzYj8iLV2Wy+QU9C/c8kWZ7UzPeLDT7TDa6rE+Xz0pzxzLEpUc
         tcF7bWuRo9qFgKreKdJyLK6SLdd2wrfAQfkzHd4/oDQQANkuwH++zU2bM0PoJNCwsE5q
         emXQ==
X-Gm-Message-State: APjAAAXA2DBkhW1XOBcdYaQGC8YDuDKzxV40K2eZiFuKJ2PtaAoEUhV1
        gsqgXVEjxJGCvlqmgA8BhsHSa8Dy
X-Google-Smtp-Source: APXvYqwhOCMvdYqLQntX3uWaPVw/Sf0TTPazdXG62Px/cDsZee1GEKAbUnn4SyxTwHGnGhd7yguFlg==
X-Received: by 2002:a17:90a:9406:: with SMTP id r6mr5568310pjo.0.1571756833308;
        Tue, 22 Oct 2019 08:07:13 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id k66sm19882001pjb.11.2019.10.22.08.07.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 22 Oct 2019 08:07:12 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/2] leds: add generic LED level meter driver
Date:   Wed, 23 Oct 2019 00:06:50 +0900
Message-Id: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This introduces a new LED driver that enables us to create a virtual LED
level meter device that consists of multiple LED devices by different
drivers.

Previously I developed the level meter feature for leds-gpio ("leds: gpio:
support multi-level brightness") [1].  Then I got a feedback from
Bjorn Andersson and made more generic new driver.  This driver is also
inspired by led-backlight driver patchset [2] and actually requires
devm_of_led_get() function provided by the patchset.

[1] https://lore.kernel.org/linux-leds/1570203299-4270-1-git-send-email-akinobu.mita@gmail.com/
[2] https://lore.kernel.org/linux-leds/20191009085127.22843-1-jjhiblot@ti.com/

Akinobu Mita (2):
  leds: add LED level meter driver
  leds: meter: add leds-meter binding

 .../devicetree/bindings/leds/leds-meter.yaml       |  42 +++++++
 drivers/leds/Kconfig                               |  10 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-meter.c                          | 134 +++++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml
 create mode 100644 drivers/leds/leds-meter.c

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn@kryo.se>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
-- 
2.7.4

