Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3EC31B3AB
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 01:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhBOAqm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Feb 2021 19:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhBOAql (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 19:46:41 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233B8C061756
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:01 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b8so2777235plh.12
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eINW4Iq/dyb1fzAnKv0SUZqM7F/vaOLcC9LuH+FGbxQ=;
        b=mJCUvCb7qy3OfRPcxq7vPRpOu1jmhDgMBDEjbibCzio/V+8OyvYNw1HC/mbO5ND7o1
         2RKbJTaBrn4qrC+aanyKJh9uU+BI7z/AgjAYkSyzcdzW4JIZg5dAySF5pgpvN/NW06M1
         kIgNeCd3NN770/xgqSKtGa6qPUJJ08brA5gZs43TVvz/pnhl0cWOx9WAc+UAnuhrSm4R
         SD+clb2YqQp3TazQK6/rvuUqb9MBO8l0widcXtxzXR01scu4bAfRXErtldn2hnertHZd
         VEsDa4OXvLU9N8j4QPMN6/D41KOF5zoZ1KUx5NdU7Zril5qM21Kx0ABeKrXnd5nXBd6u
         BDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eINW4Iq/dyb1fzAnKv0SUZqM7F/vaOLcC9LuH+FGbxQ=;
        b=qOit+tVbSoBU8xdTybYRh8dso8u6rgxAUf+n7JTqJM12xu0zDeuxbyM9fHs7N17k7I
         dri14QNe0ByCH+QNahe9YiPqkcZIJCutHLZsf5sUbKGUd5FepiKFg1UCMAH5z+Zds03m
         bwTMNqPWvgAZsFF++HVTbbHNbLYAJSlHPg15Xv89mKJa6Xc8OcTMZ4cWMRqk/m0eCdNZ
         goDTS7ebTpQdykBPICs+DEJw0iLTXqgjD7pwQYuec91CJJDHyMuhtvoe+OBE6EutVCHH
         WwRRx0uFBNFIT6RRSB1C4TDxpi6/GAmPpZJqy1uiUzZLuYjEPJVxOavYG3oLHmaztVoC
         4MkA==
X-Gm-Message-State: AOAM5328xFxNktDVqwaUcYwBRSyC3J9vXHKbE3oTDxvS6z3ZV1LpLDrb
        A4NTy3wk1IvvldaCf3YYrS3Q6Q==
X-Google-Smtp-Source: ABdhPJzZZaXlLP/5EM+lWRdod3JkpBvJJFCkY2WhG/Ml49V4298kNeHkF9fDHdRJeskbRqahgcX5Gw==
X-Received: by 2002:a17:902:26a:b029:e2:f436:15d8 with SMTP id 97-20020a170902026ab02900e2f43615d8mr13112689plc.31.1613349960533;
        Sun, 14 Feb 2021 16:46:00 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id q188sm16127746pfb.8.2021.02.14.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 16:45:59 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        dmitry.torokhov@gmail.com, pobm@protonmail.com
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 00/4] HID: new driver for PS5 'DualSense' controller
Date:   Sun, 14 Feb 2021 16:45:45 -0800
Message-Id: <20210215004549.135251-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

Recently Sony released a HID driver for the new PlayStation 5 controller
'DualSense'. Pavel Machek noticed the driver got staged for "-next" and asked
me to share the LED patches to linux-leds as well.

The LED patches I'm sharing are patch 6, 9, 11, 12 from the v6 hid-playstation
series as originally posted to linux-input. The driver in its full form can be
found on "hid.git/log/?h=for-5.12/playstation".

A little bit of background on the DualSense controller. It is a generic HID
gamepad (e.g. buttons and sticks) with a number of additional features, such
as Motion Sensors, audio, LEDs and others.  All features are implemented using HID
input and output reports.

In regards to LEDs it has 3 types of LEDs. First, it has a RGB lightbar
which is used in PS4/PS5 games for various effects e.g. health indicator, police
siren, player color and other use cases. This patch series exposes it
using the multicolor class, which is great for our use case as the lightbar
state is sent using a single HID output report. Previously for our DualShock 4
controller, the driver exposed individual LEDs, which wasn't great due to race
conditions as games change LED state frequently.

The second LED type, is a row of 5 player indicator LEDs. Such LEDs are common
on gamepads to set a player number e.g. 1, 2, 4 etcetera. Each LED is exposed
as a single LED. A default player id is set based on the number of connected
controllers, which is common behavior within the input system.

Finally, the DualSense has a audio mute LED and a mute button. The mute button is
expected to mute the internal microphone of the DualSense. The mute behavior
is handled driver side and the driver then also programs the LED. From user space
perspective the LED is read-only.

Let me know if there are any questions or comments.

Thanks,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (13):
  HID: playstation: add DualSense lightbar support
  HID: playstation: add microphone mute support for DualSense.
  HID: playstation: add DualSense player LEDs support.
  HID: playstation: DualSense set LEDs to default player id.

 MAINTAINERS                   |    6 +
 drivers/hid/Kconfig           |   21 +
 drivers/hid/Makefile          |    1 +
 drivers/hid/hid-ids.h         |    1 +
 drivers/hid/hid-playstation.c | 1504 +++++++++++++++++++++++++++++++++
 5 files changed, 1533 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

