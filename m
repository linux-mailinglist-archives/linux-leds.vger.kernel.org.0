Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123E62715E9
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 18:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgITQ0i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 12:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITQ0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 12:26:38 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FAEC061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 09:26:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t16so10560727edw.7
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+/I/zsiWJmg4jYIXA2uK1DiGQVAFKpTTeDqDpphnC5s=;
        b=ZcKQzxgazKgd/7X9CE7VCiU24C6H1agdhF7hRTBC3NqByJN2RpYEmyUNswijXlErfM
         SDWznBfU6q6jLtjuV+HhILlgcWPnvfpyq5zaZRsh8oy2am6/b5ua4s2wbIYnFBg4Jl3x
         iK0CZoBFQx2XqIDZ51GhHXA0ip+w84Hy9a5Nkjl5fTMmEvkOA8JTYq2YvrtvZya9DCsd
         /nM++tuwla/r8CQhfvlaRAn8Pzfj5q4VC+pD+o1udRZtgAUbNKhKfQu+ToqgXHrTh6jv
         GJeBRwXUHoLR4cFm/dwb4G7B56MNo8hn7GNUNG//W1fkI8IYW8b/jfEz6fCTlZxUjNnq
         wagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+/I/zsiWJmg4jYIXA2uK1DiGQVAFKpTTeDqDpphnC5s=;
        b=aaQApefcsg4zXZp77jdV8sRJPZGb0IJw/XN/ewz1SOe0WWkp9iGrh6EQcukaATRKsz
         drk/bd4IFpSuDF66LnRxHjxjNee8i4jE/1VWvPO4m6t3nPrroL+sgfwDv0nuKXKEYVga
         fDkpNzqxkUPupBRzg+2wl0PZd+OI1U4irgTSIESqbMydUhz3PMGXrA7YLZDKeL31pTjz
         FDMVeg99kjJziKYBiHfJ1tiT3qjK6RRwCXBVpv2gURVV+XSm4qGLCCbStlQuTaMSX4pP
         2TmtY00E9YFcc01f/yN/eBh1Z0DXp5x9izUtCas30jsBflA03VycqSDZQ/4YYe5vxN1C
         sGuw==
X-Gm-Message-State: AOAM5327NfNRlQQ13wisKZhW2nF/DMcQ2Fhr+gcUNXUBTAj8i+/8vsyp
        43EiGha/Ongx0BHHxlTSUFCoR/DJQcQ=
X-Google-Smtp-Source: ABdhPJzfGNjDEXuVumCx9qPUKOKgliLIg/XM4ODF25X8I1erY6O2geyu3iJrSQXXVHdpWC3b1GjOHg==
X-Received: by 2002:aa7:cd85:: with SMTP id x5mr19823564edv.0.1600619195696;
        Sun, 20 Sep 2020 09:26:35 -0700 (PDT)
Received: from myhost.home ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id k6sm6886752ejr.104.2020.09.20.09.26.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Sep 2020 09:26:35 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org, pavel@ucw.cz
Cc:     dmurphy@ti.com, marek.behun@nic.cz,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] leds: Document standard LED functions
Date:   Sun, 20 Sep 2020 18:26:25 +0200
Message-Id: <20200920162625.14754-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a documentation for standard LED functions with regard
to differences in meaning between cases when devicename section
of an LED name is present or not.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 Documentation/leds/led-functions.rst | 226 +++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100644 Documentation/leds/led-functions.rst

diff --git a/Documentation/leds/led-functions.rst b/Documentation/leds/led-functions.rst
new file mode 100644
index 000000000000..42621dd81235
--- /dev/null
+++ b/Documentation/leds/led-functions.rst
@@ -0,0 +1,226 @@
+============================================
+Standardized LED functions and their meaning
+============================================
+
+Each LED function is described using below template:
+
+LED function name
+-----------------
+
+    NDEV : <function meaning when LED devicename section is absent>
+    DEV  : <function meaning when LED devicename section is present>
+    DEVICENAME : <expected LED devicename for DEV case>
+    TRIGGER: <matching LED trigger>
+
+LED functions with corresponding LED trigger support
+----------------------------------------------------
+
+- activity
+    NDEV : system activity
+    DEV  : n/a
+    TRIGGER : "activity"
+
+- backlight
+    NDEV : when there is a single one on the platform
+    DEV  : backlight of a frame buffer device
+    DEVICENAME : associated frame buffer device, e.g. fb0
+    TRIGGER: "backlight"
+
+- disk
+    NDEV : rw activity on any disk in the system
+    DEV  : rw activity on specified disk
+    DEVICENAME : associated disk, e.g.: hda, sdb
+    TRIGGER : "disk-activity", applies only to NDEV case
+
+- disk-read / disk-write
+    NDEV : read / write activity on any disk in the system
+    DEV  : read / write  activity on specified disk
+    DEVICENAME : associted disk, e.g.: hda, sdb
+    TRIGGER : "disk-read" / "disk-write" , applies only to NDEV case
+
+- flash
+    NDEV : flash LED (if there is single available on the platform)
+    DEV  : flash LED related to the specified video device
+    DEVICENAME : associated video device, e.g. v4l2-subdev3
+    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
+
+- flash-front
+    NDEV : n/a
+    DEV  : front flash LED related to the specified video device
+    DEVICENAME : associated video device, e.g. v4l2-subdev3
+    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
+
+- flash-rear
+    NDEV : n/a
+    DEV  : rear flash LED related to the specified video device
+    DEVICENAME : associated video device, e.g. v4l2-subdev3
+    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
+
+- heartbeat
+    NDEV : cpu load average expressed as heartbeat-fashion blink frequency
+    DEV  : n/a
+    TRIGGER : "heartbeat"
+
+- lan
+    NDEV : n/a
+    DEV  : network traffic on selected network device
+    DEVICENAME : associated phy, e.g. phy1
+    TRIGGER : "netdev"
+
+- wlan
+    NDEV : activity on any wlan device
+    DEV  : activity on a specified wlan device
+    DEVICENAME: associated phy, e.g. phy1
+    TRIGGER: wlan device drivers may implement their own triggers
+             using phyN-function naming
+
+- mute
+    NDEV : platform audio output mute state
+    DEV  : mute state of specified audio device output
+    DEVICENAME : associated audio device
+    TRIGGER : "audio-mute"
+
+- micmute
+    NDEV : plaform microphone input mute state
+    DEV  : mute state of a microphone belonging to the specified device
+    DEVICENAME : associated audio device
+    TRIGGER : "audio-micmute"
+
+- mtd
+    NDEV : rw actvity on any mtd device in the system
+    DEV  : rw actvity on specified mtd device
+    DEVICENAME : associated mtd device, e.g mtdN
+    TRIGGER : "mtd"
+
+- panic
+    NDEV : signals kernel panic
+    DEV  : n/a
+    TRIGGER : "panic"
+
+- torch
+    NDEV : torch LED (if there is single available on the platform)
+    DEV  : torch LED related to the specified video device
+    DEVICENAME : associated video device, e.g. video1, v4l2-subdev3
+    TRIGGER : "torch"; this LED can be also controlled by v4l2-flash framework
+
+- usb
+    NDEV : activity on any USB port
+    DEV  : activity on a specified USB port
+    DEVICENAME: associated USB device identifier
+    TRIGGER : "usbport"
+
+- numlock
+    NDEV : n/a
+    DEV  : keyboard numlock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-numlock"
+
+- capslock
+    NDEV : n/a
+    DEV  : keyboard capslock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-capslock"
+
+- scrolllock
+    NDEV : n/a
+    DEV  : keyboard scrollock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-scrolllock"
+
+
+LED functions without corresponding trigger support
+---------------------------------------------------
+
+- alarm
+    NDEV : system wide alarm
+    DEV  : n/a
+
+- bluetooth
+    NDEV : activity on platform bluetooth adapter
+    DEV  : activity on bluetooth adapter related to the specified device
+    DEVICENAME : associated device
+
+- boot
+    NDEV : when lit indicates system boot
+    DEV  : n/a
+
+- charging
+    NDEV : battery charging status
+    DEV  : n/a
+
+- debug
+    NDEV : signals if device runs in debug mode
+    DEV  : n/a
+
+- disk-err
+    NDEV : failure on any disk in the system
+    DEV  : failure on specified disk
+    DEVICENAME : associted disk, e.g.: hda, sdb
+
+- fault
+    NDEV : general system fault
+    DEV  : fault on specified system device
+    DEVICENAME : related device name
+
+- indicator
+    NDEV : signals if platform camera sensor is active
+    DEV  : signals if camera sensor related to the specified video device is active
+    DEVICENAME : associated video device, e.g.: v4l2-subdev3
+
+- kbd_backlight
+    NDEV : platform keyboard backlight state
+    DEV  : backlight state related to the specified device
+    DEVICENAME : associated device, e.g. input1
+
+- mail
+    NDEV : signals a new massage in mailbox
+    DEV  : n/a
+
+- programming
+    NDEV : platform firmware update is in progress
+    DEV  : n/a
+
+- power
+    NDEV : power plug presence indicator
+    DEV  : n/a
+
+- rx
+    NDEV : n/a
+    DEV  : activity on rx line of serial port related to the specified tty device
+    DEVICENAME: associated tty device, e.g.: tty1, ttyUSB2
+
+- tx
+    NDEV : n/a
+    DEV  : activity on tx line of serial port related to the specified tty device
+    DEVICENAME: associated tty device, e.g.: tty1, ttyUSB2
+
+- sd
+    NDEV : n/a
+    DEV  : activity on sd card related to the specified device
+    DEVICENAME: associated disk, e.g. sdb
+
+- sleep
+    NDEV : signals any variant of system hibernation or suspend state
+    DEV  : n/a
+
+- standby
+    NDEV : device standby status
+    DEV  : n/a
+
+- status
+    NDEV : system wide status LED
+    DEV  : n/a
+
+- system
+    NDEV : system is fully operating
+    DEV  : n/a
+
+- wan
+    NDEV : activity on any WAN device
+    DEV  : activity on a specified WAN device
+    DEVICENAME: associated WAN device identifier
+
+- wps
+    NDEV : n/a
+    DEV  : wps functionality activation state related to the specified device
+    DEVICENAME : associated device name
-- 
2.11.0

