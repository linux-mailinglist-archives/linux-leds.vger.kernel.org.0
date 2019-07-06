Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598C86127F
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jul 2019 19:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfGFR7S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jul 2019 13:59:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42371 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfGFR7S (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jul 2019 13:59:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so5625056pgb.9;
        Sat, 06 Jul 2019 10:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2cGuSYY6mbXznH1xjP8nBUhy/VF4nuf7EL6OSy18Q/4=;
        b=qLvECEomhGFfCpbOlv758hJ9GpqNuJUBJkFum2+A+iQA+QKjunUINdzv7aKGAC/D/p
         gw5q1zEzKTETCJSe1DwXe9rXGxhyQl1ZerxmM0D4wMRBZh7I+V4jROrwA9yUg0gSDJma
         KMIsDT02ojOEw3anix4ZFQZ0QmI3c5qyvaZODpLhuODO1bDFhUA6eMPevM5i2PjIRxgQ
         +XbfyeLA7mZeqBcYiRkDztdsTLoX5y8ll6JTDxsPZP1ACxXzQciK5i6qNc3ZBOmJZ//D
         McuQQfGKES6yR50oEHGK8BCtjIiZz6Um7Ph1VF6QEAqloUlOIcSSdjdt+Ilm2ZY4ZpF/
         fwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2cGuSYY6mbXznH1xjP8nBUhy/VF4nuf7EL6OSy18Q/4=;
        b=TpUCvdv+N1cRJR5KVYuCNziZdMCeamxbJHTgR++aUkMm2gq/jgFu64s7bu7ZKIYx5D
         56yc3pNUY5UjICMhcNhxEMUPaGahKVF5OgSzYITGeIK7mhwK6U+wknVVMDKi60ZxE+cP
         wMPMC++LEUA0JN/xzppo+zg2McjVeEKUmP4B9DXa6Sk4L9NfPFlTK5Qcl8NMe7b7Zb5d
         t42awZ8aD4DtA2cW6rWeuOoxUSCp61imh89Rfi7KlSdIuYIBFOpjbFLQqhpT6Od9cQOo
         hBizVm6+IDrcxee41MVdZum8zMrwetGWl1yQDaea8dYF2iyB1cMT2pUjtwOwS+txJ8Nf
         IxPA==
X-Gm-Message-State: APjAAAWy4ji9yZAng6QgukrSpiZxLhT/zeO+q9ovq5CLKPpJHuJWQZEz
        QmgYltBN56f9tuQBdwEAKFQjkBVj
X-Google-Smtp-Source: APXvYqwj1B2Y8tzvvWy8bVp8gUwudON4bJIp+MSF+TSzRtLMKVVGJttTBuIMekkDXP9fRgsguKxI1Q==
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr13023090pjb.115.1562435957625;
        Sat, 06 Jul 2019 10:59:17 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id h6sm11967528pfn.79.2019.07.06.10.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 06 Jul 2019 10:59:16 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 0/2] introduce LED block device activity trigger
Date:   Sun,  7 Jul 2019 02:58:57 +0900
Message-Id: <1562435939-15466-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This work is inspired by the recent report on linux-nvme mailing list.

disk-activity trigger not working for nvme disk:
http://lists.infradead.org/pipermail/linux-nvme/2019-July/025253.html

This LED block device activity trigger works with any block devices.

Akinobu Mita (2):
  leds: move declaration of led_stop_software_blink() to linux/leds.h
  block: introduce LED block device activity trigger

 block/Makefile        |   1 +
 block/blk-ledtrig.c   | 219 ++++++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h           |  13 +++
 block/genhd.c         |   2 +
 drivers/leds/leds.h   |   1 -
 include/linux/genhd.h |   4 +
 include/linux/leds.h  |   2 +
 7 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 block/blk-ledtrig.c

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
-- 
2.7.4

