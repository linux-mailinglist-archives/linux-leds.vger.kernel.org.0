Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3A5C15BA
	for <lists+linux-leds@lfdr.de>; Sun, 29 Sep 2019 16:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfI2OTI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Sep 2019 10:19:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39163 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfI2OTI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Sep 2019 10:19:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id e1so321238pgj.6;
        Sun, 29 Sep 2019 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6GGeajit1jjOmgXu5rYd10s/WUyfgUSy5N7u3Buyurw=;
        b=TeQv9/rdOpyui7CTIpPnGqFn8G/qYoS9xzweUt4dkbHOUtjeLZ2tDWNnrCedPQAmhy
         n3PuvVBp00Xgi1uel4exwsgC/v+FRcnfbRrdk+gRbNi3Y4uPitdjqCHecw95gZmnZcGp
         fniZb3IXgF3Wrru7P4f1qSAziXk9ZNC8oknYHHUEzGpd9Xwu73VDUZHRSif0zoLJmefk
         8t69JfsyvHp8/+DP3KNFQLuPI5QzY4COf+BCC6UEv7pMF6bumI2zp5+HMnPc+99ZGJiy
         gnemi7YBzibDsWhvZuWR46y86ffOJPsfxCORMoVb+frDXfL2OtzKhYsBvf0YHRdYRxO2
         Ancg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6GGeajit1jjOmgXu5rYd10s/WUyfgUSy5N7u3Buyurw=;
        b=j/E1MNH1Z5AjS1A/S2x/LPnvU+pYPZVCh7GZCL5oAtL1eHn5kEFnAMwWYlVtzrc0p7
         QDT6RgcEHmcP9mvuWzKk1X9zNu0TEfOS0yWS+/kfgUszAwgl/zSQ2neJ8HC9opJtxOfo
         KpxF9oRHzxllKn8Eo+6eYAG/yzPOM0waRQymrGv/+9aF/dT4j8FiqOByXWuZ+IwfFZS8
         RDJTwp/AbUBTGF2/XOloinHyuHRqAEtnUN0QhzyyVamBmkqMmVnPWijbnHzlF02SRlHE
         tfJSXGLmWnKj3EJ4xzyI6s2A/ODWyK/TgO/vh9EuGl/vdDS3WdOzJLjSDGmsk79R8hQW
         voHQ==
X-Gm-Message-State: APjAAAXBdQ1w5AsFROMoqXGxPVL8j7Uq3hPm6U/CQCRg0wDKl7K3l8D3
        9A0Z3J7RqcVmB/aVbLrLn57fwYOm
X-Google-Smtp-Source: APXvYqzdcR+0sT7rN9dPARWzvhrQyI06o+w2JF7UgJpzPOqyN9c6xw19V1WbNCB6tmoFp66mk/qO9Q==
X-Received: by 2002:a62:1b97:: with SMTP id b145mr16662369pfb.163.1569766746769;
        Sun, 29 Sep 2019 07:19:06 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:20:6ca:d990:a8a2])
        by smtp.gmail.com with ESMTPSA id fa24sm10833336pjb.13.2019.09.29.07.19.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 29 Sep 2019 07:19:06 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/1] leds: fix /sys/class/leds/<led>/trigger
Date:   Sun, 29 Sep 2019 23:18:48 +0900
Message-Id: <1569766729-8433-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, the size of this file is limited to PAGE_SIZE because of the
limitation for sysfs attribute.

Enabling LED CPU trigger on systems with thousands of CPUs easily hits
PAGE_SIZE limit, and makes it impossible to see all available LED triggers
and which trigger is currently activated.

This patch converts /sys/class/leds/<led>/trigger to bin attribute and
removes the PAGE_SIZE limitation.

The first version of this seris provided the new api that follows the
"one value per file" rule of sysfs. The second version dropped it because
there have been a number of problems and it turns out that the new api
should be submitted separately.

* v3
- Remove "query" parameters from led_trigger_snprintf() and
  led_trigger_format()
- Return -ENOMEM immediately if memory allocation fails
- Drop Acked-by: tag due to a certain amount of changes

* v2
- Update commit message
- Drop patches for new api

Akinobu Mita (1):
  leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger

 drivers/leds/led-class.c    |  8 ++--
 drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
 drivers/leds/leds.h         |  6 +++
 include/linux/leds.h        |  5 ---
 4 files changed, 78 insertions(+), 31 deletions(-)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
-- 
2.7.4

