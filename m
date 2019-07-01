Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA5A35C471
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 22:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfGAUrN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 16:47:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40460 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGAUrJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 16:47:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61Kl4SM083431;
        Mon, 1 Jul 2019 15:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562014024;
        bh=LuHH3r33vwOOe+i2u9TPcJZYAfcej3+kWlJL9N4xdmc=;
        h=From:To:CC:Subject:Date;
        b=tv6IYFe5C74r7B1eseFLx6yqqeXHw1n+BaJthj7Uhj8GrNkxd1YQ/L6GKTok0994G
         AmOqRyl7B/ovHqIrnS5fVQbGDKUaWM0Gu/4UPLqUNVV2WzbrS32jX1olU+xOOlGmOt
         hR928V+G7unYqf+xWgN+YwyGvuBYDLFdRN8VfKAM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61Kl41J023383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 15:47:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 15:47:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 15:47:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61Kl31v120347;
        Mon, 1 Jul 2019 15:47:03 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 0/2] Multicolor Documentation update
Date:   Mon, 1 Jul 2019 15:46:32 -0500
Message-ID: <20190701204634.10517-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

After some off line conversations with the LED maintainers I update the
documentation for the multicolor framework with what I hope to be a good
compromise.

I have add the "color_mix" (name is not set but could not think of a better one)
file for writing the monochrome LEDs as a group.  Also I have added a "color_id"
file for each monochrome LED as read only so that the LED indexes in the array 
are known when writing to the color_mix file.  This will help in determining the
order of the LEDs in the array.

I am not carrying any RoB/SoB in this patchset as these interfaces are changing.

Dan

Dan Murphy (2):
  leds: multicolor: Add sysfs interface definition
  documention: leds: Add multicolor class documentation

 .../ABI/testing/sysfs-class-led-multicolor    |  67 ++++++++
 Documentation/leds/leds-class-multicolor.txt  | 145 ++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/leds/leds-class-multicolor.txt

-- 
2.22.0.214.g8dca754b1e

