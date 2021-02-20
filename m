Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F78F320638
	for <lists+linux-leds@lfdr.de>; Sat, 20 Feb 2021 17:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhBTQdw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 20 Feb 2021 11:33:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229927AbhBTQdw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 20 Feb 2021 11:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613838746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WhMG8x2Y9+zAbxFa8WeeiJJ9q6pmNxG6wm/onpeMyVQ=;
        b=UtwaFKt++GdFTQwQU2+HsgeIXu4Ci8TSBOSkPkEMvgFCsKYwfaISF4Z+mB0Zd8aGk+jBuM
        VtEvfXlptNsS1cBqUrx0I3VACiTkNbdEtMCy3J3Dc5mxS5T6RuTjFvTkwip174B8SmX3ly
        CULuIevYsfsw4PqDVzuBd3EUT16/SlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-CRAw_weDMyGhi0NyZIEkHg-1; Sat, 20 Feb 2021 11:32:22 -0500
X-MC-Unique: CRAw_weDMyGhi0NyZIEkHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A01C518449FA;
        Sat, 20 Feb 2021 16:32:21 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C0076064B;
        Sat, 20 Feb 2021 16:32:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/3] HID: elan: Set default_trigger-s for the mute LED
Date:   Sat, 20 Feb 2021 17:32:10 +0100
Message-Id: <20210220163211.323178-2-hdegoede@redhat.com>
In-Reply-To: <20210220163211.323178-1-hdegoede@redhat.com>
References: <20210220163211.323178-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The mute LED should be automatically turned on/off based
on the audio-cards mixer settings.

Add the standardized default-trigger name for this, so that the alsa
code can turn the LED on/off as appropriate (on supported audio cards).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 71740988a3f6..6958649ece22 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -460,6 +460,7 @@ static int elan_init_mute_led(struct hid_device *hdev)
 	struct led_classdev *mute_led = &drvdata->mute_led;
 
 	mute_led->name = "elan:red:mute";
+	mute_led->default_trigger = "audio-mute";
 	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
-- 
2.30.1

