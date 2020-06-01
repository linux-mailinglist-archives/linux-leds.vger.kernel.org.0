Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122B41EA522
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 15:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgFANk1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 09:40:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39124 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgFANk1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 09:40:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id o9so8166240ljj.6;
        Mon, 01 Jun 2020 06:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7iLZdGPc8lpNeVJhCGOILuMY+ELrVaT/FAbKIg6pFs=;
        b=e/QcQMWnDuU/ZXVpJuGjUHRNc+1upX/57IfIp50AIPSPJQB+Y6qiAhZa7Z3zM8vgYE
         mfXctR2w3zC+te/JgfndNiiCRGWjX+kdsFOi8v64h7z9lQ6oOEtQvT+8vCz55q6m4aIj
         OtW/kpm0n/vWK6roOAmhBMIj9FJrUagb6/vAw3O0Ob695sRpo5Gf4NLZZelNW2yVe07o
         Esf6vmtCszXj2Pb/F6zY5iCq0DsxKX3I1s3KsQjRnePDJERMobmt6+NUJq+yOrYb0Lji
         V2dSHZDfSW8hRLrTqExb3lBWqY22NxwxCFgyFEBQy0DA7eQMrIAjhVKGrsu7VXZpKC1Q
         vDbg==
X-Gm-Message-State: AOAM5325XygqjywKzDJZuhEfNt7mO5biDahw+Xk+UjKoLxYpL82fOf0p
        9lLESQ/8kPtL31zRRXuHJmzketo1
X-Google-Smtp-Source: ABdhPJxVwV3lCQy//DvgdhN0DfFWUmSec6HlqG8g2EH0bQrBNZlzVGIRZ+pVApBbtxC2xWD1l8V1Kw==
X-Received: by 2002:a2e:8884:: with SMTP id k4mr11281302lji.170.1591018824472;
        Mon, 01 Jun 2020 06:40:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d9sm4064191ljc.20.2020.06.01.06.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 06:40:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jfkfo-0003Fb-TA; Mon, 01 Jun 2020 15:40:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] leds: fix broken devres usage
Date:   Mon,  1 Jun 2020 15:39:44 +0200
Message-Id: <20200601133950.12420-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Several MFD child drivers register their class devices directly under
the parent device (about half of the MFD LED drivers do so).

This means you cannot blindly do devres conversions so that
deregistration ends up being tied to the parent device, something which
leads to use-after-free on driver unbind when the class device is
released while still being registered (and, for example, oopses on later
parent MFD driver unbind or LED class callbacks, or resource leaks and
name clashes on child driver reload).

Included is also a clean up removing some pointless casts when
registering class devices.

All but the lm3533 one have only been compile tested.

Johan


Johan Hovold (6):
  leds: 88pm860x: fix use-after-free on unbind
  leds: da903x: fix use-after-free on unbind
  leds: lm3533: fix use-after-free on unbind
  leds: lm36274: fix use-after-free on unbind
  leds: wm831x-status: fix use-after-free on unbind
  leds: drop redundant struct-device pointer casts

 drivers/leds/leds-88pm860x.c      | 14 +++++++++++++-
 drivers/leds/leds-da903x.c        | 14 +++++++++++++-
 drivers/leds/leds-lm3533.c        | 12 +++++++++---
 drivers/leds/leds-lm355x.c        |  9 +++------
 drivers/leds/leds-lm36274.c       | 15 ++++++++++++---
 drivers/leds/leds-lm3642.c        |  9 +++------
 drivers/leds/leds-wm831x-status.c | 14 +++++++++++++-
 7 files changed, 66 insertions(+), 21 deletions(-)

-- 
2.26.2

