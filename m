Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D955293115
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbgJSWTb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387994AbgJSWTa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:30 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECAFC0613D0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a3so1214459ejy.11
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=S0kypUfNkZdJmUpKO3eVHMW2czEr6tq/BzlHf8MHEqtsdbU0PeC+hTd55kMU20qjgF
         6TiPruAuBiuxKrEhXZirHPSxAgy2XQOsGCVTzxu5yR9RU9TVvHA9LK2w+roXwGHA0MA9
         wwOfYGzu494qrSbLuYNL01ICNvZhw4iTwyyS+Hn/kRaxkQ61FZnNjWR42lvEwUL0/+tf
         Pc4LB2vfKXzMCefwK8MvP7BBzu3h40+PeP2XlVpJbSaMPJ23GxfiZIXU29GtZz4wqY+g
         ovDuqPnJT+4AGyoqvZvblTQucsf0SeUhR9gDC7dLf5bXoBToPQBJIKXJST7ObGis8Sb+
         o9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=bIi3pzf/BfgmNnLJp0Ts6cC0N1hXuNvHWsN6TefZyEfxQ6TgWwpoGKDCL9efQVpFzQ
         7ZT0oKceA10I9qekJOK49RKQC/VcOpuwriGOifzuTWYqbq4CzQ50iW5CsptdcdA4FrNE
         JneJepw30D/+3tazPIQ8aNDOzSwQ4lKqQFfy6uo42bCDQEsMQL0JVsrofbgXaYMEtapt
         RmBMUQkqnAOPBv4ZT3OjZA5fEhvMZMpb5W4lc4P/9h1Ymk8I4zOQy25qwLZOnx7F1o+S
         x7ruu2lsAH0e4lRiyuT1pOmJYQS3whdOWI2UQELyxk2rhMOPN3GclPoB3MGC4D7MdIhU
         /FEg==
X-Gm-Message-State: AOAM5317BnNmF591T0jxSPDw09QoGSHMcRM7a98p3rVRz1LLoai1iUbw
        4PPuYfDOs2vmTAQ9Ej2YKDQ/SQ==
X-Google-Smtp-Source: ABdhPJyWciawZSL77AlTNCSJu5YLz/xNn2WK1QFB/mgPaO5Qjx8SQpGMld8ir8BjAWHIL2sB+M7GTg==
X-Received: by 2002:a17:906:190b:: with SMTP id a11mr19616eje.260.1603145968029;
        Mon, 19 Oct 2020 15:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:27 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 5/6] Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface documentation
Date:   Tue, 20 Oct 2020 00:18:58 +0200
Message-Id: <20201019221859.56680-6-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
monitoring and control of the microcontroller from user space.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../testing/sysfs-driver-iei-wt61p803-puzzle  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle

diff --git a/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
new file mode 100644
index 000000000000..6e71d85f3296
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
@@ -0,0 +1,55 @@
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/mac_address_*
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned MAC address values
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/serial_number
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned serial number
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware version
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/protocol_version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU communication protocol version
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_loss_recovery
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Host platform power loss recovery settings
+		Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/bootloader_mode
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU bootloader mode status
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Power status indicates the host platform power on method.
+		Value mapping (bitwise list):
+		0x80 - Null
+		0x40 - Firmware flag
+		0x20 - Power loss detection flag (powered off)
+		0x10 - Power loss detection flag (AC mode)
+		0x08 - Button power on
+		0x04 - WOL power on
+		0x02 - RTC alarm power on
+		0x01 - AC recover power on
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware build date
+		Format: yyyy/mm/dd hh:mm
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Host platform AC recovery status value
-- 
2.26.2

