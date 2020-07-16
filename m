Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4162022219D
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 13:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgGPLkv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 07:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgGPLkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 07:40:51 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867B3C061755
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2020 04:40:51 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 7D38E140AB3;
        Thu, 16 Jul 2020 13:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594899649; bh=IQReeDJ9c8I9/xKdViVi48C2pN777OMUIhXFTeEMiOM=;
        h=From:To:Date;
        b=aaCR84PO8/lcnF9iJimEEYlZAvx2PWXCIHw2DY+gzHraxcXTtR8HWEpD6jkbhvOLg
         FbTRjTUdTAe91KiSkMF467zNIyCAqRnDQ+0bCnQyJtCSFzIArO6COQ7GRt8JvfnTBf
         mceoFsuVPOJgTKqF25QFiZ2DGFEAatX2R+XUz8NQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v5 3/3] Documentation: ABI: leds-turris-omnia: document sysfs attribute
Date:   Thu, 16 Jul 2020 13:40:47 +0200
Message-Id: <20200716114047.22943-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716114047.22943-1-marek.behun@nic.cz>
References: <20200716114047.22943-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the global brightness attribute for the Turris Omnia LED
controller.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 .../testing/sysfs-class-led-driver-turris-omnia    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
new file mode 100644
index 000000000000..795a5de12fc1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
@@ -0,0 +1,14 @@
+What:		/sys/class/leds/<led>/device/brightness
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(RW) On the front panel of the Turris Omnia router there is also
+		a button which can be used to control the intensity of all the
+		LEDs at once, so that if they are too bright, user can dim them.
+
+		The microcontroller cycles between 8 levels of this global
+		brightness (from 100% to 0%), but this setting can have any
+		integer value between 0 and 100. It is therefore convenient to be
+		able to change this setting from software.
+
+		Format: %i
-- 
2.26.2

