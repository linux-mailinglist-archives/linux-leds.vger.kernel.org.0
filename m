Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F910320A02
	for <lists+linux-leds@lfdr.de>; Sun, 21 Feb 2021 12:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhBULcM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Feb 2021 06:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35327 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229863AbhBULcG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 21 Feb 2021 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613907040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MZlTRmZQt9QPuv8Q8awd1An02/w9Dcd5phz5eoWqnTk=;
        b=Y26WC8BCf1UCLIJqDpcAGgxoHVAhnbQ2DFNywHEYCIU0welTWLZmO2ic7aMSWoz/Qh9jB2
        qfoQJJV/hlFBi1eMKC6XQ01CnWHg7pnKtjqzx1Q7g5u5E0jxXmtP9UypuicKghoIU81OR4
        /a1+R2Sz6yJgLyEO2m/3HI23nzTDvSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-UBIdroTzNGaC9cjTTm0jqA-1; Sun, 21 Feb 2021 06:30:36 -0500
X-MC-Unique: UBIdroTzNGaC9cjTTm0jqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBFE10066EF;
        Sun, 21 Feb 2021 11:30:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0E55100164C;
        Sun, 21 Feb 2021 11:30:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] HID: elan: Mute LED handling fixes and improvements
Date:   Sun, 21 Feb 2021 12:30:26 +0100
Message-Id: <20210221113029.103703-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

Here is v2 of my series with mute LED handling fixes and improvements
for the hid-elan driver.

New in v2:
- Add Marek Behún's Reviewed-by to all patches,thank you for all the
  reviews Marek.
- Improve error handling in patch 1/3 to return -EIO when ret != 3 and >= 0

Regards,

Hans


Hans de Goede (3):
  HID: elan: Silence mute LED errors being logged when the device is
    unplugged
  HID: elan: Set default_trigger for the mute LED
  HID: elan: Remove elan_mute_led_get_brigtness()

 drivers/hid/hid-elan.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.30.1

