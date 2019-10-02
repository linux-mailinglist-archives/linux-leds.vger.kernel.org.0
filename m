Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B441BC8C76
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfJBPNS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:13:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42868 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbfJBPNR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 11:13:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so11983171pgp.9;
        Wed, 02 Oct 2019 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4Lk6X+8663rlL2uCTHfqJkJzTZluu7khYUv6X9toXdg=;
        b=fKS5ds0V7eIwZHJZclPEIpM7T12M6C4dwK2clTRewG9tCcDo7/GEP1rV4IbItDbnsz
         DTD72BqH/mBQnR13mCeekJektDnt/qAp6GtQvH9b2KIlg68LRpiPrrBmX/J5K/l7IwAb
         lFIy2tTfdG6xhKqhSIf1MxCOzqHxBX13MN2ql8sYUt7HX54k3p/tuBQTSC06AqdIfMox
         /pyy0rD3QuLC4Y7IrZ6Tn3KyW8NmqX5OdPWJchRgjCxjq2u9lzcu78qbLvtBm+QCLiA4
         n8d123o6QFyfw1lm1XokHoeBgODKCHBNbTE2ND+jTR/4OGpe0FSS+xBwtmd1U3m2jN3l
         5UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4Lk6X+8663rlL2uCTHfqJkJzTZluu7khYUv6X9toXdg=;
        b=amRYccKkSzbpyNmT8VB1KAvLHUIdQlyDDsohkfAISSdLD7JUUWptVVw6dn5Yh7pzSu
         q9rfjcqRzoUUz4Tly5CM4VvT1sLAC+6obHwc2+fABPYxHVXuUjo81IamWaAoKfRQvWi9
         0Z6I6WgwGyx5ZujMiqyzqJO9OfsOqWyjIIe8Wo0P9rrLC1udGtHl/dv8xJ0ku8mAi44d
         V8VPHdF7hfQzxbR6Xw/i0ZfwQjLrKN8wiGWUgWMKb7WI9XyEMNkLeFki2hMlOfxt20z3
         +tgBQw2KC2e1JF9VijSRP4mhMGRy0l3QjPPJry52QfrAYVYk1LqhuBMkIF0K5vFf2RI7
         OlYA==
X-Gm-Message-State: APjAAAUomNq9cW+bEnqW/tt5LtW3X06J+hdj9sr6kGaWm8PSi0jFrDA0
        vaNJtpkFFPHT+BeF5Ij49YLFDfEY
X-Google-Smtp-Source: APXvYqwOCrdZMbz0ngy90R9ypGhrS8Fj8XkN/dl4q/hVTlza5DRNGUVpiJMxPipg4NThNroT3rGkWw==
X-Received: by 2002:a63:e444:: with SMTP id i4mr4316529pgk.45.1570029196229;
        Wed, 02 Oct 2019 08:13:16 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:8161:a821:b9aa:cfb2])
        by smtp.gmail.com with ESMTPSA id k23sm21397937pgg.73.2019.10.02.08.13.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 02 Oct 2019 08:13:15 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH -next 0/2] leds: add substitutes for /sys/class/leds/<led>/trigger
Date:   Thu,  3 Oct 2019 00:12:59 +0900
Message-Id: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, this violates the "one value per file" rule of sysfs.

This series provides a new /sys/devices/virtual/led-trigger/ directory and
/sys/class/leds/<led>/current-trigger. The new api follows the "one value
per file" rule of sysfs.

This series was previously developed as a part of the series "leds: fix
/sys/class/leds/<led>/trigger and add new api" [1].  Now this version
only contains the new api part.

[1] https://lore.kernel.org/r/1567946472-10075-1-git-send-email-akinobu.mita@gmail.com

Akinobu Mita (2):
  leds: add /sys/devices/virtual/led-trigger/
  leds: add /sys/class/leds/<led>/current-trigger

 Documentation/ABI/testing/sysfs-class-led          | 13 +++
 .../ABI/testing/sysfs-devices-virtual-led-trigger  |  8 ++
 drivers/leds/led-class.c                           | 10 +++
 drivers/leds/led-triggers.c                        | 95 +++++++++++++++++++++-
 drivers/leds/leds.h                                |  5 ++
 include/linux/leds.h                               |  3 +
 6 files changed, 130 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-led-trigger

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
-- 
2.7.4

