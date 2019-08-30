Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC90A3D73
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 20:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbfH3SLJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 14:11:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54842 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbfH3SLJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2019 14:11:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id k2so6835644wmj.4;
        Fri, 30 Aug 2019 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1LmZEYghr6cl6DFyhTopc+yzgrylXspWlIVSZCBQckY=;
        b=eM2IlOmnXybnhcKZek9AOU+vryetlwWYNgxkou3XIbsF9nyoxJqQ1x1/I1I/hGmQAU
         KsJ4UReeB3D2MD+J1RuAe1WcYyJ+MQCOP25E5LWvBRy4hfQSlZh8OPQhvgPSq12CPghb
         uVYkkqZk94lImOcNTtw2g+Z1u+HjE2H0eF7kCMaKWIpnYRKQaI7IqJyMCMqaKtfNyokY
         2Gsg9Y2kHBtIAKWauPVn4NuYKV70gD66sKvipU0mne13ttIMIcUevFDfrFsyPMdpEV45
         WKK+6cD47DLOVt7gYKmnl0TJ6tohyvQ5omu6AD9+BzkizB5MIhdV9V24TvPssNBHoiFS
         tnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1LmZEYghr6cl6DFyhTopc+yzgrylXspWlIVSZCBQckY=;
        b=si472zb7heD5MezSN+tiBU270xR8CO67PrV2fmzLRoFG+94pWiDFEySUYLZCx7tqhD
         T3bEXgrKCmMlpbdQul3H1mrcwCg7WCYesyA5McUgxHtiESDGO2of1Zywf31y8Z4JHtzl
         bZBpxioiZ/qQOewaQtVMu8ETGWIWR0yD+JIGrfDbJy56u8tD9caZsiobO/W8NIoX8ykB
         8eAQxxv0rW52PKy/BZicyHj0HmoTj+SZ0alSnNirhfAEblsrEC3kPrlU4Hd4BQpoTOi0
         0mNUPQdWaaHRG8pDeO3gahQ7FHqma70cCbczlU5K2VQsVnhMG8ZQeD4Ye8aAs/z3czVn
         YUew==
X-Gm-Message-State: APjAAAUMMF0bjNwFiNC+cdHSao6d6p+cIWBLmrciv7TPF/4GU5plXR2m
        BjujH3c7229dv+U2jY7fOuY=
X-Google-Smtp-Source: APXvYqz+Y3DUrd3WWOb9Vu4bVYJZJnLiZxcanFWpX0qYMANgAAuXqs8hvHdmcN/8qXMs2b1n85ljSQ==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr20028691wmi.91.1567188667604;
        Fri, 30 Aug 2019 11:11:07 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de. [91.64.150.195])
        by smtp.gmail.com with ESMTPSA id t8sm14591211wra.73.2019.08.30.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 11:11:07 -0700 (PDT)
From:   Krzysztof Wilczynski <kw@linux.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] leds: ti-lmu-common: Move static keyword to the front of declaration
Date:   Fri, 30 Aug 2019 20:11:04 +0200
Message-Id: <20190830181104.5813-2-kw@linux.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190830181104.5813-1-kw@linux.com>
References: <20190830090958.27108-1-kw@linux.com>
 <20190830181104.5813-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Move the static keyword to the front of declaration of ramp_table,
and resolve the following compiler warning that can be seen when
building with warnings enabled (W=1):

drivers/leds/leds-ti-lmu-common.c:14:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com

 drivers/leds/leds-ti-lmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index e294a0b097e3..d7f10ad721ba 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -11,7 +11,7 @@
 
 #include <linux/leds-ti-lmu-common.h>
 
-const static unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
+static const unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
 				2090000, 4194000, 8389000, 16780000, 33550000,
 				41940000, 50330000, 58720000, 67110000,
 				83880000, 100660000, 117440000};
-- 
2.22.1

