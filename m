Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8247E62F1
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2019 15:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfJ0OKA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Oct 2019 10:10:00 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45592 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfJ0OKA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Oct 2019 10:10:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id c7so3654251pfo.12;
        Sun, 27 Oct 2019 07:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UI3dLKgfyOyp4aT+UI7pPbeRzP/GQ0hgQ8832KcNALM=;
        b=Ehmy/hYU5WzuSjc+t1kw1dtyw4PUrpdvooaurTp6jgilTlHyeul5FS0UVzVdjFIFg2
         D+9uL5oSeHGWmlkUWmnFF19sqM4HgjlJXugueI42xUEYQOFhQvCOtl8/abT0RIQcRujJ
         8tbumrE1x7ymHMDJahI0bXwyY2OlHOE9bHdaEJ+wtB2R+zsAcOrAN7QhSVq38coMpGa8
         EazRjO2nCStyuG8vmiTqp/bAwRPj/Lp5/3hqxcE3N9DT7WY8aFwpBycw9vYB28xJkVpe
         DNKgtGTN9PKCPQh8FPgfwmkphOqJ+vDKAoeDHrjllW3rDRwH7ZIYggnLmTjfLG52YWEA
         wQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UI3dLKgfyOyp4aT+UI7pPbeRzP/GQ0hgQ8832KcNALM=;
        b=P9WVQO44wE6SzZDNwn9BFPN1AmrDF6L2xs7iMhq5Q/YCa4/qIqMHXHDyho5Q4sJy1b
         yjz5MKdu4fypkrWYHvQwGIWthivqe75r2qXhm3W7vXVzkQjkaQpNKbW6HzMbTfJHItbE
         x57uB8YP0WcimgG3ibzN5/T4sgzKsiWdnNmsaR+X5Ww0UFhiG9UtUbM25h8gtLcU/bo1
         zDVFwBTu6vl61oWsnFtCERmcy0PaUsOokbTHpAfGjmm43efbmZrIVQ5Lin+U8epJdzLN
         lKxrIFBR1KtltBV1ria6GU99Gjo3SfXWiD+Bp28fjwH1Rq9ctZCN538BSPdJEPPoIOJN
         FKnQ==
X-Gm-Message-State: APjAAAVTfLBpTvEyHusO4yuaU4kv3REel0R0TZvn4gFZ7ZbJUadOP6WS
        F8o0gM7VWJPKEqYrYxRidMl6RVe/
X-Google-Smtp-Source: APXvYqxuR898N1LLVOeC07L07I/XYcmlO7SBcWehYcxr5g6oBY5YKNpGDXOJZS/OZcXrhTPR6/v4kw==
X-Received: by 2002:a17:90a:e38c:: with SMTP id b12mr16515902pjz.136.1572185399240;
        Sun, 27 Oct 2019 07:09:59 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id v10sm6514702pfg.11.2019.10.27.07.09.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 27 Oct 2019 07:09:58 -0700 (PDT)
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
Subject: [PATCH v2 0/2] leds: introduce generic LED level meter driver
Date:   Sun, 27 Oct 2019 23:09:37 +0900
Message-Id: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
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

* v2
- Use proper subject line for dt-binding patch.
- Swap the patch order.
- Various fixes noticed by Rob and Dan.
- Update example usage for brightness-weights property
- Use unified device proerty interface as much as possible.
- Support linux,default-trigger and default-state properties.

Akinobu Mita (2):
  dt-bindings: leds: Add leds-meter binding
  leds: Add generic LED level meter driver

 .../devicetree/bindings/leds/leds-meter.yaml       |  67 +++++++++
 drivers/leds/Kconfig                               |  10 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-meter.c                          | 151 +++++++++++++++++++++
 4 files changed, 229 insertions(+)
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

