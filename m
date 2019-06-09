Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35AD03AB5F
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbfFITJS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50332 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730949AbfFITJR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so6492258wmf.0;
        Sun, 09 Jun 2019 12:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0NIvPkogD72gm9TrXNi/xeMsOPwsqaM0+k1SH5g6Ss8=;
        b=vF6Ymmv/yhDgJ63a8tczZlYGUtEW7kzZtNSK8gaNBRC4inThLb8IHsRGrch2Jmp6b+
         CkUNDl/l8E/RKAJ/X9EI1X47JIPxZpu0sq8rZE/6K0iskwV8ooHq49EkVp5ioXu2SNhU
         71xWNmbkggwvEmYTd0cEdZLfuIyZ6gkqz4B6mGEyF63lGWxLOC/bQddbM8e+cnHMD0NS
         qlUJ8IFy6ljz2AZI/pDpOlNL5Ds2XoVY4Ox+NjbiTVZEDRbnm+aRUNdtQuIUwIdZHEYv
         2IX8ugFsmWmEBY8JqpYlxY7kYnmUQ9fMwchPTT0CoGoyrdcKMtb4MYwcWqoZKP4fVqYV
         aApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0NIvPkogD72gm9TrXNi/xeMsOPwsqaM0+k1SH5g6Ss8=;
        b=sBfUuwkoY1WUV278nr3RHpERamIUF+iNGg/GsCePqp7pYwIZtZNfRSzenQ5hau5sfU
         REoO1I0EFKZHpzqPw/OPYX2lZ+ZV/8A5rNFLJB+O0TWCYC52oPIuqBDrZiYyFiJ19+Kl
         kbOKVQHoOELfO/tt69rTytkbDc+D8aDVcbiOzMUEO3tae95Ahy7+L/iuT2y25y/16skz
         uQJ+/w+68N84LvBMMfjglcfPESOUSsIrmCoDVSw8I9/BAtiN2tPD0f4BNe3Dp0Gb9u1k
         0IYq/rOBGcUj3eGN8TBVJya1ZxkseYFELTNa/BjI0NhfqKQMTYANDRv66ZCsjS6lZbhA
         EI7A==
X-Gm-Message-State: APjAAAVfgfDMvvWrwZN5n9Vx/QqiNsnaAIS3vkNL1cQ/5SBdxxQqz8sI
        DMHZ2MHlguGNPpJfpwypVicQ0ceH
X-Google-Smtp-Source: APXvYqwAHuoJHlODpD03lnhJV/B5hqOUk0zi8+8iuVB7IxuBq0O3QSBxIIcedYQQ1tVLe+MAL+zZyg==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr11128357wmf.174.1560107354633;
        Sun, 09 Jun 2019 12:09:14 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:13 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 26/26] leds: Document standard LED functions
Date:   Sun,  9 Jun 2019 21:08:03 +0200
Message-Id: <20190609190803.14815-27-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a documentation for standard LED functions with regard
to differences in meaning between cases when devicename section
of LED name is present or not.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 Documentation/leds/led-functions.txt | 223 +++++++++++++++++++++++++++++++++++
 Documentation/leds/leds-class.txt    |   3 +
 2 files changed, 226 insertions(+)
 create mode 100644 Documentation/leds/led-functions.txt

diff --git a/Documentation/leds/led-functions.txt b/Documentation/leds/led-functions.txt
new file mode 100644
index 000000000000..003b6b6271d1
--- /dev/null
+++ b/Documentation/leds/led-functions.txt
@@ -0,0 +1,223 @@
+This file presents standardized LED functions and their meaning.
+
+Each LED function is described using below template:
+
+- LED function name
+    NDEV : <function meaning when LED devicename section is absent>
+    DEV  : <function meaning when LED devicename section is present>
+    DEVICENAME : <expected LED devicename for DEV case>
+    TRIGGER: <matching LED trigger>
+
+/* LED functions with corresponding trigger support */
+
+- activity
+    NDEV : system activity
+    DEV  : n/a
+    TRIGGER : "activity"
+
+- backlight
+    NDEV : n/a
+    DEV  : backlight of a frame buffer device
+    DEVICENAME : associated frame buffer device, e.g. fb0
+    TRIGGER: "backlight"
+
+- capslock
+    NDEV : n/a
+    DEV  : keyboard capslock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-capslock"
+
+- disk
+    NDEV : rw activity on any disk in the system
+    DEV  : rw activity on specified disk
+    DEVICENAME : associated disk, e.g.: hda, sdb
+    TRIGGER : "disk-activity", applies only to NDEV case
+
+- disk-read
+    NDEV : read activity on any disk in the system
+    DEV  : read activity on specified disk
+    DEVICENAME : associted disk, e.g.: hda, sdb
+    TRIGGER : "disk-read", applies only to NDEV case
+
+- disk-write
+    NDEV : write activity on any disk in the system
+    DEV  : write activity on specified disk
+    DEVICENAME : associated disk, .e.g" hda, sdb
+    TRIGGER : "disk-write", applies only to NDEV case
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
+- mute
+    NDEV : platform audio output mute state
+    DEV  : mute state of specified audio device output
+    DEVICENAME : associated audio device
+    TRIGGER : "audio-mute"
+
+- numlock
+    NDEV : n/a
+    DEV  : keyboard numlock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-numlock"
+
+- panic
+    NDEV : signals kernel panic
+    DEV  : n/a
+    TRIGGER : "panic"
+
+- scrolllock
+    NDEV : n/a
+    DEV  : keyboard scrollock state related to the specified input device
+    DEVICENAME : associated input device, e.g. input1
+    TRIGGER : "kbd-scrolllock"
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
+/* LED functions without corresponding trigger support */
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
+- tx
+    NDEV : n/a
+    DEV  : activity on tx line of serial port related to the specified tty device
+    DEVICENAME: associated tty device, e.g.: tty1, ttyUSB2
+
+- wan
+    NDEV : activity on any WAN device
+    DEV  : activity on a specified WAN device
+    DEVICENAME: associated WAN device identifier
+
+- wlan
+    NDEV : activity on any wlan device
+    DEV  : activity on a specified wlan device
+    DEVICENAME: associated wlan device identifier
+
+- wps
+    NDEV : n/a
+    DEV  : wps functionality activation state related to the specified device
+    DEVICENAME : associated device name
diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index e7316e37b57d..30684db9dfca 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -62,6 +62,9 @@ function: one of the LED_FUNCTION* definitions from the header
 If required color or function is missing, please submit a patch
 to linux-leds@vger.kernel.org, adding required entries.
 
+The exact meaning of LED function name depends on whether it has devicename
+section filled or left blank. See Documentation/leds/led-functions.txt.
+
 It is possible that more than one LED with the same color and function will
 be required for given platform, differing only with an ordinal number.
 In this case it is preferable to just concatenate the predefined LED_FUNCTION*
-- 
2.11.0

